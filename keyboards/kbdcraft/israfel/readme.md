# KBDcraft Israfel

An ergonomic split 50% low-profile keyboard from KBDcraft.

* Keyboard Maintainer: KBDcraft
* Hardware Supported: STM32F401, tinyuf2 bootloader
* Hardware Availability: https://kbdcraft.store/products/israfel

Make example for this keyboard after setting up the Vial-QMK build environment:

    make kbdcraft/israfel:default
    make kbdcraft/israfel:vial

This fork also provides helper scripts from the repository root:

    scripts/build-israfel.sh vial
    scripts/test-israfel.sh

## Bootloader

Enter the bootloader by unplugging the keyboard, holding the first key in the matrix, usually Escape, and plugging the keyboard back in. Copy the generated `.uf2` firmware file to the mounted bootloader drive.

## Vial

The `vial` keymap enables Vial and VialRGB. After flashing, connect with Vial at:

    https://get.vial.today
