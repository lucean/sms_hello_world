#include <SMSlib.h>

void main(void) {
    SMS_init();
    SMS_displayOn();

    // backdrop (palette entry 0) to blue-ish
    SMS_setBGPaletteColor(0, RGB(0, 0, 3));

    // pick a sprite mode early (no sprites yet, but harmless)
    SMS_setSpriteMode(SPRITEMODE_TALL);

    while (1) {
        // per-frame work here (input, updates, VRAM writes in vblank)
        SMS_waitForVBlank();
    }
}
