#!/usr/bin/env sh

STYLUA_CMD="stylua"
STYLUA_CFG="./stylua.toml"

if ! command -v "${STYLUA_CMD}" >/dev/null 2>&1; then
    echo "Stylua Command '${STYLUA_CMD}' does not exist"
    exit 1
fi

if [ ! -f "${STYLUA_CFG}" ]; then
    echo "Stylua Config File '${STYLUA_CFG}' does not exist"
    exit 1
fi

"${STYLUA_CMD}" --config-path "${STYLUA_CFG}" .

