// BEHAVIOR
#define XXX &none
#define ___ &trans
#define MO_LAY &mo

// CONTROL CMD/WINDOWS SHIFT ALT/META/OPTION
#define DE_LCTRL &kp LCTRL 
#define DE_LGUI &kp LGUI   
#define DE_RGUI &kp RGUI
#define DE_LALT &kp LALT
#define DE_RALT &kp RALT
#define DE_LSHFT &kp LSHFT
#define DE_RSHFT &kp RSHFT

// ARROWS
#define DE_UP &kp UP
#define DE_LEFT &kp LEFT
#define DE_DOWN &kp DOWN
#define DE_RIGHT &kp RIGHT

// SPACE CAPS TAB ENTER BACKSPACE ESCAPE DELETE
#define DE_SPACE &kp SPACE // Space
#define DE_CAPS &kp CAPS   // Caps Lock
#define DE_BSPC &kp BSPC   // Backspace
#define DE_RET &kp RET     // Enter
#define DE_TAB &kp TAB     // Tab
#define DE_DEL &kp DEL     // Delete
#define DE_ESC &kp ESC     // ESC

// PAGE UP PAGE DOWN HOME END
#define DE_PG_UP &kp PG_UP
#define DE_PG_DN &kp PG_DN
#define DE_HOME &kp HOME
#define DE_END &kp END

// FUNCTION KEYS
#define DE_F1 &kp F1
#define DE_F2 &kp F2
#define DE_F3 &kp F3
#define DE_F4 &kp F4
#define DE_F5 &kp F5
#define DE_F6 &kp F6
#define DE_F7 &kp F7
#define DE_F8 &kp F8
#define DE_F9 &kp F9
#define DE_F10 &kp F10
#define DE_F11 &kp F11
#define DE_F12 &kp F12
#define DE_F13 &kp F13
#define DE_F14 &kp F14
#define DE_F15 &kp F15
#define DE_F16 &kp F16
#define DE_F17 &kp F17
#define DE_F18 &kp F18
#define DE_F19 &kp F19
#define DE_F20 &kp F20
#define DE_F21 &kp F21
#define DE_F22 &kp F22
#define DE_F23 &kp F23
#define DE_F24 &kp F24

// SOUND / VOLUME
#define DE_VOL_UP &kp C_VOLUME_UP
#define DE_VOL_DN &kp C_VOLUME_DOWN
#define DE_MUTE &kp C_MUTE
#define DE_NEXT &kp C_NEXT
#define DE_PREV &kp C_PREVIOUS
#define DE_STOP &kp C_STOP
#define DE_PLAY &kp C_PLAY_PAUSE
#define DE_SHUFFLE &kp C_SHUFFLE

// DISPLAY BRIGHTNESS
#define DE_BRI_UP &kp C_BRI_UP
#define DE_BRI_DN &kp C_BRI_DN

// SNIPPETS
#define NAV_BF &kp LC(X)
#define NAV_W &kp LC(W)

/* First layer
 *
 * ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬─────┐
 * │ ' │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │     │
 * ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬───┤
 * │     │ Q │ W │ E │ R │ T │ Y │ U │ I │ O │ P │ ' │ [ │   │
 * ├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┐  │
 * │      │ A │ S │ D │ F │ G │ H │ J │ K │ L │ Ç │ ~ │ ] │  │
 * ├────┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──┤
 * │    │ \ │ Z │ X │ C │ V │ B │ N │ M │ , │ . │ ; │ / │    │
 * ├────┴┬──┴─┬─┴───┼───┴───┴───┴───┴───┴───┼───┴─┬─┴──┬┴────┤
 * │     │    │     │                       │     │    │     │
 * └─────┴────┴─────┴───────────────────────┴─────┴────┴─────┘
 */

// Row 1
#define DE_QUOT &kp GRAVE   // '
#define DE_1 &kp N1         // 1
#define DE_2 &kp N2         // 2
#define DE_3 &kp N3         // 3
#define DE_4 &kp N4         // 4
#define DE_5 &kp N5         // 5
#define DE_6 &kp N6         // 6
#define DE_7 &kp N7         // 7
#define DE_8 &kp N8         // 8
#define DE_9 &kp N9         // 9
#define DE_0 &kp N0         // 0
#define DE_MINUS &kp MINUS  // -
#define DE_EQUAL &kp EQUAL  // = 
// Row 2
#define DE_Q &kp Q       // Q
#define DE_W &kp W       // W
#define DE_E &kp E       // E
#define DE_R &kp R       // R
#define DE_T &kp T       // T
#define DE_Y &kp Y       // Y
#define DE_U &kp U       // U
#define DE_I &kp I       // I
#define DE_O &kp O       // O
#define DE_P &kp P       // P
#define DE_ACUT &kp LBKT // '
#define DE_LBKT &kp RBKT // [
//Row 3
#define DE_A &kp A            // A
#define DE_S &kp S            // S
#define DE_D &kp D            // D
#define DE_F &kp F            // F
#define DE_G &kp G            // G
#define DE_H &kp H            // H
#define DE_J &kp J            // J
#define DE_K &kp K            // K
#define DE_L &kp L            // L
#define DE_CEDL  &kp SEMI     // Ç
#define DE_TILDE &kp APOS     // ~
#define DE_RBKT  &kp BSLH     // ]
// Row 4
#define DE_BSLH &kp LT         // (backslash)
#define DE_Z &kp Z             // Z
#define DE_X &kp X             // X
#define DE_C &kp C             // C
#define DE_V &kp V             // V
#define DE_B &kp B             // B
#define DE_N &kp N             // N
#define DE_M &kp M             // M
#define DE_COMM &kp COMMA      // ,
#define DE_DOT &kp DOT         // .
#define DE_SEMI &kp FSLH       // ;
#define DE_SLSH &kp RCTRL      // /

/* Second layer
 *
 * ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬─────┐
 * │ " │ ! │ @ │ # │ $ │ % │   │ & │ * │ ( │ ) │ _ │ + │     │
 * ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬───┤
 * │     │   │   │   │   │   │   │   │   │   │   │ ` │ { │   │
 * ├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┐  │
 * │      │   │   │   │   │   │   │   │   │   │   │ ^ │ } │  │
 * ├────┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──┤
 * │    │ | │   │   │   │   │   │   │   │ < │ > │ : │ ? │    │
 * ├────┴┬──┴─┬─┴───┼───┴───┴───┴───┴───┴───┼───┴─┬─┴──┬┴────┤
 * │     │    │     │                       │     │    │     │
 * └─────┴────┴─────┴───────────────────────┴─────┴────┴─────┘
 */

// Row 1
#define DE_DQUO  &kp LS(GRAVE)  // "
#define DE_EXCL  &kp LS(N1)     // !
#define DE_AT    &kp LS(N2)     // @
#define DE_HASH  &kp LS(N3)     // #
#define DE_DLR   &kp LS(N4)     // $
#define DE_PERC  &kp LS(N5)     // %
#define DE_AMPS  &kp LS(N7)     // &
#define DE_STAR  &kp LS(N8)     // *
#define DE_LPAR  &kp LS(N9)     // (
#define DE_RPAR  &kp LS(N0)     // )
#define DE_UNDER &kp LS(MINUS)  // _
#define DE_PLUS &kp LS(EQUAL)   // +
// Row 2
#define DE_GRAVE &kp LS(LBKT)   // `
#define DE_LBRC &kp LS(RBKT)    // {
// Row 3
#define DE_CARRET &kp LS(APOS)  // ^
#define DE_RBRC &kp LS(BSLH)    // }
// Row 4
#define DE_PIPE &kp LS(NUBS)    // |
#define DE_LT &kp LS(COMMA)     // <
#define DE_GT &kp LS(DOT)       // >
#define DE_COLN &kp LS(FSLH)    // :
#define DE_QMARK &kp LS(RCTRL)  // ?
