;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module delay
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _delay_10us
	.globl _delay_ms
	.globl _CLK_PeripheralClockConfig
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
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
;	delay.c: 30: void delay_ms(uint16_t n_ms)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
;	delay.c: 33: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
	push	#0x01
	push	#0x04
	call	_CLK_PeripheralClockConfig
	popw	x
;	delay.c: 36: TIM4->PSCR = 6;
	mov	0x5347+0, #0x06
;	delay.c: 39: TIM4->ARR = 250;
	mov	0x5348+0, #0xfa
;	delay.c: 42: TIM4->CNTR = 2;
	mov	0x5346+0, #0x02
;	delay.c: 45: TIM4->SR1 &= ~TIM4_SR1_UIF;
	bres	21316, #0
;	delay.c: 48: TIM4->CR1 |= TIM4_CR1_CEN;
	bset	21312, #0
;	delay.c: 50: while(n_ms--)
	ldw	x, (0x03, sp)
00104$:
	ldw	y, x
	decw	x
	tnzw	y
	jreq	00106$
;	delay.c: 52: while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
00101$:
	ld	a, 0x5344
	srl	a
	jrnc	00101$
;	delay.c: 53: TIM4->SR1 &= ~TIM4_SR1_UIF;
	bres	21316, #0
	jra	00104$
00106$:
;	delay.c: 57: TIM4->CR1 &= ~TIM4_CR1_CEN;
	bres	21312, #0
;	delay.c: 58: }
	ret
;	delay.c: 66: void delay_10us(uint16_t n_10us)
;	-----------------------------------------
;	 function delay_10us
;	-----------------------------------------
_delay_10us:
;	delay.c: 69: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
	push	#0x01
	push	#0x04
	call	_CLK_PeripheralClockConfig
	popw	x
;	delay.c: 72: TIM4->PSCR = 0;
	mov	0x5347+0, #0x00
;	delay.c: 75: TIM4->ARR = 160;
	mov	0x5348+0, #0xa0
;	delay.c: 78: TIM4->CNTR = 10;
	mov	0x5346+0, #0x0a
;	delay.c: 81: TIM4->SR1 &= ~TIM4_SR1_UIF;
	bres	21316, #0
;	delay.c: 84: TIM4->CR1 |= TIM4_CR1_CEN;
	bset	21312, #0
;	delay.c: 86: while(n_10us--)
	ldw	x, (0x03, sp)
00104$:
	ldw	y, x
	decw	x
	tnzw	y
	jreq	00106$
;	delay.c: 88: while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
00101$:
	ld	a, 0x5344
	srl	a
	jrnc	00101$
;	delay.c: 89: TIM4->SR1 &= ~TIM4_SR1_UIF;
	bres	21316, #0
	jra	00104$
00106$:
;	delay.c: 93: TIM4->CR1 &= ~TIM4_CR1_CEN;
	bres	21312, #0
;	delay.c: 94: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
	push	#0x00
	push	#0x04
	call	_CLK_PeripheralClockConfig
	popw	x
;	delay.c: 96: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
