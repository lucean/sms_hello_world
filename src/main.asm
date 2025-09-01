;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Mac OS X ppc)
;--------------------------------------------------------
	.module main
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___SMS__SDSC_signature
	.globl ___SMS__SDSC_descr
	.globl ___SMS__SDSC_name
	.globl ___SMS__SDSC_author
	.globl ___SMS__SEGA_signature
	.globl _main
	.globl _SMS_print
	.globl _SMS_autoSetUpTextRenderer
	.globl _SMS_crt0_RST08
	.globl _SMS_waitForVBlank
	.globl _SMS_setSpriteMode
	.globl _SMS_VDPturnOnFeature
	.globl _SMS_init
	.globl _SMS_SRAM
	.globl _SRAM_bank_to_be_mapped_on_slot2
	.globl _ROM_bank_to_be_mapped_on_slot0
	.globl _ROM_bank_to_be_mapped_on_slot1
	.globl _ROM_bank_to_be_mapped_on_slot2
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_SMS_VDPControlPort	=	0x00bf
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_ROM_bank_to_be_mapped_on_slot2	=	0xffff
_ROM_bank_to_be_mapped_on_slot1	=	0xfffe
_ROM_bank_to_be_mapped_on_slot0	=	0xfffd
_SRAM_bank_to_be_mapped_on_slot2	=	0xfffc
_SMS_SRAM	=	0x8000
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:6: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:7: SMS_init();
	call	_SMS_init
;src/main.c:8: SMS_displayOn();
	ld	hl, #0x0140
	call	_SMS_VDPturnOnFeature
;src/main.c:14: SMS_setSpriteMode(SPRITEMODE_TALL);
	ld	l, #0x01
	call	_SMS_setSpriteMode
;src/main.c:17: SMS_autoSetUpTextRenderer();       // use default font tiles
	call	_SMS_autoSetUpTextRenderer
;src/main.c:18: SMS_printatXY(10, 12, "Hello World");          // output text
	ld	hl, #0x7b14
	rst	#0x08
	ld	hl, #___str_3
	call	_SMS_print
;src/main.c:20: while (1) {
00105$:
;src/main.c:22: SMS_waitForVBlank();
	call	_SMS_waitForVBlank
;src/main.c:24: }
	jr	00105$
__str_0:
	.ascii "YourName"
	.db 0x00
__str_1:
	.ascii "HELLO WORLD"
	.db 0x00
__str_2:
	.ascii "Minimal SMS hello."
	.db 0x00
___str_3:
	.ascii "Hello World"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
	.org 0x7FF0
___SMS__SEGA_signature:
	.db #0x54	; 84	'T'
	.db #0x4d	; 77	'M'
	.db #0x52	; 82	'R'
	.db #0x20	; 32
	.db #0x53	; 83	'S'
	.db #0x45	; 69	'E'
	.db #0x47	; 71	'G'
	.db #0x41	; 65	'A'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.org 0x7FD7
___SMS__SDSC_author:
	.ascii "YourName"
	.db 0x00
	.org 0x7FCB
___SMS__SDSC_name:
	.ascii "HELLO WORLD"
	.db 0x00
	.org 0x7FB8
___SMS__SDSC_descr:
	.ascii "Minimal SMS hello."
	.db 0x00
	.org 0x7FE0
___SMS__SDSC_signature:
	.db #0x53	; 83	'S'
	.db #0x44	; 68	'D'
	.db #0x53	; 83	'S'
	.db #0x43	; 67	'C'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xd7	; 215
	.db #0x7f	; 127
	.db #0xcb	; 203
	.db #0x7f	; 127
	.db #0xb8	; 184
	.db #0x7f	; 127
