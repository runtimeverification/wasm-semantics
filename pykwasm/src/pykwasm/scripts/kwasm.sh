set -euo pipefail
shopt -s extglob

notif() { echo "== $@" >&2 ; }
fatal() { echo "[FATAL] $@" ; exit 1 ; }

kdist_dir="$(kdist which)"
defn_dir="${KWASM_DEFN_DIR:-$kdist_dir}/wasm-semantics"

test_logs='.kwasm-logs'
mkdir -p "$test_logs"
test_log="$test_logs/tests.log"

export K_OPTS="${K_OPTS:--Xmx16G -Xss512m}"

# Utilities
# ---------

preprocess() {
    local tmp_dir tmp_input
    tmp_dir="$(mktemp -d)"
    tmp_input="$tmp_dir/$(basename $run_file))"
    touch "$tmp_input"
    kwasm-preprocess "$run_file" > "$tmp_input"
    run_file="$tmp_input"
}

# Runners
# -------

run_kast() {
    local output_mode

    preprocess
    output_mode="${1:-kast}" ; shift
    kast --definition "$defn_dir/llvm" "$run_file" --output "$output_mode" "$@"
}

run_prove() {
    local additional_proof_args

    def_module="$1" ; shift

    additional_proof_args=()
    ! $repl       || additional_proof_args+=(--debugger)
    ! $bug_report || additional_proof_args+=(--haskell-backend-command "kore-exec --bug-report $bug_report_name")

    kprove --definition "$defn_dir/$def_module" "$run_file" "${additional_proof_args[@]}" "$@"
}

# Main
# ----

usage() {
    echo "
    usage: $0 kast       [--backend (llvm|haskell)]                  <pgm>  <output format> <K args>*
           $0 prove      [--backend (haskell)] [--repl|--bug-report] <spec> <axioms_file> <K args>*

           $0 [help|--help|version|--version]

       $0 kast       : Parse a single WebAssembly program and output it in supported format
       $0 prove      : Run a WebAssembly K proof

       $0 help    : Display this help message.
       $0 version : Display the KWasm, K, Kore, and Z3 versions in use.

       Note: <pgm> is a path to a file containing a WebAssembly program.
             <spec> is a K specification to be proved.
             <K args> are any arguments you want to pass to K when executing/proving.
             <output format> is the format for Kast to output the term in.
             <axioms_file> is the file name (without extension) to take as axioms for verification.
"
}

usage_fatal() {
    usage
    fatal "$@"
}

[[ ! -z ${1:-} ]] || usage_fatal "Must supply a command to run."
if [[ "$1" == '--help' ]] || [[ "$1" == 'help' ]]; then
    usage
    exit 0
fi

if [[ "$1" == 'version' ]] || [[ "$1" == '--version' ]]; then
    notif "KWasm Version"
    git rev-parse --short HEAD
    notif "K Version"
    kompile --version
    notif "Kore Version"
    kore-exec --version
    notif "Z3 Version"
    z3 --version
    exit 0
fi

run_command="$1"; shift

[[ ! -z ${1:-} ]] || usage_fatal "Must supply a file to work on."

backend="llvm"
repl=false
bug_report=false
[[ ! "$run_command" == 'prove' ]] || backend='haskell'
args=()
while [[ $# -gt 0 ]]; do
    arg="$1"
    case $arg in
        --backend)    backend="$2"    ; shift 2 ;;
        --repl)       repl=true       ; shift   ;;
        --bug-report) bug_report=true ; shift   ;;
        *)            args+=("$1")    ; shift   ;;
    esac
done
set -- "${args[@]}"

! $repl       || [[ "$backend" == "haskell" ]] || fatal "--repl option only available for Haskell backend."
! $bug_report || [[ "$backend" == "haskell" ]] || fatal "--bug-report option only available for Haskell backend."

# get the run file
[[ ! -z ${1:-} ]] || usage_fatal "Must supply a file to run on."
run_file="$1" ; shift
if [[ "$run_file" == '-' ]]; then
    tmp_input="$(mktemp)"
    trap "rm -rf $tmp_input" INT TERM EXIT
    cat - > "$tmp_input"
    run_file="$tmp_input"
fi
[[ -f "$run_file" ]] || fatal "File does not exist: $run_file"
bug_report_name="kwasm-bug-$(basename "$run_file")"

case "$run_command-$backend" in
    kast-@(llvm|haskell)       ) run_kast        "$@" ;;
    prove-@(haskell)           ) run_prove       "$@" ;;
    *) usage_fatal "Unknown command on '$backend' backend: $run_command" ;;
esac
