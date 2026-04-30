#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/israfel-env.sh
. "${SCRIPT_DIR}/israfel-env.sh"

keymap="${1:-vial}"

case "${keymap}" in
    vial) ;;
    *)
        printf 'usage: %s [vial]\n' "$0" >&2
        exit 2
        ;;
esac

cd "${ISRAFEL_REPO_ROOT}"
make "kbdcraft/israfel:${keymap}"

printf '\nBuilt artifacts:\n'
find "${ISRAFEL_REPO_ROOT}" "${ISRAFEL_REPO_ROOT}/.build" -maxdepth 1 \
    -type f \( -name "kbdcraft_israfel_${keymap}.*" -o -name "kbdcraft_israfel_*_${keymap}.*" \) \
    -print 2>/dev/null | sort
