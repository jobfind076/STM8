                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module lcd_i2c
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _lcd_cmd
                                     12 	.globl _lcd_set_bit
                                     13 	.globl _lcd_PCF7584_write
                                     14 	.globl _lcd_PCF7584_write8
                                     15 	.globl _delay_ms
                                     16 	.globl _I2C_CheckEvent
                                     17 	.globl _I2C_SendData
                                     18 	.globl _I2C_Send7bitAddress
                                     19 	.globl _I2C_GenerateSTOP
                                     20 	.globl _I2C_GenerateSTART
                                     21 	.globl _I2C_Init
                                     22 	.globl _CLK_GetClockFreq
                                     23 	.globl _lcd_init
                                     24 	.globl _lcd_clear
                                     25 	.globl _lcd_set_cursor
                                     26 	.globl _lcd_print_char
                                     27 	.globl _lcd_print_string
                                     28 	.globl _lcd_print_integer
                                     29 	.globl _lcd_bl_on
                                     30 	.globl _lcd_bl_off
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
      000001                         35 _g_pcf_status:
      000001                         36 	.ds 1
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area INITIALIZED
                                     41 ;--------------------------------------------------------
                                     42 ; absolute external ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area DABS (ABS)
                                     45 
                                     46 ; default segment ordering for linker
                                     47 	.area HOME
                                     48 	.area GSINIT
                                     49 	.area GSFINAL
                                     50 	.area CONST
                                     51 	.area INITIALIZER
                                     52 	.area CODE
                                     53 
                                     54 ;--------------------------------------------------------
                                     55 ; global & static initialisations
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area GSINIT
                                     59 	.area GSFINAL
                                     60 	.area GSINIT
                                     61 ;--------------------------------------------------------
                                     62 ; Home
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
                                     65 	.area HOME
                                     66 ;--------------------------------------------------------
                                     67 ; code
                                     68 ;--------------------------------------------------------
                                     69 	.area CODE
                                     70 ;	lcd_i2c.c: 7: void lcd_PCF7584_write8(u8 iData) // Write all 8 pins of PCF7584
                                     71 ;	-----------------------------------------
                                     72 ;	 function lcd_PCF7584_write8
                                     73 ;	-----------------------------------------
      00892D                         74 _lcd_PCF7584_write8:
                                     75 ;	lcd_i2c.c: 9: I2C_GenerateSTART(ENABLE);
      00892D 4B 01            [ 1]   76 	push	#0x01
      00892F CD 87 6A         [ 4]   77 	call	_I2C_GenerateSTART
      008932 84               [ 1]   78 	pop	a
                                     79 ;	lcd_i2c.c: 10: while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
      008933                         80 00101$:
      008933 4B 01            [ 1]   81 	push	#0x01
      008935 4B 03            [ 1]   82 	push	#0x03
      008937 CD 88 29         [ 4]   83 	call	_I2C_CheckEvent
      00893A 85               [ 2]   84 	popw	x
      00893B 4D               [ 1]   85 	tnz	a
      00893C 27 F5            [ 1]   86 	jreq	00101$
                                     87 ;	lcd_i2c.c: 13: I2C_Send7bitAddress(LCD_I2C_Address, I2C_DIRECTION_TX);
      00893E 4B 00            [ 1]   88 	push	#0x00
      008940 4B 4E            [ 1]   89 	push	#0x4e
      008942 CD 88 16         [ 4]   90 	call	_I2C_Send7bitAddress
      008945 85               [ 2]   91 	popw	x
                                     92 ;	lcd_i2c.c: 14: while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
      008946                         93 00104$:
      008946 4B 82            [ 1]   94 	push	#0x82
      008948 4B 07            [ 1]   95 	push	#0x07
      00894A CD 88 29         [ 4]   96 	call	_I2C_CheckEvent
      00894D 85               [ 2]   97 	popw	x
      00894E 4D               [ 1]   98 	tnz	a
      00894F 27 F5            [ 1]   99 	jreq	00104$
                                    100 ;	lcd_i2c.c: 17: I2C_SendData(iData);
      008951 7B 03            [ 1]  101 	ld	a, (0x03, sp)
      008953 88               [ 1]  102 	push	a
      008954 CD 88 22         [ 4]  103 	call	_I2C_SendData
      008957 84               [ 1]  104 	pop	a
                                    105 ;	lcd_i2c.c: 18: while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
      008958                        106 00107$:
      008958 4B 84            [ 1]  107 	push	#0x84
      00895A 4B 07            [ 1]  108 	push	#0x07
      00895C CD 88 29         [ 4]  109 	call	_I2C_CheckEvent
      00895F 85               [ 2]  110 	popw	x
      008960 4D               [ 1]  111 	tnz	a
      008961 27 F5            [ 1]  112 	jreq	00107$
                                    113 ;	lcd_i2c.c: 21: I2C_GenerateSTOP(ENABLE);
      008963 4B 01            [ 1]  114 	push	#0x01
      008965 CD 87 7D         [ 4]  115 	call	_I2C_GenerateSTOP
      008968 84               [ 1]  116 	pop	a
                                    117 ;	lcd_i2c.c: 22: g_pcf_status = iData;
      008969 7B 03            [ 1]  118 	ld	a, (0x03, sp)
      00896B C7 00 01         [ 1]  119 	ld	_g_pcf_status+0, a
                                    120 ;	lcd_i2c.c: 23: }
      00896E 81               [ 4]  121 	ret
                                    122 ;	lcd_i2c.c: 25: void lcd_PCF7584_write(uint8_t pin, uint8_t value) // Write selected pin of PCF7584
                                    123 ;	-----------------------------------------
                                    124 ;	 function lcd_PCF7584_write
                                    125 ;	-----------------------------------------
      00896F                        126 _lcd_PCF7584_write:
      00896F 88               [ 1]  127 	push	a
                                    128 ;	lcd_i2c.c: 29: g_pcf_status &= ~(1 << pin); // Set the pin value 0 or 1
      008970 7B 04            [ 1]  129 	ld	a, (0x04, sp)
      008972 97               [ 1]  130 	ld	xl, a
      008973 C6 00 01         [ 1]  131 	ld	a, _g_pcf_status+0
      008976 6B 01            [ 1]  132 	ld	(0x01, sp), a
      008978 A6 01            [ 1]  133 	ld	a, #0x01
      00897A 88               [ 1]  134 	push	a
      00897B 9F               [ 1]  135 	ld	a, xl
      00897C 4D               [ 1]  136 	tnz	a
      00897D 27 05            [ 1]  137 	jreq	00112$
      00897F                        138 00111$:
      00897F 08 01            [ 1]  139 	sll	(1, sp)
      008981 4A               [ 1]  140 	dec	a
      008982 26 FB            [ 1]  141 	jrne	00111$
      008984                        142 00112$:
      008984 84               [ 1]  143 	pop	a
                                    144 ;	lcd_i2c.c: 27: if (value == 0)
      008985 0D 05            [ 1]  145 	tnz	(0x05, sp)
      008987 26 08            [ 1]  146 	jrne	00102$
                                    147 ;	lcd_i2c.c: 29: g_pcf_status &= ~(1 << pin); // Set the pin value 0 or 1
      008989 43               [ 1]  148 	cpl	a
      00898A 14 01            [ 1]  149 	and	a, (0x01, sp)
      00898C C7 00 01         [ 1]  150 	ld	_g_pcf_status+0, a
      00898F 20 05            [ 2]  151 	jra	00103$
      008991                        152 00102$:
                                    153 ;	lcd_i2c.c: 33: g_pcf_status |= (1 << pin); // Set the pin value 0 or 1
      008991 1A 01            [ 1]  154 	or	a, (0x01, sp)
      008993 C7 00 01         [ 1]  155 	ld	_g_pcf_status+0, a
      008996                        156 00103$:
                                    157 ;	lcd_i2c.c: 36: lcd_PCF7584_write8(g_pcf_status);
      008996 3B 00 01         [ 1]  158 	push	_g_pcf_status+0
      008999 CD 89 2D         [ 4]  159 	call	_lcd_PCF7584_write8
                                    160 ;	lcd_i2c.c: 37: }
      00899C 85               [ 2]  161 	popw	x
      00899D 81               [ 4]  162 	ret
                                    163 ;	lcd_i2c.c: 39: void lcd_set_bit(char data_bit) // Based on the Hex value Set the Bits of the Data Lines
                                    164 ;	-----------------------------------------
                                    165 ;	 function lcd_set_bit
                                    166 ;	-----------------------------------------
      00899E                        167 _lcd_set_bit:
      00899E 88               [ 1]  168 	push	a
                                    169 ;	lcd_i2c.c: 41: if (data_bit & 1)
      00899F 7B 04            [ 1]  170 	ld	a, (0x04, sp)
      0089A1 6B 01            [ 1]  171 	ld	(0x01, sp), a
      0089A3 7B 01            [ 1]  172 	ld	a, (0x01, sp)
      0089A5 44               [ 1]  173 	srl	a
      0089A6 24 0A            [ 1]  174 	jrnc	00102$
                                    175 ;	lcd_i2c.c: 42: lcd_PCF7584_write(4, 1); // D4 = 1
      0089A8 4B 01            [ 1]  176 	push	#0x01
      0089AA 4B 04            [ 1]  177 	push	#0x04
      0089AC CD 89 6F         [ 4]  178 	call	_lcd_PCF7584_write
      0089AF 85               [ 2]  179 	popw	x
      0089B0 20 08            [ 2]  180 	jra	00103$
      0089B2                        181 00102$:
                                    182 ;	lcd_i2c.c: 44: lcd_PCF7584_write(4, 0); // D4 = 0
      0089B2 4B 00            [ 1]  183 	push	#0x00
      0089B4 4B 04            [ 1]  184 	push	#0x04
      0089B6 CD 89 6F         [ 4]  185 	call	_lcd_PCF7584_write
      0089B9 85               [ 2]  186 	popw	x
      0089BA                        187 00103$:
                                    188 ;	lcd_i2c.c: 46: if (data_bit & 2)
      0089BA 7B 01            [ 1]  189 	ld	a, (0x01, sp)
      0089BC A5 02            [ 1]  190 	bcp	a, #0x02
      0089BE 27 0A            [ 1]  191 	jreq	00105$
                                    192 ;	lcd_i2c.c: 47: lcd_PCF7584_write(5, 1); // D5 = 1
      0089C0 4B 01            [ 1]  193 	push	#0x01
      0089C2 4B 05            [ 1]  194 	push	#0x05
      0089C4 CD 89 6F         [ 4]  195 	call	_lcd_PCF7584_write
      0089C7 85               [ 2]  196 	popw	x
      0089C8 20 08            [ 2]  197 	jra	00106$
      0089CA                        198 00105$:
                                    199 ;	lcd_i2c.c: 49: lcd_PCF7584_write(5, 0); // D5 = 0
      0089CA 4B 00            [ 1]  200 	push	#0x00
      0089CC 4B 05            [ 1]  201 	push	#0x05
      0089CE CD 89 6F         [ 4]  202 	call	_lcd_PCF7584_write
      0089D1 85               [ 2]  203 	popw	x
      0089D2                        204 00106$:
                                    205 ;	lcd_i2c.c: 51: if (data_bit & 4)
      0089D2 7B 01            [ 1]  206 	ld	a, (0x01, sp)
      0089D4 A5 04            [ 1]  207 	bcp	a, #0x04
      0089D6 27 0A            [ 1]  208 	jreq	00108$
                                    209 ;	lcd_i2c.c: 52: lcd_PCF7584_write(6, 1); // D6 = 1
      0089D8 4B 01            [ 1]  210 	push	#0x01
      0089DA 4B 06            [ 1]  211 	push	#0x06
      0089DC CD 89 6F         [ 4]  212 	call	_lcd_PCF7584_write
      0089DF 85               [ 2]  213 	popw	x
      0089E0 20 08            [ 2]  214 	jra	00109$
      0089E2                        215 00108$:
                                    216 ;	lcd_i2c.c: 54: lcd_PCF7584_write(6, 0); // D6 = 0
      0089E2 4B 00            [ 1]  217 	push	#0x00
      0089E4 4B 06            [ 1]  218 	push	#0x06
      0089E6 CD 89 6F         [ 4]  219 	call	_lcd_PCF7584_write
      0089E9 85               [ 2]  220 	popw	x
      0089EA                        221 00109$:
                                    222 ;	lcd_i2c.c: 56: if (data_bit & 8)
      0089EA 7B 01            [ 1]  223 	ld	a, (0x01, sp)
      0089EC A5 08            [ 1]  224 	bcp	a, #0x08
      0089EE 27 0A            [ 1]  225 	jreq	00111$
                                    226 ;	lcd_i2c.c: 57: lcd_PCF7584_write(7, 1); // D7 = 1
      0089F0 4B 01            [ 1]  227 	push	#0x01
      0089F2 4B 07            [ 1]  228 	push	#0x07
      0089F4 CD 89 6F         [ 4]  229 	call	_lcd_PCF7584_write
      0089F7 85               [ 2]  230 	popw	x
      0089F8 20 08            [ 2]  231 	jra	00113$
      0089FA                        232 00111$:
                                    233 ;	lcd_i2c.c: 59: lcd_PCF7584_write(7, 0); // D7 = 0
      0089FA 4B 00            [ 1]  234 	push	#0x00
      0089FC 4B 07            [ 1]  235 	push	#0x07
      0089FE CD 89 6F         [ 4]  236 	call	_lcd_PCF7584_write
      008A01 85               [ 2]  237 	popw	x
      008A02                        238 00113$:
                                    239 ;	lcd_i2c.c: 60: }
      008A02 84               [ 1]  240 	pop	a
      008A03 81               [ 4]  241 	ret
                                    242 ;	lcd_i2c.c: 62: void lcd_cmd(char a)
                                    243 ;	-----------------------------------------
                                    244 ;	 function lcd_cmd
                                    245 ;	-----------------------------------------
      008A04                        246 _lcd_cmd:
                                    247 ;	lcd_i2c.c: 64: lcd_PCF7584_write(0, 0); // RS = 0
      008A04 4B 00            [ 1]  248 	push	#0x00
      008A06 4B 00            [ 1]  249 	push	#0x00
      008A08 CD 89 6F         [ 4]  250 	call	_lcd_PCF7584_write
      008A0B 85               [ 2]  251 	popw	x
                                    252 ;	lcd_i2c.c: 65: lcd_set_bit(a);          // Incoming Hex value
      008A0C 7B 03            [ 1]  253 	ld	a, (0x03, sp)
      008A0E 88               [ 1]  254 	push	a
      008A0F CD 89 9E         [ 4]  255 	call	_lcd_set_bit
      008A12 84               [ 1]  256 	pop	a
                                    257 ;	lcd_i2c.c: 66: lcd_PCF7584_write(2, 1); // EN  = 1
      008A13 4B 01            [ 1]  258 	push	#0x01
      008A15 4B 02            [ 1]  259 	push	#0x02
      008A17 CD 89 6F         [ 4]  260 	call	_lcd_PCF7584_write
      008A1A 85               [ 2]  261 	popw	x
                                    262 ;	lcd_i2c.c: 67: delay_ms(2);
      008A1B 4B 02            [ 1]  263 	push	#0x02
      008A1D 4B 00            [ 1]  264 	push	#0x00
      008A1F CD 85 81         [ 4]  265 	call	_delay_ms
      008A22 85               [ 2]  266 	popw	x
                                    267 ;	lcd_i2c.c: 68: lcd_PCF7584_write(2, 0); // EN  = 0
      008A23 4B 00            [ 1]  268 	push	#0x00
      008A25 4B 02            [ 1]  269 	push	#0x02
      008A27 CD 89 6F         [ 4]  270 	call	_lcd_PCF7584_write
      008A2A 85               [ 2]  271 	popw	x
                                    272 ;	lcd_i2c.c: 69: }
      008A2B 81               [ 4]  273 	ret
                                    274 ;	lcd_i2c.c: 71: void lcd_init(void)
                                    275 ;	-----------------------------------------
                                    276 ;	 function lcd_init
                                    277 ;	-----------------------------------------
      008A2C                        278 _lcd_init:
                                    279 ;	lcd_i2c.c: 75: delay_ms(10);
      008A2C 4B 0A            [ 1]  280 	push	#0x0a
      008A2E 4B 00            [ 1]  281 	push	#0x00
      008A30 CD 85 81         [ 4]  282 	call	_delay_ms
      008A33 85               [ 2]  283 	popw	x
                                    284 ;	lcd_i2c.c: 76: cpu_clock = CLK_GetClockFreq() / 1000000; // Clock speed in MHz
      008A34 CD 84 AD         [ 4]  285 	call	_CLK_GetClockFreq
      008A37 4B 40            [ 1]  286 	push	#0x40
      008A39 4B 42            [ 1]  287 	push	#0x42
      008A3B 4B 0F            [ 1]  288 	push	#0x0f
      008A3D 4B 00            [ 1]  289 	push	#0x00
      008A3F 89               [ 2]  290 	pushw	x
      008A40 90 89            [ 2]  291 	pushw	y
      008A42 CD 8C EC         [ 4]  292 	call	__divulong
      008A45 5B 08            [ 2]  293 	addw	sp, #8
      008A47 9F               [ 1]  294 	ld	a, xl
                                    295 ;	lcd_i2c.c: 77: I2C_Init(100000, LCD_I2C_Address, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, cpu_clock);
      008A48 88               [ 1]  296 	push	a
      008A49 4B 00            [ 1]  297 	push	#0x00
      008A4B 4B 01            [ 1]  298 	push	#0x01
      008A4D 4B 00            [ 1]  299 	push	#0x00
      008A4F 4B 4E            [ 1]  300 	push	#0x4e
      008A51 4B 00            [ 1]  301 	push	#0x00
      008A53 4B A0            [ 1]  302 	push	#0xa0
      008A55 4B 86            [ 1]  303 	push	#0x86
      008A57 4B 01            [ 1]  304 	push	#0x01
      008A59 4B 00            [ 1]  305 	push	#0x00
      008A5B CD 86 1A         [ 4]  306 	call	_I2C_Init
      008A5E 5B 0A            [ 2]  307 	addw	sp, #10
                                    308 ;	lcd_i2c.c: 78: lcd_PCF7584_write8(0b00000000);
      008A60 4B 00            [ 1]  309 	push	#0x00
      008A62 CD 89 2D         [ 4]  310 	call	_lcd_PCF7584_write8
      008A65 84               [ 1]  311 	pop	a
                                    312 ;	lcd_i2c.c: 79: lcd_set_bit(0x00);
      008A66 4B 00            [ 1]  313 	push	#0x00
      008A68 CD 89 9E         [ 4]  314 	call	_lcd_set_bit
      008A6B 84               [ 1]  315 	pop	a
                                    316 ;	lcd_i2c.c: 80: delay_ms(1000);
      008A6C 4B E8            [ 1]  317 	push	#0xe8
      008A6E 4B 03            [ 1]  318 	push	#0x03
      008A70 CD 85 81         [ 4]  319 	call	_delay_ms
      008A73 85               [ 2]  320 	popw	x
                                    321 ;	lcd_i2c.c: 81: lcd_cmd(0x03);
      008A74 4B 03            [ 1]  322 	push	#0x03
      008A76 CD 8A 04         [ 4]  323 	call	_lcd_cmd
      008A79 84               [ 1]  324 	pop	a
                                    325 ;	lcd_i2c.c: 82: delay_ms(5);
      008A7A 4B 05            [ 1]  326 	push	#0x05
      008A7C 4B 00            [ 1]  327 	push	#0x00
      008A7E CD 85 81         [ 4]  328 	call	_delay_ms
      008A81 85               [ 2]  329 	popw	x
                                    330 ;	lcd_i2c.c: 83: lcd_cmd(0x03);
      008A82 4B 03            [ 1]  331 	push	#0x03
      008A84 CD 8A 04         [ 4]  332 	call	_lcd_cmd
      008A87 84               [ 1]  333 	pop	a
                                    334 ;	lcd_i2c.c: 84: delay_ms(11);
      008A88 4B 0B            [ 1]  335 	push	#0x0b
      008A8A 4B 00            [ 1]  336 	push	#0x00
      008A8C CD 85 81         [ 4]  337 	call	_delay_ms
      008A8F 85               [ 2]  338 	popw	x
                                    339 ;	lcd_i2c.c: 85: lcd_cmd(0x03);
      008A90 4B 03            [ 1]  340 	push	#0x03
      008A92 CD 8A 04         [ 4]  341 	call	_lcd_cmd
      008A95 84               [ 1]  342 	pop	a
                                    343 ;	lcd_i2c.c: 86: lcd_cmd(0x02); // 02H is used for Return home -> Clears the RAM and initializes the LCD
      008A96 4B 02            [ 1]  344 	push	#0x02
      008A98 CD 8A 04         [ 4]  345 	call	_lcd_cmd
      008A9B 84               [ 1]  346 	pop	a
                                    347 ;	lcd_i2c.c: 87: lcd_cmd(0x02); // 02H is used for Return home -> Clears the RAM and initializes the LCD
      008A9C 4B 02            [ 1]  348 	push	#0x02
      008A9E CD 8A 04         [ 4]  349 	call	_lcd_cmd
      008AA1 84               [ 1]  350 	pop	a
                                    351 ;	lcd_i2c.c: 88: lcd_cmd(0x08); // Select Row 1
      008AA2 4B 08            [ 1]  352 	push	#0x08
      008AA4 CD 8A 04         [ 4]  353 	call	_lcd_cmd
      008AA7 84               [ 1]  354 	pop	a
                                    355 ;	lcd_i2c.c: 89: lcd_cmd(0x00); // Clear Row 1 Display
      008AA8 4B 00            [ 1]  356 	push	#0x00
      008AAA CD 8A 04         [ 4]  357 	call	_lcd_cmd
      008AAD 84               [ 1]  358 	pop	a
                                    359 ;	lcd_i2c.c: 90: lcd_cmd(0x0C); // Select Row 2
      008AAE 4B 0C            [ 1]  360 	push	#0x0c
      008AB0 CD 8A 04         [ 4]  361 	call	_lcd_cmd
      008AB3 84               [ 1]  362 	pop	a
                                    363 ;	lcd_i2c.c: 91: lcd_cmd(0x00); // Clear Row 2 Display
      008AB4 4B 00            [ 1]  364 	push	#0x00
      008AB6 CD 8A 04         [ 4]  365 	call	_lcd_cmd
      008AB9 84               [ 1]  366 	pop	a
                                    367 ;	lcd_i2c.c: 92: lcd_cmd(0x06);
      008ABA 4B 06            [ 1]  368 	push	#0x06
      008ABC CD 8A 04         [ 4]  369 	call	_lcd_cmd
      008ABF 84               [ 1]  370 	pop	a
                                    371 ;	lcd_i2c.c: 93: }
      008AC0 81               [ 4]  372 	ret
                                    373 ;	lcd_i2c.c: 95: void lcd_clear(void)
                                    374 ;	-----------------------------------------
                                    375 ;	 function lcd_clear
                                    376 ;	-----------------------------------------
      008AC1                        377 _lcd_clear:
                                    378 ;	lcd_i2c.c: 97: lcd_cmd(0); // Clear the LCD
      008AC1 4B 00            [ 1]  379 	push	#0x00
      008AC3 CD 8A 04         [ 4]  380 	call	_lcd_cmd
      008AC6 84               [ 1]  381 	pop	a
                                    382 ;	lcd_i2c.c: 98: lcd_cmd(1); // Move the curser to first position
      008AC7 4B 01            [ 1]  383 	push	#0x01
      008AC9 CD 8A 04         [ 4]  384 	call	_lcd_cmd
      008ACC 84               [ 1]  385 	pop	a
                                    386 ;	lcd_i2c.c: 99: }
      008ACD 81               [ 4]  387 	ret
                                    388 ;	lcd_i2c.c: 101: void lcd_set_cursor(uint8_t row, uint8_t col)
                                    389 ;	-----------------------------------------
                                    390 ;	 function lcd_set_cursor
                                    391 ;	-----------------------------------------
      008ACE                        392 _lcd_set_cursor:
                                    393 ;	lcd_i2c.c: 106: temp = 0x80 + col;     // 80H is used to move the curser
      008ACE 7B 04            [ 1]  394 	ld	a, (0x04, sp)
                                    395 ;	lcd_i2c.c: 104: if (row == 0)
      008AD0 0D 03            [ 1]  396 	tnz	(0x03, sp)
      008AD2 26 16            [ 1]  397 	jrne	00104$
                                    398 ;	lcd_i2c.c: 106: temp = 0x80 + col;     // 80H is used to move the curser
      008AD4 AB 80            [ 1]  399 	add	a, #0x80
                                    400 ;	lcd_i2c.c: 107: z = temp >> 4;       // Lower 8-bits
      008AD6 97               [ 1]  401 	ld	xl, a
      008AD7 4E               [ 1]  402 	swap	a
      008AD8 A4 0F            [ 1]  403 	and	a, #0x0f
      008ADA 41               [ 1]  404 	exg	a, xl
                                    405 ;	lcd_i2c.c: 108: y = temp & 0x0F;     // Upper 8-bits
      008ADB A4 0F            [ 1]  406 	and	a, #0x0f
                                    407 ;	lcd_i2c.c: 109: lcd_cmd(z);          // Set Row
      008ADD 88               [ 1]  408 	push	a
      008ADE 89               [ 2]  409 	pushw	x
      008ADF 5B 01            [ 2]  410 	addw	sp, #1
      008AE1 CD 8A 04         [ 4]  411 	call	_lcd_cmd
      008AE4 84               [ 1]  412 	pop	a
      008AE5 CD 8A 04         [ 4]  413 	call	_lcd_cmd
      008AE8 84               [ 1]  414 	pop	a
      008AE9 81               [ 4]  415 	ret
      008AEA                        416 00104$:
                                    417 ;	lcd_i2c.c: 112: else if (row == 1)
      008AEA 88               [ 1]  418 	push	a
      008AEB 7B 04            [ 1]  419 	ld	a, (0x04, sp)
      008AED 4A               [ 1]  420 	dec	a
      008AEE 84               [ 1]  421 	pop	a
      008AEF 27 01            [ 1]  422 	jreq	00121$
      008AF1 81               [ 4]  423 	ret
      008AF2                        424 00121$:
                                    425 ;	lcd_i2c.c: 114: temp = 0xC0 + col;
      008AF2 AB C0            [ 1]  426 	add	a, #0xc0
                                    427 ;	lcd_i2c.c: 115: z = temp >> 4;   // Lower 8-bits
      008AF4 97               [ 1]  428 	ld	xl, a
      008AF5 4E               [ 1]  429 	swap	a
      008AF6 A4 0F            [ 1]  430 	and	a, #0x0f
      008AF8 41               [ 1]  431 	exg	a, xl
                                    432 ;	lcd_i2c.c: 116: y = temp & 0x0F; // Upper 8-bits
      008AF9 A4 0F            [ 1]  433 	and	a, #0x0f
                                    434 ;	lcd_i2c.c: 117: lcd_cmd(z);      // Set Row
      008AFB 88               [ 1]  435 	push	a
      008AFC 89               [ 2]  436 	pushw	x
      008AFD 5B 01            [ 2]  437 	addw	sp, #1
      008AFF CD 8A 04         [ 4]  438 	call	_lcd_cmd
      008B02 84               [ 1]  439 	pop	a
      008B03 CD 8A 04         [ 4]  440 	call	_lcd_cmd
      008B06 84               [ 1]  441 	pop	a
                                    442 ;	lcd_i2c.c: 120: }
      008B07 81               [ 4]  443 	ret
                                    444 ;	lcd_i2c.c: 122: void lcd_print_char(char data) // Send 8-bits through 4-bit mode
                                    445 ;	-----------------------------------------
                                    446 ;	 function lcd_print_char
                                    447 ;	-----------------------------------------
      008B08                        448 _lcd_print_char:
      008B08 88               [ 1]  449 	push	a
                                    450 ;	lcd_i2c.c: 125: lower_nibble = data & 0x0F;
      008B09 7B 04            [ 1]  451 	ld	a, (0x04, sp)
      008B0B 88               [ 1]  452 	push	a
      008B0C A4 0F            [ 1]  453 	and	a, #0x0f
      008B0E 6B 02            [ 1]  454 	ld	(0x02, sp), a
      008B10 84               [ 1]  455 	pop	a
                                    456 ;	lcd_i2c.c: 126: upper_nibble = data & 0xF0;
      008B11 A4 F0            [ 1]  457 	and	a, #0xf0
                                    458 ;	lcd_i2c.c: 127: lcd_PCF7584_write(0, 1); // => RS = 1
      008B13 88               [ 1]  459 	push	a
      008B14 4B 01            [ 1]  460 	push	#0x01
      008B16 4B 00            [ 1]  461 	push	#0x00
      008B18 CD 89 6F         [ 4]  462 	call	_lcd_PCF7584_write
      008B1B 85               [ 2]  463 	popw	x
      008B1C 84               [ 1]  464 	pop	a
                                    465 ;	lcd_i2c.c: 129: lcd_set_bit(upper_nibble >> 4); // Send upper half by shifting by 4
      008B1D 4E               [ 1]  466 	swap	a
      008B1E A4 0F            [ 1]  467 	and	a, #0x0f
      008B20 88               [ 1]  468 	push	a
      008B21 CD 89 9E         [ 4]  469 	call	_lcd_set_bit
      008B24 84               [ 1]  470 	pop	a
                                    471 ;	lcd_i2c.c: 130: lcd_PCF7584_write(2, 1);        // EN = 1
      008B25 4B 01            [ 1]  472 	push	#0x01
      008B27 4B 02            [ 1]  473 	push	#0x02
      008B29 CD 89 6F         [ 4]  474 	call	_lcd_PCF7584_write
      008B2C 85               [ 2]  475 	popw	x
                                    476 ;	lcd_i2c.c: 131: delay_ms(5);
      008B2D 4B 05            [ 1]  477 	push	#0x05
      008B2F 4B 00            [ 1]  478 	push	#0x00
      008B31 CD 85 81         [ 4]  479 	call	_delay_ms
      008B34 85               [ 2]  480 	popw	x
                                    481 ;	lcd_i2c.c: 132: lcd_PCF7584_write(2, 0); // EN = 0
      008B35 4B 00            [ 1]  482 	push	#0x00
      008B37 4B 02            [ 1]  483 	push	#0x02
      008B39 CD 89 6F         [ 4]  484 	call	_lcd_PCF7584_write
      008B3C 85               [ 2]  485 	popw	x
                                    486 ;	lcd_i2c.c: 134: lcd_set_bit(lower_nibble); // Send Lower half
      008B3D 7B 01            [ 1]  487 	ld	a, (0x01, sp)
      008B3F 88               [ 1]  488 	push	a
      008B40 CD 89 9E         [ 4]  489 	call	_lcd_set_bit
      008B43 84               [ 1]  490 	pop	a
                                    491 ;	lcd_i2c.c: 135: lcd_PCF7584_write(2, 1);   // EN = 1
      008B44 4B 01            [ 1]  492 	push	#0x01
      008B46 4B 02            [ 1]  493 	push	#0x02
      008B48 CD 89 6F         [ 4]  494 	call	_lcd_PCF7584_write
      008B4B 85               [ 2]  495 	popw	x
                                    496 ;	lcd_i2c.c: 136: delay_ms(5);
      008B4C 4B 05            [ 1]  497 	push	#0x05
      008B4E 4B 00            [ 1]  498 	push	#0x00
      008B50 CD 85 81         [ 4]  499 	call	_delay_ms
      008B53 85               [ 2]  500 	popw	x
                                    501 ;	lcd_i2c.c: 137: lcd_PCF7584_write(2, 0); // EN = 0
      008B54 4B 00            [ 1]  502 	push	#0x00
      008B56 4B 02            [ 1]  503 	push	#0x02
      008B58 CD 89 6F         [ 4]  504 	call	_lcd_PCF7584_write
                                    505 ;	lcd_i2c.c: 138: }
      008B5B 5B 03            [ 2]  506 	addw	sp, #3
      008B5D 81               [ 4]  507 	ret
                                    508 ;	lcd_i2c.c: 140: void lcd_print_string(char *a)
                                    509 ;	-----------------------------------------
                                    510 ;	 function lcd_print_string
                                    511 ;	-----------------------------------------
      008B5E                        512 _lcd_print_string:
      008B5E 88               [ 1]  513 	push	a
                                    514 ;	lcd_i2c.c: 144: while (a[i] != '\0')
      008B5F 0F 01            [ 1]  515 	clr	(0x01, sp)
      008B61                        516 00101$:
      008B61 5F               [ 1]  517 	clrw	x
      008B62 7B 01            [ 1]  518 	ld	a, (0x01, sp)
      008B64 97               [ 1]  519 	ld	xl, a
      008B65 72 FB 04         [ 2]  520 	addw	x, (0x04, sp)
      008B68 F6               [ 1]  521 	ld	a, (x)
      008B69 27 11            [ 1]  522 	jreq	00104$
                                    523 ;	lcd_i2c.c: 146: lcd_print_char(a[i++]); // Split the string using pointers and call the Char function
      008B6B 7B 01            [ 1]  524 	ld	a, (0x01, sp)
      008B6D 0C 01            [ 1]  525 	inc	(0x01, sp)
      008B6F 5F               [ 1]  526 	clrw	x
      008B70 97               [ 1]  527 	ld	xl, a
      008B71 72 FB 04         [ 2]  528 	addw	x, (0x04, sp)
      008B74 F6               [ 1]  529 	ld	a, (x)
      008B75 88               [ 1]  530 	push	a
      008B76 CD 8B 08         [ 4]  531 	call	_lcd_print_char
      008B79 84               [ 1]  532 	pop	a
      008B7A 20 E5            [ 2]  533 	jra	00101$
      008B7C                        534 00104$:
                                    535 ;	lcd_i2c.c: 148: }
      008B7C 84               [ 1]  536 	pop	a
      008B7D 81               [ 4]  537 	ret
                                    538 ;	lcd_i2c.c: 150: void lcd_print_integer(long a, uint8_t print_lead_zero)
                                    539 ;	-----------------------------------------
                                    540 ;	 function lcd_print_integer
                                    541 ;	-----------------------------------------
      008B7E                        542 _lcd_print_integer:
      008B7E 52 08            [ 2]  543 	sub	sp, #8
                                    544 ;	lcd_i2c.c: 153: long m = 1000000000;
      008B80 AE CA 00         [ 2]  545 	ldw	x, #0xca00
      008B83 1F 07            [ 2]  546 	ldw	(0x07, sp), x
      008B85 AE 3B 9A         [ 2]  547 	ldw	x, #0x3b9a
      008B88 1F 05            [ 2]  548 	ldw	(0x05, sp), x
                                    549 ;	lcd_i2c.c: 155: while (m)
      008B8A 4B 0A            [ 1]  550 	push	#0x0a
      008B8C 5F               [ 1]  551 	clrw	x
      008B8D 89               [ 2]  552 	pushw	x
      008B8E 4B 00            [ 1]  553 	push	#0x00
      008B90 1E 11            [ 2]  554 	ldw	x, (0x11, sp)
      008B92 89               [ 2]  555 	pushw	x
      008B93 1E 11            [ 2]  556 	ldw	x, (0x11, sp)
      008B95 89               [ 2]  557 	pushw	x
      008B96 CD 8C 30         [ 4]  558 	call	__modslong
      008B99 5B 08            [ 2]  559 	addw	sp, #8
      008B9B 1F 03            [ 2]  560 	ldw	(0x03, sp), x
      008B9D 17 01            [ 2]  561 	ldw	(0x01, sp), y
      008B9F                        562 00111$:
      008B9F 1E 07            [ 2]  563 	ldw	x, (0x07, sp)
      008BA1 26 04            [ 1]  564 	jrne	00146$
      008BA3 1E 05            [ 2]  565 	ldw	x, (0x05, sp)
      008BA5 27 74            [ 1]  566 	jreq	00114$
      008BA7                        567 00146$:
                                    568 ;	lcd_i2c.c: 157: if (m < 10)
      008BA7 1E 07            [ 2]  569 	ldw	x, (0x07, sp)
      008BA9 A3 00 0A         [ 2]  570 	cpw	x, #0x000a
      008BAC 7B 06            [ 1]  571 	ld	a, (0x06, sp)
      008BAE A2 00            [ 1]  572 	sbc	a, #0x00
      008BB0 7B 05            [ 1]  573 	ld	a, (0x05, sp)
      008BB2 A2 00            [ 1]  574 	sbc	a, #0x00
      008BB4 2E 09            [ 1]  575 	jrsge	00104$
                                    576 ;	lcd_i2c.c: 159: d = a % 10;
      008BB6 7B 04            [ 1]  577 	ld	a, (0x04, sp)
                                    578 ;	lcd_i2c.c: 160: m = 0;
      008BB8 5F               [ 1]  579 	clrw	x
      008BB9 1F 07            [ 2]  580 	ldw	(0x07, sp), x
      008BBB 1F 05            [ 2]  581 	ldw	(0x05, sp), x
      008BBD 20 2B            [ 2]  582 	jra	00105$
      008BBF                        583 00104$:
                                    584 ;	lcd_i2c.c: 164: d = (a / m) % 10;
      008BBF 1E 07            [ 2]  585 	ldw	x, (0x07, sp)
      008BC1 89               [ 2]  586 	pushw	x
      008BC2 1E 07            [ 2]  587 	ldw	x, (0x07, sp)
      008BC4 89               [ 2]  588 	pushw	x
      008BC5 1E 11            [ 2]  589 	ldw	x, (0x11, sp)
      008BC7 89               [ 2]  590 	pushw	x
      008BC8 1E 11            [ 2]  591 	ldw	x, (0x11, sp)
      008BCA 89               [ 2]  592 	pushw	x
      008BCB CD 8C C5         [ 4]  593 	call	__divslong
      008BCE 5B 08            [ 2]  594 	addw	sp, #8
      008BD0 4B 0A            [ 1]  595 	push	#0x0a
      008BD2 4B 00            [ 1]  596 	push	#0x00
      008BD4 4B 00            [ 1]  597 	push	#0x00
      008BD6 4B 00            [ 1]  598 	push	#0x00
      008BD8 89               [ 2]  599 	pushw	x
      008BD9 90 89            [ 2]  600 	pushw	y
      008BDB CD 8C 30         [ 4]  601 	call	__modslong
      008BDE 5B 08            [ 2]  602 	addw	sp, #8
      008BE0 9F               [ 1]  603 	ld	a, xl
                                    604 ;	lcd_i2c.c: 166: if (d > 0)
      008BE1 4D               [ 1]  605 	tnz	a
      008BE2 27 06            [ 1]  606 	jreq	00105$
                                    607 ;	lcd_i2c.c: 167: print_lead_zero = 1;
      008BE4 88               [ 1]  608 	push	a
      008BE5 A6 01            [ 1]  609 	ld	a, #0x01
      008BE7 6B 10            [ 1]  610 	ld	(0x10, sp), a
      008BE9 84               [ 1]  611 	pop	a
      008BEA                        612 00105$:
                                    613 ;	lcd_i2c.c: 172: lcd_print_char(d + 48);
      008BEA 97               [ 1]  614 	ld	xl, a
      008BEB 1C 00 30         [ 2]  615 	addw	x, #48
                                    616 ;	lcd_i2c.c: 170: if (print_lead_zero)
      008BEE 0D 0F            [ 1]  617 	tnz	(0x0f, sp)
      008BF0 27 08            [ 1]  618 	jreq	00109$
                                    619 ;	lcd_i2c.c: 172: lcd_print_char(d + 48);
      008BF2 9F               [ 1]  620 	ld	a, xl
      008BF3 88               [ 1]  621 	push	a
      008BF4 CD 8B 08         [ 4]  622 	call	_lcd_print_char
      008BF7 84               [ 1]  623 	pop	a
      008BF8 20 09            [ 2]  624 	jra	00110$
      008BFA                        625 00109$:
                                    626 ;	lcd_i2c.c: 174: else if (d > 0)
      008BFA 4D               [ 1]  627 	tnz	a
      008BFB 27 06            [ 1]  628 	jreq	00110$
                                    629 ;	lcd_i2c.c: 176: lcd_print_char(d + 48);
      008BFD 9F               [ 1]  630 	ld	a, xl
      008BFE 88               [ 1]  631 	push	a
      008BFF CD 8B 08         [ 4]  632 	call	_lcd_print_char
      008C02 84               [ 1]  633 	pop	a
      008C03                        634 00110$:
                                    635 ;	lcd_i2c.c: 179: m = m / 10;
      008C03 4B 0A            [ 1]  636 	push	#0x0a
      008C05 5F               [ 1]  637 	clrw	x
      008C06 89               [ 2]  638 	pushw	x
      008C07 4B 00            [ 1]  639 	push	#0x00
      008C09 1E 0B            [ 2]  640 	ldw	x, (0x0b, sp)
      008C0B 89               [ 2]  641 	pushw	x
      008C0C 1E 0B            [ 2]  642 	ldw	x, (0x0b, sp)
      008C0E 89               [ 2]  643 	pushw	x
      008C0F CD 8C C5         [ 4]  644 	call	__divslong
      008C12 5B 08            [ 2]  645 	addw	sp, #8
      008C14 1F 07            [ 2]  646 	ldw	(0x07, sp), x
      008C16 17 05            [ 2]  647 	ldw	(0x05, sp), y
      008C18 CC 8B 9F         [ 2]  648 	jp	00111$
      008C1B                        649 00114$:
                                    650 ;	lcd_i2c.c: 181: }
      008C1B 5B 08            [ 2]  651 	addw	sp, #8
      008C1D 81               [ 4]  652 	ret
                                    653 ;	lcd_i2c.c: 183: void lcd_bl_on(void) // Back light on
                                    654 ;	-----------------------------------------
                                    655 ;	 function lcd_bl_on
                                    656 ;	-----------------------------------------
      008C1E                        657 _lcd_bl_on:
                                    658 ;	lcd_i2c.c: 185: lcd_PCF7584_write(3, 1);
      008C1E 4B 01            [ 1]  659 	push	#0x01
      008C20 4B 03            [ 1]  660 	push	#0x03
      008C22 CD 89 6F         [ 4]  661 	call	_lcd_PCF7584_write
      008C25 85               [ 2]  662 	popw	x
                                    663 ;	lcd_i2c.c: 186: }
      008C26 81               [ 4]  664 	ret
                                    665 ;	lcd_i2c.c: 188: void lcd_bl_off(void) // Back light off
                                    666 ;	-----------------------------------------
                                    667 ;	 function lcd_bl_off
                                    668 ;	-----------------------------------------
      008C27                        669 _lcd_bl_off:
                                    670 ;	lcd_i2c.c: 190: lcd_PCF7584_write(3, 0);
      008C27 4B 00            [ 1]  671 	push	#0x00
      008C29 4B 03            [ 1]  672 	push	#0x03
      008C2B CD 89 6F         [ 4]  673 	call	_lcd_PCF7584_write
      008C2E 85               [ 2]  674 	popw	x
                                    675 ;	lcd_i2c.c: 191: }
      008C2F 81               [ 4]  676 	ret
                                    677 	.area CODE
                                    678 	.area CONST
                                    679 	.area INITIALIZER
                                    680 	.area CABS (ABS)
