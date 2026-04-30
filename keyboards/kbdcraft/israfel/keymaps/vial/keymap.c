// Copyright 2024 FxStudio <FXS@fx-studio.cn>
// SPDX-License-Identifier: GPL-2.0-or-later

#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [0] = LAYOUT(
        KC_ESC,  KC_1,     KC_2,    KC_3,   KC_4,   KC_5,    KC_6,    KC_7,    KC_8,   KC_9,   KC_0,   KC_BSPC,
		KC_TAB,  KC_Q,     KC_W,    KC_E,   KC_R,   KC_T,    KC_Y,    KC_U,    KC_I,   KC_O,   KC_P,   KC_ENT,
		KC_CAPS, KC_A,     KC_S,    KC_D,   KC_F,   KC_G,    KC_H,    KC_J,    KC_K,   KC_L,   KC_QUOTE,
		KC_LSFT, KC_SLSH,  KC_Z,    KC_X,   KC_C,   KC_V,    KC_B,    KC_N,    KC_M,   KC_COMMA, KC_UP,  KC_DOT,
		MO(1),   KC_LCTL,  KC_LGUI, KC_SPC, KC_SPC, KC_RGUI, KC_LEFT, KC_DOWN, KC_RGHT),
    [1] = LAYOUT(
		KC_GRAVE, KC_NO, KC_NO, KC_NO, KC_NO,   KC_NO,   KC_NO,   KC_NO,    KC_NO,   KC_MINUS,    KC_EQUAL,    KC_DELETE,
		KC_NO,    KC_NO, KC_NO, KC_NO, KC_NO,   KC_NO,   KC_NO,   KC_NO,    KC_NO,   KC_LBRC,     KC_RBRC,     KC_BSLS,
		KC_NO,    KC_NO, KC_NO, KC_NO, KC_NO,   KC_NO,   KC_NO,   KC_NO,    KC_NO,   KC_NO,       KC_SCLN,
		KC_NO,    KC_NO, KC_NO, KC_NO, KC_NO,   KC_NO,   RGB_SAI, RGB_SAD,  RGB_VAI, RGB_VAD,     RGB_MOD,     RGB_TOG,
		KC_NO,    KC_NO, KC_NO, KC_NO,                   RGB_SPI,           RGB_SPD, RGB_HUI,     RGB_RMOD,    RGB_HUD),
    [2] = LAYOUT(
		KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
		KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
		KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
		KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
		KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO)
};

bool caps_word_press_user(uint16_t keycode) {
    switch (keycode) {
        // Dvorak letter keys, in Qwerty keycode terms.
        case KC_R:
        case KC_T:
        case KC_Y:
        case KC_U:
        case KC_I:
        case KC_O:
        case KC_P:
        case KC_A:
        case KC_S:
        case KC_D:
        case KC_F:
        case KC_G:
        case KC_H:
        case KC_J:
        case KC_K:
        case KC_L:
        case KC_SCLN:
        case KC_X:
        case KC_C:
        case KC_V:
        case KC_B:
        case KC_N:
        case KC_M:
        case KC_COMMA:
        case KC_DOT:
        case KC_SLSH:
            add_weak_mods(MOD_BIT(KC_LSFT));
            return true;

        // Dvorak -/_ key, shifted to underscore while Caps Word is active.
        case KC_QUOTE:
            add_weak_mods(MOD_BIT(KC_LSFT));
            return true;

        case KC_1 ... KC_0:
        case KC_BSPC:
        case KC_DEL:
            return true;

        default:
            return false;
    }
}
