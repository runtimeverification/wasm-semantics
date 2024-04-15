import sys
from pathlib import Path

from pyk.utils import run_process

SCRIPT_FILE = Path(__file__).parent / 'kwasm.sh'


def main() -> None:
    proc_res = run_process(['bash', str(SCRIPT_FILE)] + sys.argv[1:], pipe_stdout=False, check=False)
    sys.exit(proc_res.returncode)


if __name__ == '__main__':
    main()
