;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module uart
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _uart_write
	.globl _strlen
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
;	uart.c: 4: int uart_write(const char *str) {
;	-----------------------------------------
;	 function uart_write
;	-----------------------------------------
_uart_write:
	sub	sp, #3
;	uart.c: 6: for(i = 0; i < strlen(str); i++) {
	clr	(0x03, sp)
00106$:
	ldw	x, (0x06, sp)
	pushw	x
	call	_strlen
	addw	sp, #2
	ldw	(0x01, sp), x
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	cpw	x, (0x01, sp)
	jrnc	00104$
;	uart.c: 7: while(!(USART1_SR & USART_SR_TXE));
00101$:
	ld	a, 0x5230
	jrpl	00101$
;	uart.c: 8: USART1_DR = str[i];
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
	ld	0x5231, a
;	uart.c: 6: for(i = 0; i < strlen(str); i++) {
	inc	(0x03, sp)
	jra	00106$
00104$:
;	uart.c: 10: return(i); // Bytes sent
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
;	uart.c: 11: }
	addw	sp, #3
	ret
;	uart.c: 13: int main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #8
;	uart.c: 16: CLK_DIVR = 0x00; // Set the frequency to 16 MHz
	mov	0x50c0+0, #0x00
;	uart.c: 17: CLK_PCKENR1 = 0xFF; // Enable peripherals
	mov	0x50c3+0, #0xff
;	uart.c: 19: PC_DDR = 0x08; // Put TX line on
	mov	0x500c+0, #0x08
;	uart.c: 20: PC_CR1 = 0x08;
	mov	0x500d+0, #0x08
;	uart.c: 22: USART1_CR2 = USART_CR2_TEN; // Allow TX & RX
	mov	0x5235+0, #0x08
;	uart.c: 23: USART1_CR3 &= ~(USART_CR3_STOP1 | USART_CR3_STOP2); // 1 stop bit
	ld	a, 0x5236
	and	a, #0xcf
	ld	0x5236, a
;	uart.c: 24: USART1_BRR2 = 0x03; USART1_BRR1 = 0x68; // 9600 baud
	mov	0x5233+0, #0x03
	mov	0x5232+0, #0x68
;	uart.c: 26: do {
00102$:
;	uart.c: 27: uart_write("Hello World!\n");
	push	#<___str_0
	push	#(___str_0 >> 8)
	call	_uart_write
	addw	sp, #2
;	uart.c: 28: for(i = 0; i < 147456; i++) { } // Sleep
	ldw	x, #0x4000
	ld	a, #0x02
	clr	(0x05, sp)
00107$:
	subw	x, #0x0001
	ldw	(0x03, sp), x
	sbc	a, #0x00
	ld	(0x02, sp), a
	ld	a, (0x05, sp)
	sbc	a, #0x00
	ld	(0x01, sp), a
	ld	a, (0x01, sp)
	ld	(0x05, sp), a
	ldw	x, (0x03, sp)
	ld	a, (0x02, sp)
	ldw	y, (0x03, sp)
	jrne	00107$
	ldw	y, (0x01, sp)
	jreq	00102$
;	uart.c: 29: } while(1);
	jra	00107$
;	uart.c: 30: }
	addw	sp, #8
	ret
	.area CODE
	.area CONST
___str_0:
	.ascii "Hello World!"
	.db 0x0a
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
