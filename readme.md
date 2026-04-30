# KBDcraft Israfel Firmware

This repository is a complete Vial-QMK source tree for the KBDcraft Israfel.

It is based on a fork of Vial-QMK and combines that firmware tree with the official KBDcraft Israfel source files from [KBDcraft's open-source download page](https://kbdcraft.store/pages/open-source-%E5%BC%80%E6%BA%90-%EC%98%A4%ED%94%98-%EC%86%8C%EC%8A%A4-%E3%82%AA%E3%83%BC%E3%83%97%E3%83%B3%E3%82%BD%E3%83%BC%E3%82%B9).

The goal is to keep the Israfel firmware layered on the latest Vial-QMK `vial` branch, with the full source code ready to clone or download and build directly without manually combining Vial-QMK and KBDcraft files.

The original Israfel source includes both `default` and `vial` keymaps. This README documents the Vial build because that is the firmware target for this repository.

## Build

Install the build dependencies. The direct `make` build does not require the QMK CLI.

On macOS, install Apple's command line tools first if you do not already have `git` and `make`:

```sh
xcode-select --install
```

Then install Python and the ARM compiler/binutils:

```sh
brew install python arm-none-eabi-gcc@8 arm-none-eabi-binutils
```

Install the Python packages used by the bundled QMK/Vial build scripts:

```sh
python3 -m pip install -r requirements.txt
```

On macOS, the Israfel keyboard rules add the Homebrew ARM toolchain paths automatically during the build.

You can also build with the QMK CLI, but it still uses the same compiler toolchain and does not remove these dependencies.

From the repository root, initialize submodules if needed:

```sh
make git-submodule
```

Build the Israfel Vial firmware:

```sh
make kbdcraft/israfel:vial
```

The generated UF2 firmware is usually copied to the repository root as:

```text
kbdcraft_israfel_vial.uf2
```

## Flash

1. Unplug the keyboard.
2. Hold the first key, usually Escape, while plugging the keyboard back in.
3. Release the key when the UF2 bootloader drive appears.
4. Copy `kbdcraft_israfel_vial.uf2` to the bootloader drive.
5. Wait for the keyboard to reboot.

After flashing, open Vial at https://get.vial.today and connect to `07 Israfel`.
