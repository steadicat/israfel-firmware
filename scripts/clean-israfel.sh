#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/israfel-env.sh
. "${SCRIPT_DIR}/israfel-env.sh"

cd "${ISRAFEL_REPO_ROOT}"

rm -f kbdcraft_israfel_default.* \
      kbdcraft_israfel_vial.* \
      .build/kbdcraft_israfel_default.* \
      .build/kbdcraft_israfel_vial.* \
      .build/kbdcraft_israfel_*.*
