# KBDcraft Israfel Vial-QMK Source

This repository is based on a fork of `vial-kb/vial-qmk` and adds KBDcraft Israfel firmware at:

    keyboards/kbdcraft/israfel

The Israfel sources were imported from KBDcraft's official developer source files. KBDcraft lists the Israfel firmware and developer `Code.zip` on [KBDcraft's open-source download page](https://kbdcraft.store/pages/open-source-%E5%BC%80%E6%BA%90-%EC%98%A4%ED%94%98-%EC%86%8C%EC%8A%A4-%E3%82%AA%E3%83%BC%E3%83%97%E3%83%B3%E3%82%BD%E3%83%BC%E3%82%B9).

The goal is to keep the Israfel firmware layered on the latest Vial-QMK `vial` branch, with a complete source tree that can be cloned or downloaded and built directly without manually combining Vial-QMK and KBDcraft files.

## Build

Install the direct `make` build dependencies. On macOS:

    xcode-select --install
    brew install python arm-none-eabi-gcc@8 arm-none-eabi-binutils
    python3 -m pip install -r requirements.txt

On macOS, the Israfel keyboard rules add the Homebrew ARM toolchain paths automatically during the build.

Initialize submodules if needed:

    make git-submodule

Build the Israfel Vial firmware:

    make kbdcraft/israfel:vial

The generated UF2 firmware is copied to the repository root, usually as:

    kbdcraft_israfel_vial.uf2

## Flash

1. Unplug the keyboard.
2. Hold the first key, usually Escape, while plugging the keyboard back in.
3. Release the key when the UF2 bootloader drive appears.
4. Copy `kbdcraft_israfel_vial.uf2` to that drive.
5. Wait for the keyboard to reboot.

## Tune

The original Israfel source includes both `default` and `vial` keymaps. The `vial` keymap enables VIA, Vial, VialRGB, QMK settings, tap dance, combos, and key overrides. After flashing, open:

    https://get.vial.today

Connect to `07 Israfel`, then use Vial for keymap, layer, matrix tester, and RGB tuning.
