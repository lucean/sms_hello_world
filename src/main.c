#include <SMSlib.h>

SMS_EMBED_SEGA_ROM_HEADER(9999, 0);  // product code, revision
SMS_EMBED_SDSC_HEADER_AUTO_DATE(1,0,"YourName","HELLO WORLD","Minimal SMS hello.");

void main(void) {
    SMS_init();
    SMS_displayOn();

    // backdrop (palette entry 0) to blue-ish
    SMS_setBGPaletteColor(0, RGB(3, 0, 0));

    // pick a sprite mode early (no sprites yet, but harmless)
    SMS_setSpriteMode(SPRITEMODE_TALL);

    while (1) {
        // per-frame work here (input, updates, VRAM writes in vblank)
        SMS_waitForVBlank();
    }
}
