;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module blinky
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	blinky.c: 3: int main() 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	blinky.c: 8: PB_DDR = 0x20;
	mov	0x5007+0, #0x20
;	blinky.c: 9: PB_CR1 = 0x20;
	mov	0x5008+0, #0x20
;	blinky.c: 11: do {
00102$:
;	blinky.c: 12: PB_ODR ^= 0b00100000;
	ld	a, 0x5005
	xor	a, #0x20
	ld	0x5005, a
;	blinky.c: 13: for(unsigned long d = 0; d < 150000; d++) 
	clrw	y
	clrw	x
00106$:
	cpw	y, #0x49f0
	ld	a, xl
	sbc	a, #0x02
	ld	a, xh
	sbc	a, #0x00
	jrnc	00102$
	incw	y
	jrne	00106$
	incw	x
	jra	00106$
;	blinky.c: 17: } while(1);
;	blinky.c: 18: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
