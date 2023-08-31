# pykwasm


## Installation

Prerequsites: `python 3.8.*`, `pip >= 20.0.2`, `poetry >= 1.3.2`.

```bash
make build
pip install dist/*.whl      # install pykwasm globally
```

## Binary parser: `wasm2kast`

This command converts a binary Wasm module into the Kast format accepted by KWasm. After installing the package
with `poetry install`, run the command with the file path to a binary Wasm file:

```bash
poetry run wasm2kast <path_to_binary.wasm>
```


## For Developers

Use `make` to run common tasks (see the [Makefile](Makefile) for a complete list of available targets).

* `make build`: Build wheel
* `make check`: Check code style
* `make format`: Format code
* `make test-unit`: Run unit tests

For interactive use, spawn a shell with `poetry shell` (after `poetry install`), then run an interpreter.
