#!/usr/bin/env bash

set -euo pipefail

ISRAFEL_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
export ISRAFEL_REPO_ROOT="$(cd -- "${ISRAFEL_SCRIPT_DIR}/.." && pwd)"

for tool_dir in \
    /opt/homebrew/opt/arm-none-eabi-gcc@8/bin \
    /opt/homebrew/opt/arm-none-eabi-binutils/bin \
    /usr/local/opt/arm-none-eabi-gcc@8/bin \
    /usr/local/opt/arm-none-eabi-binutils/bin; do
    if [[ -d "${tool_dir}" ]]; then
        case ":${PATH}:" in
            *":${tool_dir}:"*) ;;
            *) export PATH="${tool_dir}:${PATH}" ;;
        esac
    fi
done

export QMK_HOME="${QMK_HOME:-${ISRAFEL_REPO_ROOT}}"

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    printf 'ISRAFEL_REPO_ROOT=%s\n' "${ISRAFEL_REPO_ROOT}"
    printf 'QMK_HOME=%s\n' "${QMK_HOME}"
    printf 'PATH=%s\n' "${PATH}"
fi
