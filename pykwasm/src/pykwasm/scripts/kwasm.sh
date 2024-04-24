set -euo pipefail
shopt -s extglob

notif() { echo "== $@" >&2 ; }
fatal() { echo "[FATAL] $@" ; exit 1 ; }

# Main
# ----

usage() {
    echo "
    usage: $0 [help|--help|version|--version]

       $0 help    : Display this help message.
       $0 version : Display the KWasm, K, Kore, and Z3 versions in use.
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
