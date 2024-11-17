#!/bin/bash
# This script creates a JupyterLab extension using the cookiecutter template
# JupyterLab environment.

PYTHON_VERSION="3.10.12"
NODE_VERSION="18"
EXTENSION_NAME="data_bridge"
THIS_SCRIPT_DIR_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
PACKAGE_ROOT_PATH="$(realpath "${THIS_SCRIPT_DIR_PATH}/../")"
BUILD_DIR_PATH="${PACKAGE_ROOT_PATH}/dist"

source "${THIS_SCRIPT_DIR_PATH}"/cookiecutter_setup.sh
source "${THIS_SCRIPT_DIR_PATH}"/functions.sh


# Ensure Python and Node.js versions are installed
ensure_python_version_installed ${PYTHON_VERSION}
ensure_node_version_installed ${NODE_VERSION}
create_virtualenv "${PACKAGE_ROOT_PATH}/.venv-${PYTHON_VERSION}"

# Build extension using cookiecutter template and sources
mkdir -p "${BUILD_DIR_PATH}" && cd "${BUILD_DIR_PATH}" || exit 1
create_extension_template "${COOKIECUTTER_OPTIONS[@]}"
build_extension ${EXTENSION_NAME} "${PACKAGE_ROOT_PATH}"

# Exit with zero (for GH workflow)
exit 0
