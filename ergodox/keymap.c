#include "ergodox.h"
#include "debug.h"
#include "action_layer.h"
#include "version.h"

#define BASE 0 // default layer
#define SYMB 1 // symbols
#define MDIA 2 // media keys

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [BASE] = KEYMAP(
    //     |                 |             |          |          |             |          |          |
            KC_GRAVE,         KC_1,         KC_2,      KC_3,      KC_4,         KC_5,      TG(SYMB),
            KC_TAB,           KC_Q,         KC_W,      KC_E,      KC_R,         KC_T,      KC_EQUAL,
            CTL_T(KC_ESCAPE), KC_A,         KC_S,      KC_D,      KC_F,         KC_G,
            KC_LSHIFT,        KC_Z,         KC_X,      KC_C,      KC_V,         KC_B,      KC_MINUS,
            ALL_T(KC_NO),     MEH_T(KC_NO), KC_LCTL,   KC_LALT,   KC_LGUI,

    //                                                           |             |          |          |
                                                                                KC_0,      KC_DLR,
                                                                                           MO(MDIA),
                                                                  KC_SPACE,     KC_BSPACE, MO(SYMB),


    //     |                 |             |          |          |             |          |          |
            TG(MDIA),         KC_6,         KC_7,      KC_8,      KC_9,         KC_0,      KC_AT,
            KC_CAPS,          KC_Y,         KC_U,      KC_I,      KC_O,         KC_P,      KC_BSLASH,
                              KC_H,         KC_J,      KC_K,      KC_L,         KC_SCOLON, KC_QUOTE,
            KC_UNDS,          KC_N,         KC_M,      KC_COMMA,  KC_DOT,       KC_SLASH,  KC_LSHIFT,
                                            KC_LEFT,   KC_DOWN,   KC_UP,        KC_RIGHT,  ALL_T(KC_NO),

    //     |          |                 |          |
            KC_ASTR,   KC_PERC,
            MO(MDIA),
            MO(SYMB),  CTL_T(KC_ESCAPE), KC_ENTER
  ),

  [SYMB] = KEYMAP(
    //     |                 |               |               |               |               |          |               |
            M(0),             KC_F1,          KC_F2,          KC_F3,          KC_F4,          KC_F5,     KC_TRANSPARENT,
            KC_TRANSPARENT,   KC_EXLM,        KC_AT,          KC_LCBR,        KC_RCBR,        KC_PIPE,   KC_TRANSPARENT,
            CTL_T(KC_ESCAPE), KC_HASH,        KC_DLR,         KC_LPRN,        KC_RPRN,        KC_GRAVE,
            KC_TRANSPARENT,   KC_PERC,        KC_CIRC,        KC_LBRACKET,    KC_RBRACKET,    KC_TILD,   KC_TRANSPARENT,
            KC_TRANSPARENT,   KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,

    //                                                                       |          |               |               |
                                                                                         KC_TRANSPARENT, KC_TRANSPARENT,
                                                                                                         KC_TRANSPARENT,
                                                                              KC_SPACE,  KC_BSPACE,      KC_TRANSPARENT,


    //     |                 |               |               |               |          |               |               |
            KC_TRANSPARENT,   KC_F6,          KC_F7,          KC_F8,          KC_F9,     KC_F10,         KC_F11,
            KC_TRANSPARENT,   KC_UP,          KC_7,           KC_8,           KC_9,      KC_ASTR,        KC_F12,
                              KC_DOWN,        KC_4,           KC_5,           KC_6,      KC_PLUS,        KC_TRANSPARENT,
            KC_TRANSPARENT,   KC_AMPR,        KC_1,           KC_2,           KC_3,      KC_BSLASH,      KC_TRANSPARENT,
                                              KC_DOT,         KC_0,           KC_EQUAL,  KC_TRANSPARENT, KC_TRANSPARENT,

    //     |                |                 |          |
            KC_TRANSPARENT,  KC_TRANSPARENT,
            KC_TRANSPARENT,
            KC_TRANSPARENT,  CTL_T(KC_ESCAPE), KC_ENTER
  ),

  [MDIA] = KEYMAP(
    //     |                 |               |               |               |               |               |               |
            KC_TRANSPARENT,   KC_F14,         KC_F15,         KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,
            KC_TRANSPARENT,   KC_TRANSPARENT, KC_TRANSPARENT, KC_MS_UP,       KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,
            KC_TRANSPARENT,   KC_TRANSPARENT, KC_MS_LEFT,     KC_MS_DOWN,     KC_MS_RIGHT,    KC_TRANSPARENT,
            KC_TRANSPARENT,   KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,
            KC_TRANSPARENT,   KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,

    //                                                                       |               |               |               |
                                                                                              KC_TRANSPARENT, KC_TRANSPARENT,
                                                                                                              KC_TRANSPARENT,
                                                                              KC_MS_BTN1,     KC_MS_BTN2,     KC_TRANSPARENT,


    //     |                 |               |                    |                    |                    |               |                |
            KC_TRANSPARENT,   KC_TRANSPARENT, KC_AUDIO_MUTE,       KC_AUDIO_VOL_DOWN,   KC_AUDIO_VOL_UP,     KC_TRANSPARENT, KC_TRANSPARENT,
            KC_TRANSPARENT,   KC_TRANSPARENT, KC_MEDIA_PREV_TRACK, KC_MEDIA_PLAY_PAUSE, KC_MEDIA_NEXT_TRACK, KC_TRANSPARENT, KC_TRANSPARENT,
                              KC_LEFT,        KC_DOWN,             KC_UP,               KC_RIGHT,            KC_TRANSPARENT, KC_TRANSPARENT,
            KC_TRANSPARENT,   KC_TRANSPARENT, KC_TRANSPARENT,      KC_TRANSPARENT,      KC_TRANSPARENT,      KC_TRANSPARENT, KC_TRANSPARENT,
                                              KC_TRANSPARENT,      KC_TRANSPARENT,      KC_TRANSPARENT,      KC_TRANSPARENT, KC_TRANSPARENT,

    //     |                |                 |               |
            KC_TRANSPARENT,  KC_TRANSPARENT,
            KC_TRANSPARENT,
            KC_TRANSPARENT,  KC_WWW_BACK,      KC_WWW_FORWARD
  ),
};

const uint16_t PROGMEM fn_actions[] = {
  [1] = ACTION_LAYER_TAP_TOGGLE(1)
};

// leaving this in place for compatibilty with old keymaps cloned and re-compiled.
const macro_t *action_get_macro(keyrecord_t *record, uint8_t id, uint8_t opt)
{
    switch(id) {
    case 0:
        if (record->event.pressed) {
            SEND_STRING(QMK_KEYBOARD "/" QMK_KEYMAP " @ " QMK_VERSION);
        }
        break;
    }
    return MACRO_NONE;
};

// Runs just one time when the keyboard initializes.
void matrix_scan_user(void) {
    uint8_t layer = biton32(layer_state);

    ergodox_board_led_off();
    ergodox_right_led_2_off();
    ergodox_right_led_3_off();

    switch (layer) {
    case 1:
        ergodox_right_led_2_on();
        break;
    case 2:
        ergodox_right_led_3_on();
        break;
    default:
        break;
    }
};

void led_set_kb(uint8_t usb_led) {
    if (usb_led & (1<<USB_LED_CAPS_LOCK)) {
        ergodox_right_led_1_on();
    } else{
        ergodox_right_led_1_off();
    }
};
