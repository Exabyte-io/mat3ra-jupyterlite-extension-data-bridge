#!/bin/bash
# This script rebuilds the extension
virtualenv .venv-3.10.12
source .venv-3.10.12/bin/activate
pip install jupyterlab==4 jupyterlite-core
jlpm add @jupyterlab/application @jupyterlab/notebook @mat3ra/esse
jlpm run build
