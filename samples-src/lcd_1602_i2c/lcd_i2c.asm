;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module lcd_i2c
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _lcd_cmd
	.globl _lcd_set_bit
	.globl _lcd_PCF7584_write
	.globl _lcd_PCF7584_write8
	.globl _delay_ms
	.globl _I2C_CheckEvent
	.globl _I2C_SendData
	.globl _I2C_Send7bitAddress
	.globl _I2C_GenerateSTOP
	.globl _I2C_GenerateSTART
	.globl _I2C_Init
	.globl _CLK_GetClockFreq
	.globl _lcd_init
	.globl _lcd_clear
	.globl _lcd_set_cursor
	.globl _lcd_print_char
	.globl _lcd_print_string
	.globl _lcd_print_integer
	.globl _lcd_bl_on
	.globl _lcd_bl_off
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_g_pcf_status:
	.ds 1
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
;	lcd_i2c.c: 7: void lcd_PCF7584_write8(u8 iData) // Write all 8 pins of PCF7584
;	-----------------------------------------
;	 function lcd_PCF7584_write8
;	-----------------------------------------
_lcd_PCF7584_write8:
;	lcd_i2c.c: 9: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	lcd_i2c.c: 10: while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
00101$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00101$
;	lcd_i2c.c: 13: I2C_Send7bitAddress(LCD_I2C_Address, I2C_DIRECTION_TX);
	push	#0x00
	push	#0x4e
	call	_I2C_Send7bitAddress
	popw	x
;	lcd_i2c.c: 14: while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
00104$:
	push	#0x82
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00104$
;	lcd_i2c.c: 17: I2C_SendData(iData);
	ld	a, (0x03, sp)
	push	a
	call	_I2C_SendData
	pop	a
;	lcd_i2c.c: 18: while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
00107$:
	push	#0x84
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00107$
;	lcd_i2c.c: 21: I2C_GenerateSTOP(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
;	lcd_i2c.c: 22: g_pcf_status = iData;
	ld	a, (0x03, sp)
	ld	_g_pcf_status+0, a
;	lcd_i2c.c: 23: }
	ret
;	lcd_i2c.c: 25: void lcd_PCF7584_write(uint8_t pin, uint8_t value) // Write selected pin of PCF7584
;	-----------------------------------------
;	 function lcd_PCF7584_write
;	-----------------------------------------
_lcd_PCF7584_write:
	push	a
;	lcd_i2c.c: 29: g_pcf_status &= ~(1 << pin); // Set the pin value 0 or 1
	ld	a, (0x04, sp)
	ld	xl, a
	ld	a, _g_pcf_status+0
	ld	(0x01, sp), a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00112$
00111$:
	sll	(1, sp)
	dec	a
	jrne	00111$
00112$:
	pop	a
;	lcd_i2c.c: 27: if (value == 0)
	tnz	(0x05, sp)
	jrne	00102$
;	lcd_i2c.c: 29: g_pcf_status &= ~(1 << pin); // Set the pin value 0 or 1
	cpl	a
	and	a, (0x01, sp)
	ld	_g_pcf_status+0, a
	jra	00103$
00102$:
;	lcd_i2c.c: 33: g_pcf_status |= (1 << pin); // Set the pin value 0 or 1
	or	a, (0x01, sp)
	ld	_g_pcf_status+0, a
00103$:
;	lcd_i2c.c: 36: lcd_PCF7584_write8(g_pcf_status);
	push	_g_pcf_status+0
	call	_lcd_PCF7584_write8
;	lcd_i2c.c: 37: }
	popw	x
	ret
;	lcd_i2c.c: 39: void lcd_set_bit(char data_bit) // Based on the Hex value Set the Bits of the Data Lines
;	-----------------------------------------
;	 function lcd_set_bit
;	-----------------------------------------
_lcd_set_bit:
	push	a
;	lcd_i2c.c: 41: if (data_bit & 1)
	ld	a, (0x04, sp)
	ld	(0x01, sp), a
	ld	a, (0x01, sp)
	srl	a
	jrnc	00102$
;	lcd_i2c.c: 42: lcd_PCF7584_write(4, 1); // D4 = 1
	push	#0x01
	push	#0x04
	call	_lcd_PCF7584_write
	popw	x
	jra	00103$
00102$:
;	lcd_i2c.c: 44: lcd_PCF7584_write(4, 0); // D4 = 0
	push	#0x00
	push	#0x04
	call	_lcd_PCF7584_write
	popw	x
00103$:
;	lcd_i2c.c: 46: if (data_bit & 2)
	ld	a, (0x01, sp)
	bcp	a, #0x02
	jreq	00105$
;	lcd_i2c.c: 47: lcd_PCF7584_write(5, 1); // D5 = 1
	push	#0x01
	push	#0x05
	call	_lcd_PCF7584_write
	popw	x
	jra	00106$
00105$:
;	lcd_i2c.c: 49: lcd_PCF7584_write(5, 0); // D5 = 0
	push	#0x00
	push	#0x05
	call	_lcd_PCF7584_write
	popw	x
00106$:
;	lcd_i2c.c: 51: if (data_bit & 4)
	ld	a, (0x01, sp)
	bcp	a, #0x04
	jreq	00108$
;	lcd_i2c.c: 52: lcd_PCF7584_write(6, 1); // D6 = 1
	push	#0x01
	push	#0x06
	call	_lcd_PCF7584_write
	popw	x
	jra	00109$
00108$:
;	lcd_i2c.c: 54: lcd_PCF7584_write(6, 0); // D6 = 0
	push	#0x00
	push	#0x06
	call	_lcd_PCF7584_write
	popw	x
00109$:
;	lcd_i2c.c: 56: if (data_bit & 8)
	ld	a, (0x01, sp)
	bcp	a, #0x08
	jreq	00111$
;	lcd_i2c.c: 57: lcd_PCF7584_write(7, 1); // D7 = 1
	push	#0x01
	push	#0x07
	call	_lcd_PCF7584_write
	popw	x
	jra	00113$
00111$:
;	lcd_i2c.c: 59: lcd_PCF7584_write(7, 0); // D7 = 0
	push	#0x00
	push	#0x07
	call	_lcd_PCF7584_write
	popw	x
00113$:
;	lcd_i2c.c: 60: }
	pop	a
	ret
;	lcd_i2c.c: 62: void lcd_cmd(char a)
;	-----------------------------------------
;	 function lcd_cmd
;	-----------------------------------------
_lcd_cmd:
;	lcd_i2c.c: 64: lcd_PCF7584_write(0, 0); // RS = 0
	push	#0x00
	push	#0x00
	call	_lcd_PCF7584_write
	popw	x
;	lcd_i2c.c: 65: lcd_set_bit(a);          // Incoming Hex value
	ld	a, (0x03, sp)
	push	a
	call	_lcd_set_bit
	pop	a
;	lcd_i2c.c: 66: lcd_PCF7584_write(2, 1); // EN  = 1
	push	#0x01
	push	#0x02
	call	_lcd_PCF7584_write
	popw	x
;	lcd_i2c.c: 67: delay_ms(2);
	push	#0x02
	push	#0x00
	call	_delay_ms
	popw	x
;	lcd_i2c.c: 68: lcd_PCF7584_write(2, 0); // EN  = 0
	push	#0x00
	push	#0x02
	call	_lcd_PCF7584_write
	popw	x
;	lcd_i2c.c: 69: }
	ret
;	lcd_i2c.c: 71: void lcd_init(void)
;	-----------------------------------------
;	 function lcd_init
;	-----------------------------------------
_lcd_init:
;	lcd_i2c.c: 75: delay_ms(10);
	push	#0x0a
	push	#0x00
	call	_delay_ms
	popw	x
;	lcd_i2c.c: 76: cpu_clock = CLK_GetClockFreq() / 1000000; // Clock speed in MHz
	call	_CLK_GetClockFreq
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ld	a, xl
;	lcd_i2c.c: 77: I2C_Init(100000, LCD_I2C_Address, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, cpu_clock);
	push	a
	push	#0x00
	push	#0x01
	push	#0x00
	push	#0x4e
	push	#0x00
	push	#0xa0
	push	#0x86
	push	#0x01
	push	#0x00
	call	_I2C_Init
	addw	sp, #10
;	lcd_i2c.c: 78: lcd_PCF7584_write8(0b00000000);
	push	#0x00
	call	_lcd_PCF7584_write8
	pop	a
;	lcd_i2c.c: 79: lcd_set_bit(0x00);
	push	#0x00
	call	_lcd_set_bit
	pop	a
;	lcd_i2c.c: 80: delay_ms(1000);
	push	#0xe8
	push	#0x03
	call	_delay_ms
	popw	x
;	lcd_i2c.c: 81: lcd_cmd(0x03);
	push	#0x03
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 82: delay_ms(5);
	push	#0x05
	push	#0x00
	call	_delay_ms
	popw	x
;	lcd_i2c.c: 83: lcd_cmd(0x03);
	push	#0x03
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 84: delay_ms(11);
	push	#0x0b
	push	#0x00
	call	_delay_ms
	popw	x
;	lcd_i2c.c: 85: lcd_cmd(0x03);
	push	#0x03
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 86: lcd_cmd(0x02); // 02H is used for Return home -> Clears the RAM and initializes the LCD
	push	#0x02
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 87: lcd_cmd(0x02); // 02H is used for Return home -> Clears the RAM and initializes the LCD
	push	#0x02
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 88: lcd_cmd(0x08); // Select Row 1
	push	#0x08
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 89: lcd_cmd(0x00); // Clear Row 1 Display
	push	#0x00
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 90: lcd_cmd(0x0C); // Select Row 2
	push	#0x0c
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 91: lcd_cmd(0x00); // Clear Row 2 Display
	push	#0x00
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 92: lcd_cmd(0x06);
	push	#0x06
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 93: }
	ret
;	lcd_i2c.c: 95: void lcd_clear(void)
;	-----------------------------------------
;	 function lcd_clear
;	-----------------------------------------
_lcd_clear:
;	lcd_i2c.c: 97: lcd_cmd(0); // Clear the LCD
	push	#0x00
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 98: lcd_cmd(1); // Move the curser to first position
	push	#0x01
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 99: }
	ret
;	lcd_i2c.c: 101: void lcd_set_cursor(uint8_t row, uint8_t col)
;	-----------------------------------------
;	 function lcd_set_cursor
;	-----------------------------------------
_lcd_set_cursor:
;	lcd_i2c.c: 106: temp = 0x80 + col;     // 80H is used to move the curser
	ld	a, (0x04, sp)
;	lcd_i2c.c: 104: if (row == 0)
	tnz	(0x03, sp)
	jrne	00104$
;	lcd_i2c.c: 106: temp = 0x80 + col;     // 80H is used to move the curser
	add	a, #0x80
;	lcd_i2c.c: 107: z = temp >> 4;       // Lower 8-bits
	ld	xl, a
	swap	a
	and	a, #0x0f
	exg	a, xl
;	lcd_i2c.c: 108: y = temp & 0x0F;     // Upper 8-bits
	and	a, #0x0f
;	lcd_i2c.c: 109: lcd_cmd(z);          // Set Row
	push	a
	pushw	x
	addw	sp, #1
	call	_lcd_cmd
	pop	a
	call	_lcd_cmd
	pop	a
	ret
00104$:
;	lcd_i2c.c: 112: else if (row == 1)
	push	a
	ld	a, (0x04, sp)
	dec	a
	pop	a
	jreq	00121$
	ret
00121$:
;	lcd_i2c.c: 114: temp = 0xC0 + col;
	add	a, #0xc0
;	lcd_i2c.c: 115: z = temp >> 4;   // Lower 8-bits
	ld	xl, a
	swap	a
	and	a, #0x0f
	exg	a, xl
;	lcd_i2c.c: 116: y = temp & 0x0F; // Upper 8-bits
	and	a, #0x0f
;	lcd_i2c.c: 117: lcd_cmd(z);      // Set Row
	push	a
	pushw	x
	addw	sp, #1
	call	_lcd_cmd
	pop	a
	call	_lcd_cmd
	pop	a
;	lcd_i2c.c: 120: }
	ret
;	lcd_i2c.c: 122: void lcd_print_char(char data) // Send 8-bits through 4-bit mode
;	-----------------------------------------
;	 function lcd_print_char
;	-----------------------------------------
_lcd_print_char:
	push	a
;	lcd_i2c.c: 125: lower_nibble = data & 0x0F;
	ld	a, (0x04, sp)
	push	a
	and	a, #0x0f
	ld	(0x02, sp), a
	pop	a
;	lcd_i2c.c: 126: upper_nibble = data & 0xF0;
	and	a, #0xf0
;	lcd_i2c.c: 127: lcd_PCF7584_write(0, 1); // => RS = 1
	push	a
	push	#0x01
	push	#0x00
	call	_lcd_PCF7584_write
	popw	x
	pop	a
;	lcd_i2c.c: 129: lcd_set_bit(upper_nibble >> 4); // Send upper half by shifting by 4
	swap	a
	and	a, #0x0f
	push	a
	call	_lcd_set_bit
	pop	a
;	lcd_i2c.c: 130: lcd_PCF7584_write(2, 1);        // EN = 1
	push	#0x01
	push	#0x02
	call	_lcd_PCF7584_write
	popw	x
;	lcd_i2c.c: 131: delay_ms(5);
	push	#0x05
	push	#0x00
	call	_delay_ms
	popw	x
;	lcd_i2c.c: 132: lcd_PCF7584_write(2, 0); // EN = 0
	push	#0x00
	push	#0x02
	call	_lcd_PCF7584_write
	popw	x
;	lcd_i2c.c: 134: lcd_set_bit(lower_nibble); // Send Lower half
	ld	a, (0x01, sp)
	push	a
	call	_lcd_set_bit
	pop	a
;	lcd_i2c.c: 135: lcd_PCF7584_write(2, 1);   // EN = 1
	push	#0x01
	push	#0x02
	call	_lcd_PCF7584_write
	popw	x
;	lcd_i2c.c: 136: delay_ms(5);
	push	#0x05
	push	#0x00
	call	_delay_ms
	popw	x
;	lcd_i2c.c: 137: lcd_PCF7584_write(2, 0); // EN = 0
	push	#0x00
	push	#0x02
	call	_lcd_PCF7584_write
;	lcd_i2c.c: 138: }
	addw	sp, #3
	ret
;	lcd_i2c.c: 140: void lcd_print_string(char *a)
;	-----------------------------------------
;	 function lcd_print_string
;	-----------------------------------------
_lcd_print_string:
	push	a
;	lcd_i2c.c: 144: while (a[i] != '\0')
	clr	(0x01, sp)
00101$:
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x04, sp)
	ld	a, (x)
	jreq	00104$
;	lcd_i2c.c: 146: lcd_print_char(a[i++]); // Split the string using pointers and call the Char function
	ld	a, (0x01, sp)
	inc	(0x01, sp)
	clrw	x
	ld	xl, a
	addw	x, (0x04, sp)
	ld	a, (x)
	push	a
	call	_lcd_print_char
	pop	a
	jra	00101$
00104$:
;	lcd_i2c.c: 148: }
	pop	a
	ret
;	lcd_i2c.c: 150: void lcd_print_integer(long a, uint8_t print_lead_zero)
;	-----------------------------------------
;	 function lcd_print_integer
;	-----------------------------------------
_lcd_print_integer:
	sub	sp, #8
;	lcd_i2c.c: 153: long m = 1000000000;
	ldw	x, #0xca00
	ldw	(0x07, sp), x
	ldw	x, #0x3b9a
	ldw	(0x05, sp), x
;	lcd_i2c.c: 155: while (m)
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, (0x11, sp)
	pushw	x
	ldw	x, (0x11, sp)
	pushw	x
	call	__modslong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
00111$:
	ldw	x, (0x07, sp)
	jrne	00146$
	ldw	x, (0x05, sp)
	jreq	00114$
00146$:
;	lcd_i2c.c: 157: if (m < 10)
	ldw	x, (0x07, sp)
	cpw	x, #0x000a
	ld	a, (0x06, sp)
	sbc	a, #0x00
	ld	a, (0x05, sp)
	sbc	a, #0x00
	jrsge	00104$
;	lcd_i2c.c: 159: d = a % 10;
	ld	a, (0x04, sp)
;	lcd_i2c.c: 160: m = 0;
	clrw	x
	ldw	(0x07, sp), x
	ldw	(0x05, sp), x
	jra	00105$
00104$:
;	lcd_i2c.c: 164: d = (a / m) % 10;
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x11, sp)
	pushw	x
	ldw	x, (0x11, sp)
	pushw	x
	call	__divslong
	addw	sp, #8
	push	#0x0a
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	pushw	y
	call	__modslong
	addw	sp, #8
	ld	a, xl
;	lcd_i2c.c: 166: if (d > 0)
	tnz	a
	jreq	00105$
;	lcd_i2c.c: 167: print_lead_zero = 1;
	push	a
	ld	a, #0x01
	ld	(0x10, sp), a
	pop	a
00105$:
;	lcd_i2c.c: 172: lcd_print_char(d + 48);
	ld	xl, a
	addw	x, #48
;	lcd_i2c.c: 170: if (print_lead_zero)
	tnz	(0x0f, sp)
	jreq	00109$
;	lcd_i2c.c: 172: lcd_print_char(d + 48);
	ld	a, xl
	push	a
	call	_lcd_print_char
	pop	a
	jra	00110$
00109$:
;	lcd_i2c.c: 174: else if (d > 0)
	tnz	a
	jreq	00110$
;	lcd_i2c.c: 176: lcd_print_char(d + 48);
	ld	a, xl
	push	a
	call	_lcd_print_char
	pop	a
00110$:
;	lcd_i2c.c: 179: m = m / 10;
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	call	__divslong
	addw	sp, #8
	ldw	(0x07, sp), x
	ldw	(0x05, sp), y
	jp	00111$
00114$:
;	lcd_i2c.c: 181: }
	addw	sp, #8
	ret
;	lcd_i2c.c: 183: void lcd_bl_on(void) // Back light on
;	-----------------------------------------
;	 function lcd_bl_on
;	-----------------------------------------
_lcd_bl_on:
;	lcd_i2c.c: 185: lcd_PCF7584_write(3, 1);
	push	#0x01
	push	#0x03
	call	_lcd_PCF7584_write
	popw	x
;	lcd_i2c.c: 186: }
	ret
;	lcd_i2c.c: 188: void lcd_bl_off(void) // Back light off
;	-----------------------------------------
;	 function lcd_bl_off
;	-----------------------------------------
_lcd_bl_off:
;	lcd_i2c.c: 190: lcd_PCF7584_write(3, 0);
	push	#0x00
	push	#0x03
	call	_lcd_PCF7584_write
	popw	x
;	lcd_i2c.c: 191: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
