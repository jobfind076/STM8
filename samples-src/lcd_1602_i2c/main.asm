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
	.globl _lcd_demo
	.globl _gpio_config
	.globl _clock_config_16MHz
	.globl _delay_ms
	.globl _lcd_bl_on
	.globl _lcd_print_integer
	.globl _lcd_print_string
	.globl _lcd_set_cursor
	.globl _lcd_clear
	.globl _lcd_init
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _GPIO_DeInit
	.globl _CLK_GetFlagStatus
	.globl _CLK_GetClockFreq
	.globl _CLK_SYSCLKConfig
	.globl _CLK_HSIPrescalerConfig
	.globl _CLK_ClockSwitchConfig
	.globl _CLK_PeripheralClockConfig
	.globl _CLK_ClockSwitchCmd
	.globl _CLK_LSICmd
	.globl _CLK_HSICmd
	.globl _CLK_HSECmd
	.globl _CLK_DeInit
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
;	main.c: 11: void clock_config_16MHz()
;	-----------------------------------------
;	 function clock_config_16MHz
;	-----------------------------------------
_clock_config_16MHz:
;	main.c: 13: CLK_DeInit();
	call	_CLK_DeInit
;	main.c: 14: CLK_HSECmd(DISABLE);
	push	#0x00
	call	_CLK_HSECmd
	pop	a
;	main.c: 15: CLK_LSICmd(DISABLE);
	push	#0x00
	call	_CLK_LSICmd
	pop	a
;	main.c: 16: CLK_HSICmd(ENABLE);
	push	#0x01
	call	_CLK_HSICmd
	pop	a
;	main.c: 17: while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE)
00101$:
	push	#0x02
	push	#0x01
	call	_CLK_GetFlagStatus
	popw	x
	tnz	a
	jreq	00101$
;	main.c: 19: CLK_ClockSwitchCmd(ENABLE);
	push	#0x01
	call	_CLK_ClockSwitchCmd
	pop	a
;	main.c: 20: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	push	#0x00
	call	_CLK_HSIPrescalerConfig
	pop	a
;	main.c: 21: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	push	#0x80
	call	_CLK_SYSCLKConfig
	pop	a
;	main.c: 22: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI,
	push	#0x01
	push	#0x00
	push	#0xe1
	push	#0x01
	call	_CLK_ClockSwitchConfig
	addw	sp, #4
;	main.c: 25: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	push	#0x01
	push	#0x00
	call	_CLK_PeripheralClockConfig
	popw	x
;	main.c: 26: }
	ret
;	main.c: 28: void gpio_config()
;	-----------------------------------------
;	 function gpio_config
;	-----------------------------------------
_gpio_config:
;	main.c: 30: GPIO_DeInit(GPIOB);
	push	#0x05
	push	#0x50
	call	_GPIO_DeInit
	popw	x
;	main.c: 31: GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
	push	#0xb0
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 32: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
	push	#0xb0
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 34: GPIO_DeInit(GPIOD);
	push	#0x0f
	push	#0x50
	call	_GPIO_DeInit
	popw	x
;	main.c: 35: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 36: }
	ret
;	main.c: 38: void lcd_demo()
;	-----------------------------------------
;	 function lcd_demo
;	-----------------------------------------
_lcd_demo:
;	main.c: 40: lcd_init();
	call	_lcd_init
;	main.c: 41: lcd_clear();
	call	_lcd_clear
;	main.c: 42: lcd_bl_on(); // Back light on
	call	_lcd_bl_on
;	main.c: 43: lcd_set_cursor(0, 0);
	push	#0x00
	push	#0x00
	call	_lcd_set_cursor
	popw	x
;	main.c: 44: lcd_print_string("STM8 1602a TEST");
	push	#<___str_0
	push	#(___str_0 >> 8)
	call	_lcd_print_string
	popw	x
;	main.c: 45: lcd_set_cursor(1, 0);
	push	#0x00
	push	#0x01
	call	_lcd_set_cursor
	popw	x
;	main.c: 46: lcd_print_string("MHz:");
	push	#<___str_1
	push	#(___str_1 >> 8)
	call	_lcd_print_string
	popw	x
;	main.c: 47: }
	ret
;	main.c: 49: int main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #8
;	main.c: 53: clock_config_16MHz();
	call	_clock_config_16MHz
;	main.c: 55: gpio_config();
	call	_gpio_config
;	main.c: 57: lcd_demo();
	call	_lcd_demo
;	main.c: 59: count = CLK_GetClockFreq() / 1000000;
	call	_CLK_GetClockFreq
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ldw	(0x05, sp), y
;	main.c: 60: lcd_set_cursor(1, 4);
	pushw	x
	push	#0x04
	push	#0x01
	call	_lcd_set_cursor
	popw	x
	popw	x
;	main.c: 61: lcd_print_integer(count, 0);
	push	#0x00
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	call	_lcd_print_integer
	addw	sp, #5
;	main.c: 65: while (1)
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
00102$:
;	main.c: 67: lcd_set_cursor(1, 7);
	push	#0x07
	push	#0x01
	call	_lcd_set_cursor
	popw	x
;	main.c: 68: lcd_print_integer(count, 0);
	push	#0x00
	ldw	x, (0x04, sp)
	pushw	x
	ldw	x, (0x04, sp)
	pushw	x
	call	_lcd_print_integer
	addw	sp, #5
;	main.c: 69: count++;
	ldw	x, (0x03, sp)
	incw	x
	ldw	(0x03, sp), x
	jrne	00111$
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
00111$:
;	main.c: 71: GPIO_WriteHigh(GPIOD, GPIO_PIN_3);
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	main.c: 72: delay_ms(500);
	push	#0xf4
	push	#0x01
	call	_delay_ms
	popw	x
;	main.c: 73: GPIO_WriteLow(GPIOD, GPIO_PIN_3);
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	main.c: 74: delay_ms(500);
	push	#0xf4
	push	#0x01
	call	_delay_ms
	popw	x
	jra	00102$
;	main.c: 78: }
	addw	sp, #8
	ret
	.area CODE
	.area CONST
___str_0:
	.ascii "STM8 1602a TEST"
	.db 0x00
___str_1:
	.ascii "MHz:"
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
