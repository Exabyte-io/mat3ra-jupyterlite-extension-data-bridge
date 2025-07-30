#!/bin/bash
# This script rebuilds the extension
virtualenv .venv-3.10.12
source .venv-3.10.12/bin/activate
# These versions used in JL and API-examples configs
pip install jupyterlab~=4.0.6 jupyterlite-core~=0.1.3
jlpm add @jupyterlab/application@~4.0.6 @jupyterlab/notebook@~4.0.6 @mat3ra/esse
jlpm run build
