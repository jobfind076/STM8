;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module ws2812
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_color
	.globl _get_color
	.globl _fmod
	.globl _delay_10us
	.globl _bytes_to_rgb
	.globl _uint32_to_rgb
	.globl _hsv_to_rgb
	.globl _WS2812_wait_spi_sr
	.globl _WS2812_send_led_single
	.globl _WS2812_send_led_rgb_array
	.globl _WS2812_clear
	.globl _WS2812_plain_color_fill
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_g_leds_matrix:
	.ds 192
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
;	ws2812.c: 13: void get_color (uint8_t i_index, RGB* o_color)
;	-----------------------------------------
;	 function get_color
;	-----------------------------------------
_get_color:
	sub	sp, #4
;	ws2812.c: 15: o_color->b = g_leds_matrix[i_index % NB_LEDS].b;
	ldw	y, (0x08, sp)
	ldw	(0x03, sp), y
	ldw	x, y
	incw	x
	incw	x
	ldw	(0x01, sp), x
	ld	a, (0x07, sp)
	and	a, #0x3f
	ld	xl, a
	ld	a, #0x03
	mul	x, a
	addw	x, #_g_leds_matrix
	exgw	x, y
	ldw	x, y
	ld	a, (0x2, x)
	ldw	x, (0x01, sp)
	ld	(x), a
;	ws2812.c: 16: o_color->r = g_leds_matrix[i_index % NB_LEDS].r;
	ld	a, (y)
	ldw	x, (0x03, sp)
	ld	(x), a
;	ws2812.c: 17: o_color->g = g_leds_matrix[i_index % NB_LEDS].g;
	ldw	x, (0x03, sp)
	incw	x
	ld	a, (0x1, y)
	ld	(x), a
;	ws2812.c: 18: }
	addw	sp, #4
	ret
;	ws2812.c: 20: void set_color (uint8_t i_index, RGB* i_color)
;	-----------------------------------------
;	 function set_color
;	-----------------------------------------
_set_color:
	sub	sp, #4
;	ws2812.c: 22: g_leds_matrix[i_index % NB_LEDS].b = i_color->b;
	ld	a, (0x07, sp)
	and	a, #0x3f
	ld	xl, a
	ld	a, #0x03
	mul	x, a
	addw	x, #_g_leds_matrix
	ldw	(0x01, sp), x
	incw	x
	incw	x
	ldw	(0x03, sp), x
	ldw	y, (0x08, sp)
	ldw	x, y
	ld	a, (0x2, x)
	ldw	x, (0x03, sp)
	ld	(x), a
;	ws2812.c: 23: g_leds_matrix[i_index % NB_LEDS].r = i_color->r;
	ld	a, (y)
	ldw	x, (0x01, sp)
	ld	(x), a
;	ws2812.c: 24: g_leds_matrix[i_index % NB_LEDS].g = i_color->g;
	ldw	x, (0x01, sp)
	incw	x
	ld	a, (0x1, y)
	ld	(x), a
;	ws2812.c: 25: }
	addw	sp, #4
	ret
;	ws2812.c: 27: void bytes_to_rgb (RGB* o_color, uint8_t i_r, uint8_t i_g, uint8_t i_b)
;	-----------------------------------------
;	 function bytes_to_rgb
;	-----------------------------------------
_bytes_to_rgb:
;	ws2812.c: 29: o_color->r = i_r;
	ldw	y, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(y), a
;	ws2812.c: 30: o_color->g = i_g;
	ldw	x, y
	incw	x
	ld	a, (0x06, sp)
	ld	(x), a
;	ws2812.c: 31: o_color->b = i_b;
	ldw	x, y
	incw	x
	incw	x
	ld	a, (0x07, sp)
	ld	(x), a
;	ws2812.c: 32: }
	ret
;	ws2812.c: 34: void uint32_to_rgb (RGB* o_color, uint32_t i_color)
;	-----------------------------------------
;	 function uint32_to_rgb
;	-----------------------------------------
_uint32_to_rgb:
	sub	sp, #6
;	ws2812.c: 36: o_color->r = (i_color >> 16) & 0xFF;
	ldw	y, (0x09, sp)
	ldw	x, (0x0b, sp)
	clr	(0x01, sp)
	ld	a, xl
	ld	(y), a
;	ws2812.c: 37: o_color->g = (i_color >> 8) & 0xFF;
	ldw	x, y
	incw	x
	ldw	(0x05, sp), x
	ldw	x, (0x0d, sp)
	ld	a, xh
	ldw	x, (0x05, sp)
	ld	(x), a
;	ws2812.c: 38: o_color->b = (i_color >> 0) & 0xFF;
	ldw	x, y
	incw	x
	incw	x
	ld	a, (0x0e, sp)
	ld	(x), a
;	ws2812.c: 39: }
	addw	sp, #6
	ret
;	ws2812.c: 41: void hsv_to_rgb (RGB* o_color, uint8_t i_h, uint8_t i_s, uint8_t i_v)
;	-----------------------------------------
;	 function hsv_to_rgb
;	-----------------------------------------
_hsv_to_rgb:
	sub	sp, #61
;	ws2812.c: 45: o_color->r = 0;
	ldw	y, (0x40, sp)
;	ws2812.c: 46: o_color->g = 0;
	ldw	(0x07, sp), y
	ldw	x, y
	incw	x
	ldw	(0x12, sp), x
;	ws2812.c: 47: o_color->b = 0;
	ldw	x, (0x07, sp)
	incw	x
	incw	x
	ldw	(0x18, sp), x
;	ws2812.c: 43: if ((i_h > 360) || (i_s > 100) || (i_v > 100))
	ld	a, (0x43, sp)
	cp	a, #0x64
	jrugt	00101$
	ld	a, (0x44, sp)
	cp	a, #0x64
	jrule	00102$
00101$:
;	ws2812.c: 45: o_color->r = 0;
	ldw	x, (0x07, sp)
	clr	(x)
;	ws2812.c: 46: o_color->g = 0;
	ldw	x, (0x12, sp)
	clr	(x)
;	ws2812.c: 47: o_color->b = 0;
	ldw	x, (0x18, sp)
	clr	(x)
;	ws2812.c: 49: return; // err
	jp	00125$
00102$:
;	ws2812.c: 52: float s = (float)i_s / 100.0;
	ld	a, (0x43, sp)
	push	a
	call	___uchar2fs
	pop	a
	push	#0x00
	push	#0x00
	push	#0xc8
	push	#0x42
	pushw	x
	pushw	y
	call	___fsdiv
	addw	sp, #8
	ldw	(0x2c, sp), x
	ldw	(0x2a, sp), y
;	ws2812.c: 53: float v = (float)i_v / 100.0;
	ld	a, (0x44, sp)
	push	a
	call	___uchar2fs
	pop	a
	push	#0x00
	push	#0x00
	push	#0xc8
	push	#0x42
	pushw	x
	pushw	y
	call	___fsdiv
	addw	sp, #8
	ldw	(0x38, sp), x
	ldw	(0x36, sp), y
;	ws2812.c: 54: float C = s * v;
	ldw	x, (0x38, sp)
	pushw	x
	ldw	x, (0x38, sp)
	pushw	x
	ldw	x, (0x30, sp)
	pushw	x
	ldw	x, (0x30, sp)
	pushw	x
	call	___fsmul
	addw	sp, #8
	ldw	(0x34, sp), x
	ldw	(0x32, sp), y
;	ws2812.c: 55: float X = C * (1 - abs(fmod(i_h / 60.0, 2.0) - 1));
	ld	a, (0x42, sp)
	push	a
	call	___uchar2fs
	pop	a
	push	#0x00
	push	#0x00
	push	#0x70
	push	#0x42
	pushw	x
	pushw	y
	call	___fsdiv
	addw	sp, #8
	ldw	(0x05, sp), x
	ldw	(0x03, sp), y
	clrw	x
	pushw	x
	push	#0x00
	push	#0x40
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	call	_fmod
	addw	sp, #8
	push	#0x00
	push	#0x00
	push	#0x80
	push	#0x3f
	pushw	x
	pushw	y
	call	___fssub
	addw	sp, #8
	pushw	x
	pushw	y
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	call	___fslt
	addw	sp, #8
	ld	(0x0d, sp), a
	jreq	00127$
	clrw	x
	pushw	x
	push	#0x00
	push	#0x40
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	call	_fmod
	addw	sp, #8
	push	#0x00
	push	#0x00
	push	#0x80
	push	#0x3f
	pushw	x
	pushw	y
	call	___fssub
	addw	sp, #8
	ldw	(0x3c, sp), x
	ldw	(0x3a, sp), y
	jra	00128$
00127$:
	clrw	x
	pushw	x
	push	#0x00
	push	#0x40
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	call	_fmod
	addw	sp, #8
	ldw	(0x10, sp), x
	ldw	(0x0e, sp), y
	clrw	x
	pushw	x
	push	#0x80
	push	#0x3f
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x16, sp), x
	ldw	(0x14, sp), y
	ldw	y, (0x16, sp)
	ldw	(0x0b, sp), y
	ld	a, (0x15, sp)
	ld	(0x0a, sp), a
	ld	a, (0x14, sp)
	xor	a, #0x80
	ld	(0x09, sp), a
	ldw	y, (0x0b, sp)
	ldw	(0x3c, sp), y
	ldw	y, (0x09, sp)
	ldw	(0x3a, sp), y
00128$:
	ldw	x, (0x3c, sp)
	pushw	x
	ldw	x, (0x3c, sp)
	pushw	x
	clrw	x
	pushw	x
	push	#0x80
	push	#0x3f
	call	___fssub
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x38, sp)
	pushw	x
	ldw	x, (0x38, sp)
	pushw	x
	call	___fsmul
	addw	sp, #8
	ldw	(0x30, sp), x
	ldw	(0x2e, sp), y
;	ws2812.c: 56: float m = v - C;
	ldw	x, (0x34, sp)
	pushw	x
	ldw	x, (0x34, sp)
	pushw	x
	ldw	x, (0x3c, sp)
	pushw	x
	ldw	x, (0x3c, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x20, sp), x
	ldw	(0x1e, sp), y
;	ws2812.c: 59: if ((i_h >= 0) && (i_h < 60))
	ld	a, (0x42, sp)
	cp	a, #0x3c
	clr	a
	rlc	a
	ld	(0x02, sp), a
	jreq	00122$
;	ws2812.c: 61: r = C, g = X, b = 0;
	ldw	y, (0x34, sp)
	ldw	(0x1c, sp), y
	ldw	y, (0x32, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x30, sp)
	ldw	(0x28, sp), y
	ldw	y, (0x2e, sp)
	ldw	(0x26, sp), y
	clrw	x
	ldw	(0x24, sp), x
	ldw	(0x22, sp), x
	jp	00123$
00122$:
;	ws2812.c: 63: else if(i_h >= 60 && i_h < 120)
	ld	a, (0x42, sp)
	cp	a, #0x78
	clr	a
	rlc	a
	ld	xl, a
	tnz	(0x02, sp)
	jrne	00118$
	ld	a, xl
	tnz	a
	jreq	00118$
;	ws2812.c: 65: r = X, g = C, b = 0;
	ldw	y, (0x30, sp)
	ldw	(0x1c, sp), y
	ldw	y, (0x2e, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x34, sp)
	ldw	(0x28, sp), y
	ldw	y, (0x32, sp)
	ldw	(0x26, sp), y
	clrw	x
	ldw	(0x24, sp), x
	ldw	(0x22, sp), x
	jra	00123$
00118$:
;	ws2812.c: 67: else if(i_h >= 120 && i_h < 180)
	ld	a, (0x42, sp)
	cp	a, #0xb4
	clr	a
	rlc	a
	ld	(0x01, sp), a
	ld	a, xl
	tnz	a
	jrne	00114$
	tnz	(0x01, sp)
	jreq	00114$
;	ws2812.c: 69: r = 0, g = C, b = X;
	clrw	x
	ldw	(0x1c, sp), x
	ldw	(0x1a, sp), x
	ldw	y, (0x34, sp)
	ldw	(0x28, sp), y
	ldw	y, (0x32, sp)
	ldw	(0x26, sp), y
	ldw	y, (0x30, sp)
	ldw	(0x24, sp), y
	ldw	y, (0x2e, sp)
	ldw	(0x22, sp), y
	jra	00123$
00114$:
;	ws2812.c: 71: else if(i_h >= 180 && i_h < 240)
	ld	a, (0x42, sp)
	cp	a, #0xf0
	clr	a
	rlc	a
	tnz	(0x01, sp)
	jrne	00110$
	tnz	a
	jreq	00110$
;	ws2812.c: 73: r = 0, g = X, b = C;
	clrw	x
	ldw	(0x1c, sp), x
	ldw	(0x1a, sp), x
	ldw	y, (0x30, sp)
	ldw	(0x28, sp), y
	ldw	y, (0x2e, sp)
	ldw	(0x26, sp), y
	ldw	y, (0x34, sp)
	ldw	(0x24, sp), y
	ldw	y, (0x32, sp)
	ldw	(0x22, sp), y
	jra	00123$
00110$:
;	ws2812.c: 75: else if(i_h >= 240 && i_h < 300)
	tnz	a
	jrne	00106$
;	ws2812.c: 77: r = X, g = 0, b = C;
	ldw	y, (0x30, sp)
	ldw	(0x1c, sp), y
	ldw	y, (0x2e, sp)
	ldw	(0x1a, sp), y
	clrw	x
	ldw	(0x28, sp), x
	ldw	(0x26, sp), x
	ldw	y, (0x34, sp)
	ldw	(0x24, sp), y
	ldw	y, (0x32, sp)
	ldw	(0x22, sp), y
	jra	00123$
00106$:
;	ws2812.c: 81: r = C, g = 0, b = X;
	ldw	y, (0x34, sp)
	ldw	(0x1c, sp), y
	ldw	y, (0x32, sp)
	ldw	(0x1a, sp), y
	clrw	x
	ldw	(0x28, sp), x
	ldw	(0x26, sp), x
	ldw	y, (0x30, sp)
	ldw	(0x24, sp), y
	ldw	y, (0x2e, sp)
	ldw	(0x22, sp), y
00123$:
;	ws2812.c: 84: o_color->r = (r + m) * 255;
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	pushw	x
	pushw	y
	clrw	x
	pushw	x
	push	#0x7f
	push	#0x43
	call	___fsmul
	addw	sp, #8
	pushw	x
	pushw	y
	call	___fs2uchar
	addw	sp, #4
	ldw	x, (0x07, sp)
	ld	(x), a
;	ws2812.c: 85: o_color->g = (g + m) * 255;
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x2c, sp)
	pushw	x
	ldw	x, (0x2c, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	pushw	x
	pushw	y
	clrw	x
	pushw	x
	push	#0x7f
	push	#0x43
	call	___fsmul
	addw	sp, #8
	pushw	x
	pushw	y
	call	___fs2uchar
	addw	sp, #4
	ldw	x, (0x12, sp)
	ld	(x), a
;	ws2812.c: 86: o_color->b = (b + m) * 255;
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x28, sp)
	pushw	x
	ldw	x, (0x28, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	pushw	x
	pushw	y
	clrw	x
	pushw	x
	push	#0x7f
	push	#0x43
	call	___fsmul
	addw	sp, #8
	pushw	x
	pushw	y
	call	___fs2uchar
	addw	sp, #4
	ldw	x, (0x18, sp)
	ld	(x), a
00125$:
;	ws2812.c: 87: }
	addw	sp, #61
	ret
;	ws2812.c: 92: void WS2812_wait_spi_sr(void)
;	-----------------------------------------
;	 function WS2812_wait_spi_sr
;	-----------------------------------------
_WS2812_wait_spi_sr:
;	ws2812.c: 94: while ((SPI->SR & (uint8_t)SPI_FLAG_TXE) == (uint8_t)RESET)
00101$:
	ld	a, 0x5203
	bcp	a, #0x02
	jreq	00101$
;	ws2812.c: 96: }
	ret
;	ws2812.c: 101: void WS2812_send_led_single(uint8_t r, uint8_t g, uint8_t b)
;	-----------------------------------------
;	 function WS2812_send_led_single
;	-----------------------------------------
_WS2812_send_led_single:
;	ws2812.c: 105: SPI->DR = (g & (1 << 7)) ? WS_1 : WS_0;
	tnz	(0x04, sp)
	jrpl	00103$
	ldw	x, #0x007c
	.byte 0xbc
00103$:
	ldw	x, #0x0070
00104$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 106: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 107: SPI->DR = (g & (1 << 6)) ? WS_1 : WS_0;
	ld	a, (0x04, sp)
	bcp	a, #0x40
	jreq	00105$
	ldw	x, #0x007c
	.byte 0xbc
00105$:
	ldw	x, #0x0070
00106$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 108: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 109: SPI->DR = (g & (1 << 5)) ? WS_1 : WS_0;
	ld	a, (0x04, sp)
	bcp	a, #0x20
	jreq	00107$
	ldw	x, #0x007c
	.byte 0xbc
00107$:
	ldw	x, #0x0070
00108$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 110: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 111: SPI->DR = (g & (1 << 4)) ? WS_1 : WS_0;
	ld	a, (0x04, sp)
	bcp	a, #0x10
	jreq	00109$
	ldw	x, #0x007c
	.byte 0xbc
00109$:
	ldw	x, #0x0070
00110$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 112: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 113: SPI->DR = (g & (1 << 3)) ? WS_1 : WS_0;
	ld	a, (0x04, sp)
	bcp	a, #0x08
	jreq	00111$
	ldw	x, #0x007c
	.byte 0xbc
00111$:
	ldw	x, #0x0070
00112$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 114: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 115: SPI->DR = (g & (1 << 2)) ? WS_1 : WS_0;
	ld	a, (0x04, sp)
	bcp	a, #0x04
	jreq	00113$
	ldw	x, #0x007c
	.byte 0xbc
00113$:
	ldw	x, #0x0070
00114$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 116: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 117: SPI->DR = (g & (1 << 1)) ? WS_1 : WS_0;
	ld	a, (0x04, sp)
	bcp	a, #0x02
	jreq	00115$
	ldw	x, #0x007c
	.byte 0xbc
00115$:
	ldw	x, #0x0070
00116$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 118: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 119: SPI->DR = (g & 1) ? WS_1 : WS_0;
	ld	a, (0x04, sp)
	srl	a
	jrnc	00117$
	ldw	x, #0x007c
	.byte 0xbc
00117$:
	ldw	x, #0x0070
00118$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 120: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 122: SPI->DR = (r & (1 << 7)) ? WS_1 : WS_0;
	tnz	(0x03, sp)
	jrpl	00119$
	ldw	x, #0x007c
	.byte 0xbc
00119$:
	ldw	x, #0x0070
00120$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 123: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 124: SPI->DR = (r & (1 << 6)) ? WS_1 : WS_0;
	ld	a, (0x03, sp)
	bcp	a, #0x40
	jreq	00121$
	ldw	x, #0x007c
	.byte 0xbc
00121$:
	ldw	x, #0x0070
00122$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 125: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 126: SPI->DR = (r & (1 << 5)) ? WS_1 : WS_0;
	ld	a, (0x03, sp)
	bcp	a, #0x20
	jreq	00123$
	ldw	x, #0x007c
	.byte 0xbc
00123$:
	ldw	x, #0x0070
00124$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 127: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 128: SPI->DR = (r & (1 << 4)) ? WS_1 : WS_0;
	ld	a, (0x03, sp)
	bcp	a, #0x10
	jreq	00125$
	ldw	x, #0x007c
	.byte 0xbc
00125$:
	ldw	x, #0x0070
00126$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 129: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 130: SPI->DR = (r & (1 << 3)) ? WS_1 : WS_0;
	ld	a, (0x03, sp)
	bcp	a, #0x08
	jreq	00127$
	ldw	x, #0x007c
	.byte 0xbc
00127$:
	ldw	x, #0x0070
00128$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 131: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 132: SPI->DR = (r & (1 << 2)) ? WS_1 : WS_0;
	ld	a, (0x03, sp)
	bcp	a, #0x04
	jreq	00129$
	ldw	x, #0x007c
	.byte 0xbc
00129$:
	ldw	x, #0x0070
00130$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 133: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 134: SPI->DR = (r & (1 << 1)) ? WS_1 : WS_0;
	ld	a, (0x03, sp)
	bcp	a, #0x02
	jreq	00131$
	ldw	x, #0x007c
	.byte 0xbc
00131$:
	ldw	x, #0x0070
00132$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 135: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 136: SPI->DR = (r & 1) ? WS_1 : WS_0;
	ld	a, (0x03, sp)
	srl	a
	jrnc	00133$
	ldw	x, #0x007c
	.byte 0xbc
00133$:
	ldw	x, #0x0070
00134$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 137: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 139: SPI->DR = (b & (1 << 7)) ? WS_1 : WS_0;
	tnz	(0x05, sp)
	jrpl	00135$
	ldw	x, #0x007c
	.byte 0xbc
00135$:
	ldw	x, #0x0070
00136$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 140: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 141: SPI->DR = (b & (1 << 6)) ? WS_1 : WS_0;
	ld	a, (0x05, sp)
	bcp	a, #0x40
	jreq	00137$
	ldw	x, #0x007c
	.byte 0xbc
00137$:
	ldw	x, #0x0070
00138$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 142: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 143: SPI->DR = (b & (1 << 5)) ? WS_1 : WS_0;
	ld	a, (0x05, sp)
	bcp	a, #0x20
	jreq	00139$
	ldw	x, #0x007c
	.byte 0xbc
00139$:
	ldw	x, #0x0070
00140$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 144: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 145: SPI->DR = (b & (1 << 4)) ? WS_1 : WS_0;
	ld	a, (0x05, sp)
	bcp	a, #0x10
	jreq	00141$
	ldw	x, #0x007c
	.byte 0xbc
00141$:
	ldw	x, #0x0070
00142$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 146: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 147: SPI->DR = (b & (1 << 3)) ? WS_1 : WS_0;
	ld	a, (0x05, sp)
	bcp	a, #0x08
	jreq	00143$
	ldw	x, #0x007c
	.byte 0xbc
00143$:
	ldw	x, #0x0070
00144$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 148: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 149: SPI->DR = (b & (1 << 2)) ? WS_1 : WS_0;
	ld	a, (0x05, sp)
	bcp	a, #0x04
	jreq	00145$
	ldw	x, #0x007c
	.byte 0xbc
00145$:
	ldw	x, #0x0070
00146$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 150: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 151: SPI->DR = (b & (1 << 1)) ? WS_1 : WS_0;
	ld	a, (0x05, sp)
	bcp	a, #0x02
	jreq	00147$
	ldw	x, #0x007c
	.byte 0xbc
00147$:
	ldw	x, #0x0070
00148$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 152: WS2812_wait_spi_sr();
	call	_WS2812_wait_spi_sr
;	ws2812.c: 153: SPI->DR = (b & 1) ? WS_1 : WS_0;
	ld	a, (0x05, sp)
	srl	a
	jrnc	00149$
	ldw	x, #0x007c
	jra	00150$
00149$:
	ldw	x, #0x0070
00150$:
	ld	a, xl
	ld	0x5204, a
;	ws2812.c: 154: WS2812_wait_spi_sr();
;	ws2812.c: 160: }
	jp	_WS2812_wait_spi_sr
;	ws2812.c: 165: void WS2812_send_led_rgb_array()
;	-----------------------------------------
;	 function WS2812_send_led_rgb_array
;	-----------------------------------------
_WS2812_send_led_rgb_array:
	pushw	x
;	ws2812.c: 168: for (i = 0; i < NB_LEDS; i++)
	clr	(0x01, sp)
00102$:
;	ws2812.c: 170: WS2812_send_led_single(g_leds_matrix[i].r, g_leds_matrix[i].g, g_leds_matrix[i].b);
	ld	a, (0x01, sp)
	ld	xl, a
	ld	a, #0x03
	mul	x, a
	addw	x, #_g_leds_matrix
	exgw	x, y
	ldw	x, y
	ld	a, (0x2, x)
	ld	(0x02, sp), a
	ldw	x, y
	ld	a, (0x1, x)
	ld	xl, a
	ld	a, (y)
	ld	xh, a
	ld	a, (0x02, sp)
	push	a
	ld	a, xl
	push	a
	ld	a, xh
	push	a
	call	_WS2812_send_led_single
	addw	sp, #3
;	ws2812.c: 168: for (i = 0; i < NB_LEDS; i++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x40
	jrc	00102$
;	ws2812.c: 172: delay_10us(10); /* RET code 100us */
	push	#0x0a
	push	#0x00
	call	_delay_10us
;	ws2812.c: 173: }
	addw	sp, #4
	ret
;	ws2812.c: 178: void WS2812_clear()
;	-----------------------------------------
;	 function WS2812_clear
;	-----------------------------------------
_WS2812_clear:
	push	a
;	ws2812.c: 183: for (i = 0; i < NB_LEDS; i++)
	clr	a
	ld	xl, a
;	ws2812.c: 185: for (j = 0; j < 24; j++)
00114$:
	clr	(0x01, sp)
00106$:
;	ws2812.c: 187: SPI->DR = WS_0;
	mov	0x5204+0, #0x70
;	ws2812.c: 188: while ((SPI->SR & (uint8_t)SPI_FLAG_TXE) == (uint8_t)RESET)
00101$:
	ld	a, 0x5203
	bcp	a, #0x02
	jreq	00101$
;	ws2812.c: 185: for (j = 0; j < 24; j++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x18
	jrc	00106$
;	ws2812.c: 183: for (i = 0; i < NB_LEDS; i++)
	incw	x
	ld	a, xl
	cp	a, #0x40
	jrc	00114$
;	ws2812.c: 193: delay_10us(10); /* RET code 100 us */
	push	#0x0a
	push	#0x00
	call	_delay_10us
;	ws2812.c: 194: }
	addw	sp, #3
	ret
;	ws2812.c: 199: void WS2812_plain_color_fill(uint8_t r, uint8_t g, uint8_t b)
;	-----------------------------------------
;	 function WS2812_plain_color_fill
;	-----------------------------------------
_WS2812_plain_color_fill:
	push	a
;	ws2812.c: 201: for (uint8_t i = 0; i < NB_LEDS; i++)
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, #0x40
	jrnc	00101$
;	ws2812.c: 203: WS2812_send_led_single(r, g, b);
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_WS2812_send_led_single
	addw	sp, #3
;	ws2812.c: 201: for (uint8_t i = 0; i < NB_LEDS; i++)
	inc	(0x01, sp)
	jra	00103$
00101$:
;	ws2812.c: 206: delay_10us(10); /* RET code 100 us */
	push	#0x0a
	push	#0x00
	call	_delay_10us
;	ws2812.c: 207: }
	addw	sp, #3
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
