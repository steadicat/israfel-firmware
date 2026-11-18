# KBDcraft Israfel Firmware

This repository is a complete Vial-QMK source tree for the KBDcraft Israfel.

It is based on a fork of Vial-QMK and combines that firmware tree with the official KBDcraft Israfel source files from [KBDcraft's open-source download page](https://kbdcraft.store/pages/open-source-%E5%BC%80%E6%BA%90-%EC%98%A4%ED%94%98-%EC%86%8C%EC%8A%A4-%E3%82%AA%E3%83%BC%E3%83%97%E3%83%B3%E3%82%BD%E3%83%BC%E3%82%B9).

The goal is to keep the Israfel firmware layered on the latest Vial-QMK `vial` branch, with the source ready to clone and build directly without manually combining Vial-QMK and KBDcraft files.

The original Israfel source includes both `default` and `vial` keymaps. This README documents the Vial build because that is the firmware target for this repository.

## Download

Download the latest prebuilt `kbdcraft_israfel_vial.uf2` firmware from the [latest GitHub release](https://github.com/steadicat/israfel-firmware/releases/latest).

## Build

Clone this fork with its Git submodules. GitHub source ZIPs do not include the submodule contents required to build.

```sh
git clone --branch vial --recurse-submodules https://github.com/steadicat/israfel-firmware.git
cd israfel-firmware
```

If you already have a Git clone, run `git submodule update --init --recursive` from the repository root.

Install the ARM toolchain, Python, and the QMK CLI. The `make` build calls the QMK CLI internally.

On macOS, install Apple's command line tools first if you do not already have `git` and `make`:

```sh
xcode-select --install
```

Then install Python and the ARM compiler/binutils:

```sh
brew install python osx-cross/arm/arm-none-eabi-gcc@8 osx-cross/arm/arm-none-eabi-binutils
```

Install the QMK CLI and Python build dependencies in a virtual environment:

```sh
python3 -m venv .venv
. .venv/bin/activate
python3 -m pip install qmk -r requirements.txt
```

On macOS, the Israfel keyboard rules add the Homebrew ARM toolchain paths automatically during the build.

Build the Israfel Vial firmware from the repository root with the virtual environment active:

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
