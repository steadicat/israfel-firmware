#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/israfel-env.sh
. "${SCRIPT_DIR}/israfel-env.sh"

cd "${ISRAFEL_REPO_ROOT}"

for required_tool in git make python3 qmk arm-none-eabi-gcc; do
    if ! command -v "${required_tool}" >/dev/null 2>&1; then
        printf 'missing required tool: %s\n' "${required_tool}" >&2
        exit 1
    fi
done

python3 -m json.tool keyboards/kbdcraft/israfel/info.json >/dev/null
python3 -m json.tool keyboards/kbdcraft/israfel/keymaps/vial/vial.json >/dev/null

if git submodule status --recursive | grep -q '^-'; then
    make git-submodule
fi

"${SCRIPT_DIR}/build-israfel.sh" default
"${SCRIPT_DIR}/build-israfel.sh" vial
