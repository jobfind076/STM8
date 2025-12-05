;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module random
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rand
	.globl _init_rand
	.globl _rand_byte
	.globl _random
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_g_seed:
	.ds 2
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	random.c: 7: uint16_t rand(void)
;	-----------------------------------------
;	 function rand
;	-----------------------------------------
_rand:
;	random.c: 9: g_seed = (g_seed * 1103515245 + 12345) & 0xFFFF; // A common LCG formula
	ldw	x, _g_seed+0
	pushw	x
	push	#0x6d
	push	#0x4e
	call	__mulint
	addw	sp, #4
	addw	x, #0x3039
	ldw	_g_seed+0, x
;	random.c: 10: return g_seed;
	ldw	x, _g_seed+0
;	random.c: 11: }
	ret
;	random.c: 15: void init_rand(uint16_t value)
;	-----------------------------------------
;	 function init_rand
;	-----------------------------------------
_init_rand:
;	random.c: 17: g_seed = value;
	ldw	x, (0x03, sp)
	ldw	_g_seed+0, x
;	random.c: 18: }
	ret
;	random.c: 21: uint8_t rand_byte(void)
;	-----------------------------------------
;	 function rand_byte
;	-----------------------------------------
_rand_byte:
;	random.c: 23: return rand() & 0xFF;
	call	_rand
	ld	a, xl
;	random.c: 24: }
	ret
;	random.c: 26: uint16_t random(uint16_t min_v, uint16_t max_v)
;	-----------------------------------------
;	 function random
;	-----------------------------------------
_random:
;	random.c: 28: uint16_t v = (min_v + rand()) % max_v;
	call	_rand
	addw	x, (0x03, sp)
	ldw	y, (0x05, sp)
	divw	x, y
	ldw	x, y
;	random.c: 30: if (v < min_v)
	cpw	x, (0x03, sp)
	jrc	00110$
	ret
00110$:
;	random.c: 32: v = min_v;
	ldw	x, (0x03, sp)
;	random.c: 35: return v;
;	random.c: 36: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__g_seed:
	.dw #0x0000
	.area CABS (ABS)
