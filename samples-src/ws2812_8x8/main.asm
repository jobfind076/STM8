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
	.globl _leds_demo
	.globl _spi_config
	.globl _gpio_config
	.globl _clock_config
	.globl _set_color
	.globl _get_color
	.globl _random
	.globl _init_rand
	.globl _delay_ms
	.globl _hsv_to_rgb
	.globl _WS2812_plain_color_fill
	.globl _WS2812_send_led_rgb_array
	.globl _SPI_BiDirectionalLineConfig
	.globl _SPI_Cmd
	.globl _SPI_Init
	.globl _SPI_DeInit
	.globl _GPIO_Init
	.globl _GPIO_DeInit
	.globl _CLK_GetFlagStatus
	.globl _CLK_SYSCLKConfig
	.globl _CLK_HSIPrescalerConfig
	.globl _CLK_ClockSwitchConfig
	.globl _CLK_PeripheralClockConfig
	.globl _CLK_ClockSwitchCmd
	.globl _CLK_LSICmd
	.globl _CLK_HSICmd
	.globl _CLK_HSECmd
	.globl _CLK_DeInit
	.globl _rainbow_hills
	.globl _shift_all_to_left
	.globl _get_pixel_number
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_rainbow_hills_column_65536_278:
	.ds 1
_rainbow_hills_target_level_65536_278:
	.ds 1
_rainbow_hills_current_level_65536_278:
	.ds 1
_rainbow_hills_color_65536_278:
	.ds 3
_shift_all_to_left_idx_d_65536_282:
	.ds 1
_shift_all_to_left_idx_t_65536_282:
	.ds 1
_shift_all_to_left_color_65536_282:
	.ds 3
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
;	main.c: 64: static uint8_t column = 0;
	clr	_rainbow_hills_column_65536_278+0
;	main.c: 65: static uint8_t target_level = 2;
	mov	_rainbow_hills_target_level_65536_278+0, #0x02
;	main.c: 66: static uint8_t current_level = 0;
	clr	_rainbow_hills_current_level_65536_278+0
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
;	main.c: 17: void clock_config()
;	-----------------------------------------
;	 function clock_config
;	-----------------------------------------
_clock_config:
;	main.c: 19: CLK_DeInit();
	call	_CLK_DeInit
;	main.c: 20: CLK_HSECmd(DISABLE);
	push	#0x00
	call	_CLK_HSECmd
	pop	a
;	main.c: 21: CLK_LSICmd(DISABLE);
	push	#0x00
	call	_CLK_LSICmd
	pop	a
;	main.c: 22: CLK_HSICmd(ENABLE);
	push	#0x01
	call	_CLK_HSICmd
	pop	a
;	main.c: 23: while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE)
00101$:
	push	#0x02
	push	#0x01
	call	_CLK_GetFlagStatus
	popw	x
	tnz	a
	jreq	00101$
;	main.c: 25: CLK_ClockSwitchCmd(ENABLE);
	push	#0x01
	call	_CLK_ClockSwitchCmd
	pop	a
;	main.c: 26: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	push	#0x00
	call	_CLK_HSIPrescalerConfig
	pop	a
;	main.c: 27: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	push	#0x80
	call	_CLK_SYSCLKConfig
	pop	a
;	main.c: 28: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI,
	push	#0x01
	push	#0x00
	push	#0xe1
	push	#0x01
	call	_CLK_ClockSwitchConfig
	addw	sp, #4
;	main.c: 30: }
	ret
;	main.c: 32: void gpio_config()
;	-----------------------------------------
;	 function gpio_config
;	-----------------------------------------
_gpio_config:
;	main.c: 34: GPIO_DeInit(GPIOC);
	push	#0x0a
	push	#0x50
	call	_GPIO_DeInit
	popw	x
;	main.c: 35: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST); // MOSI
	push	#0xf0
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 36: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST); // CLK
	push	#0xf0
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 37: }
	ret
;	main.c: 39: void spi_config()
;	-----------------------------------------
;	 function spi_config
;	-----------------------------------------
_spi_config:
;	main.c: 41: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
	push	#0x01
	push	#0x01
	call	_CLK_PeripheralClockConfig
	popw	x
;	main.c: 43: SPI_DeInit();
	call	_SPI_DeInit
;	main.c: 44: SPI_Init(SPI_FIRSTBIT_MSB,
	push	#0x00
	push	#0x02
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x04
	push	#0x00
	push	#0x00
	call	_SPI_Init
	addw	sp, #8
;	main.c: 52: SPI_Cmd(ENABLE);
	push	#0x01
	call	_SPI_Cmd
	pop	a
;	main.c: 53: SPI_BiDirectionalLineConfig(SPI_DIRECTION_TX);
	push	#0x01
	call	_SPI_BiDirectionalLineConfig
	pop	a
;	main.c: 54: }
	ret
;	main.c: 56: void leds_demo()
;	-----------------------------------------
;	 function leds_demo
;	-----------------------------------------
_leds_demo:
;	main.c: 58: rainbow_hills();
	call	_rainbow_hills
;	main.c: 59: WS2812_send_led_rgb_array();
;	main.c: 60: }
	jp	_WS2812_send_led_rgb_array
;	main.c: 62: void rainbow_hills()
;	-----------------------------------------
;	 function rainbow_hills
;	-----------------------------------------
_rainbow_hills:
;	main.c: 69: target_level = random(2, HEIGHT - 1);
	push	#0x07
	push	#0x00
	push	#0x02
	push	#0x00
	call	_random
	addw	sp, #4
	ld	a, xl
	ld	_rainbow_hills_target_level_65536_278+0, a
;	main.c: 71: if (column == WIDTH)
	ld	a, _rainbow_hills_column_65536_278+0
	cp	a, #0x08
	jrne	00102$
;	main.c: 74: shift_all_to_left();
	call	_shift_all_to_left
;	main.c: 75: column = WIDTH - 1;
	mov	_rainbow_hills_column_65536_278+0, #0x07
00102$:
;	main.c: 78: if (current_level < target_level)
	ld	a, _rainbow_hills_target_level_65536_278+0
	cp	a, _rainbow_hills_current_level_65536_278+0
	jrule	00104$
;	main.c: 80: hsv_to_rgb(&color, random(40, 255), 100, 100);
	push	#0xff
	push	#0x00
	push	#0x28
	push	#0x00
	call	_random
	addw	sp, #4
	ld	a, xl
	push	#0x64
	push	#0x64
	push	a
	push	#<_rainbow_hills_color_65536_278
	push	#(_rainbow_hills_color_65536_278 >> 8)
	call	_hsv_to_rgb
	addw	sp, #5
;	main.c: 81: set_color(get_pixel_number(column, current_level), &color);
	push	_rainbow_hills_current_level_65536_278+0
	push	_rainbow_hills_column_65536_278+0
	call	_get_pixel_number
	popw	x
	push	#<_rainbow_hills_color_65536_278
	push	#(_rainbow_hills_color_65536_278 >> 8)
	push	a
	call	_set_color
	addw	sp, #3
;	main.c: 82: current_level++;
	inc	_rainbow_hills_current_level_65536_278+0
	ret
00104$:
;	main.c: 86: current_level = 0;
	clr	_rainbow_hills_current_level_65536_278+0
;	main.c: 87: target_level = random(1, HEIGHT - 1);
	push	#0x07
	push	#0x00
	push	#0x01
	push	#0x00
	call	_random
	addw	sp, #4
	ld	a, xl
	ld	_rainbow_hills_target_level_65536_278+0, a
;	main.c: 88: column++;
	inc	_rainbow_hills_column_65536_278+0
;	main.c: 90: }
	ret
;	main.c: 92: void shift_all_to_left()
;	-----------------------------------------
;	 function shift_all_to_left
;	-----------------------------------------
_shift_all_to_left:
	pushw	x
;	main.c: 97: for (uint8_t y = 0; y < HEIGHT; y++)
	clr	(0x02, sp)
00109$:
	ld	a, (0x02, sp)
	cp	a, #0x08
	jrnc	00111$
;	main.c: 99: for (uint8_t x = 1; x < WIDTH; x++)
	ld	a, #0x01
	ld	(0x01, sp), a
00106$:
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrnc	00110$
;	main.c: 101: idx_d = get_pixel_number(x - 1, y);
	ld	a, (0x01, sp)
	dec	a
	ld	xl, a
	ld	a, (0x02, sp)
	push	a
	ld	a, xl
	push	a
	call	_get_pixel_number
	popw	x
	ld	_shift_all_to_left_idx_d_65536_282+0, a
;	main.c: 102: idx_t = get_pixel_number(x, y);
	ld	a, (0x02, sp)
	push	a
	ld	a, (0x02, sp)
	push	a
	call	_get_pixel_number
	popw	x
	ld	_shift_all_to_left_idx_t_65536_282+0, a
;	main.c: 104: get_color(idx_t, &color);
	push	#<_shift_all_to_left_color_65536_282
	push	#(_shift_all_to_left_color_65536_282 >> 8)
	push	_shift_all_to_left_idx_t_65536_282+0
	call	_get_color
	addw	sp, #3
;	main.c: 105: set_color(idx_d, &color);
	push	#<_shift_all_to_left_color_65536_282
	push	#(_shift_all_to_left_color_65536_282 >> 8)
	push	_shift_all_to_left_idx_d_65536_282+0
	call	_set_color
	addw	sp, #3
;	main.c: 107: if ((x + 1) == WIDTH)
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	incw	x
	cpw	x, #0x0008
	jrne	00107$
;	main.c: 109: color.b = 0;
	ldw	x, #_shift_all_to_left_color_65536_282+2
	clr	(x)
;	main.c: 110: color.r = 0;
	mov	_shift_all_to_left_color_65536_282+0, #0x00
;	main.c: 111: color.g = 0;
	ldw	x, #_shift_all_to_left_color_65536_282+1
	clr	(x)
;	main.c: 112: set_color(get_pixel_number(x, y), &color);
	ld	a, (0x02, sp)
	push	a
	ld	a, (0x02, sp)
	push	a
	call	_get_pixel_number
	popw	x
	push	#<_shift_all_to_left_color_65536_282
	push	#(_shift_all_to_left_color_65536_282 >> 8)
	push	a
	call	_set_color
	addw	sp, #3
00107$:
;	main.c: 99: for (uint8_t x = 1; x < WIDTH; x++)
	inc	(0x01, sp)
	jra	00106$
00110$:
;	main.c: 97: for (uint8_t y = 0; y < HEIGHT; y++)
	inc	(0x02, sp)
	jra	00109$
00111$:
;	main.c: 116: }
	popw	x
	ret
;	main.c: 118: uint8_t get_pixel_number(uint8_t x, uint8_t y)
;	-----------------------------------------
;	 function get_pixel_number
;	-----------------------------------------
_get_pixel_number:
;	main.c: 120: return(y * WIDTH + x);
	ld	a, (0x04, sp)
	sll	a
	sll	a
	sll	a
	add	a, (0x03, sp)
;	main.c: 121: }
	ret
;	main.c: 123: int main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 125: clock_config();
	call	_clock_config
;	main.c: 126: gpio_config();
	call	_gpio_config
;	main.c: 127: spi_config();
	call	_spi_config
;	main.c: 128: delay_ms(50);
	push	#0x32
	push	#0x00
	call	_delay_ms
	popw	x
;	main.c: 130: init_rand(1077); // todo: read pins ADC
	push	#0x35
	push	#0x04
	call	_init_rand
	popw	x
;	main.c: 132: WS2812_plain_color_fill(40, 40, 40);
	push	#0x28
	push	#0x28
	push	#0x28
	call	_WS2812_plain_color_fill
	addw	sp, #3
;	main.c: 133: delay_ms(500);
	push	#0xf4
	push	#0x01
	call	_delay_ms
	popw	x
;	main.c: 135: while (1)
00102$:
;	main.c: 137: leds_demo();
	call	_leds_demo
;	main.c: 139: __asm nop __endasm;
	nop	
;	main.c: 141: delay_ms(250);
	push	#0xfa
	push	#0x00
	call	_delay_ms
	popw	x
	jra	00102$
;	main.c: 145: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
