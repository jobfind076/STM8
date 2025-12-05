;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _clock_config
	.globl _delay_ms
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _CLK_GetFlagStatus
	.globl _CLK_SYSCLKConfig
	.globl _CLK_HSICmd
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
;	main.c: 6: void clock_config()
;	-----------------------------------------
;	 function clock_config
;	-----------------------------------------
_clock_config:
;	main.c: 9: CLK_HSICmd(ENABLE);
	push	#0x01
	call	_CLK_HSICmd
	pop	a
;	main.c: 10: while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET)
00101$:
	push	#0x02
	push	#0x01
	call	_CLK_GetFlagStatus
	popw	x
	tnz	a
	jreq	00101$
;	main.c: 12: CLK_SYSCLKConfig(CLK_SOURCE_HSI);
	push	#0xe1
	call	_CLK_SYSCLKConfig
	pop	a
;	main.c: 13: CLK->CKDIVR = 0x0;
	mov	0x50c6+0, #0x00
;	main.c: 14: }
	ret
;	main.c: 16: int main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 18: clock_config();
	call	_clock_config
;	main.c: 20: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 22: while (1)
00102$:
;	main.c: 24: GPIO_WriteHigh(GPIOD, GPIO_PIN_3);
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	main.c: 25: delay_ms(500);
	push	#0xf4
	push	#0x01
	call	_delay_ms
	popw	x
;	main.c: 26: GPIO_WriteLow(GPIOD, GPIO_PIN_3);
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	main.c: 27: delay_ms(500);
	push	#0xf4
	push	#0x01
	call	_delay_ms
	popw	x
	jra	00102$
;	main.c: 30: return 0;
;	main.c: 31: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
