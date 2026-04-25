# KBDcraft Israfel Vial-QMK Fork

This fork is based on `vial-kb/vial-qmk` and adds KBDcraft Israfel firmware at:

    keyboards/kbdcraft/israfel

The Israfel sources were imported from the local KBDcraft `Code/israfel` source snapshot. KBDcraft lists Israfel firmware and developer source on its open-source download page:

    https://kbdcraft.store/pages/open-source-%E5%BC%80%E6%BA%90-%EC%98%A4%ED%94%88-%EC%86%8C%EC%8A%A4-%E3%82%AA%E3%83%BC%E3%83%97%E3%83%B3%E3%82%BD%E3%83%BC%E3%82%B9

## Build

On macOS, the helper scripts add the Homebrew ARM toolchain paths for `arm-none-eabi-gcc@8` and `arm-none-eabi-binutils`.

Build the Vial keymap:

    scripts/build-israfel.sh

Build a specific keymap:

    scripts/build-israfel.sh default
    scripts/build-israfel.sh vial

Run the local validation/build smoke test:

    scripts/test-israfel.sh

The generated UF2 firmware is copied to the repository root, usually as:

    kbdcraft_israfel_vial.uf2

## Flash

1. Unplug the keyboard.
2. Hold the first key, usually Escape, while plugging the keyboard back in.
3. Release the key when the UF2 bootloader drive appears.
4. Copy `kbdcraft_israfel_vial.uf2` to that drive.
5. Wait for the keyboard to reboot.

## Tune

The `vial` keymap enables VIA, Vial, VialRGB, QMK settings, tap dance, combos, and key overrides. After flashing, open:

    https://get.vial.today

Connect to `07 Israfel`, then use Vial for keymap, layer, matrix tester, and RGB tuning.
