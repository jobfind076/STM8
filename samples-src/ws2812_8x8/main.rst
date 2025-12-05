                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _leds_demo
                                     13 	.globl _spi_config
                                     14 	.globl _gpio_config
                                     15 	.globl _clock_config
                                     16 	.globl _set_color
                                     17 	.globl _get_color
                                     18 	.globl _random
                                     19 	.globl _init_rand
                                     20 	.globl _delay_ms
                                     21 	.globl _hsv_to_rgb
                                     22 	.globl _WS2812_plain_color_fill
                                     23 	.globl _WS2812_send_led_rgb_array
                                     24 	.globl _SPI_BiDirectionalLineConfig
                                     25 	.globl _SPI_Cmd
                                     26 	.globl _SPI_Init
                                     27 	.globl _SPI_DeInit
                                     28 	.globl _GPIO_Init
                                     29 	.globl _GPIO_DeInit
                                     30 	.globl _CLK_GetFlagStatus
                                     31 	.globl _CLK_SYSCLKConfig
                                     32 	.globl _CLK_HSIPrescalerConfig
                                     33 	.globl _CLK_ClockSwitchConfig
                                     34 	.globl _CLK_PeripheralClockConfig
                                     35 	.globl _CLK_ClockSwitchCmd
                                     36 	.globl _CLK_LSICmd
                                     37 	.globl _CLK_HSICmd
                                     38 	.globl _CLK_HSECmd
                                     39 	.globl _CLK_DeInit
                                     40 	.globl _rainbow_hills
                                     41 	.globl _shift_all_to_left
                                     42 	.globl _get_pixel_number
                                     43 ;--------------------------------------------------------
                                     44 ; ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DATA
      000001                         47 _rainbow_hills_column_65536_278:
      000001                         48 	.ds 1
      000002                         49 _rainbow_hills_target_level_65536_278:
      000002                         50 	.ds 1
      000003                         51 _rainbow_hills_current_level_65536_278:
      000003                         52 	.ds 1
      000004                         53 _rainbow_hills_color_65536_278:
      000004                         54 	.ds 3
      000007                         55 _shift_all_to_left_idx_d_65536_282:
      000007                         56 	.ds 1
      000008                         57 _shift_all_to_left_idx_t_65536_282:
      000008                         58 	.ds 1
      000009                         59 _shift_all_to_left_color_65536_282:
      000009                         60 	.ds 3
                                     61 ;--------------------------------------------------------
                                     62 ; ram data
                                     63 ;--------------------------------------------------------
                                     64 	.area INITIALIZED
                                     65 ;--------------------------------------------------------
                                     66 ; Stack segment in internal ram 
                                     67 ;--------------------------------------------------------
                                     68 	.area	SSEG
      FFFFFF                         69 __start__stack:
      FFFFFF                         70 	.ds	1
                                     71 
                                     72 ;--------------------------------------------------------
                                     73 ; absolute external ram data
                                     74 ;--------------------------------------------------------
                                     75 	.area DABS (ABS)
                                     76 
                                     77 ; default segment ordering for linker
                                     78 	.area HOME
                                     79 	.area GSINIT
                                     80 	.area GSFINAL
                                     81 	.area CONST
                                     82 	.area INITIALIZER
                                     83 	.area CODE
                                     84 
                                     85 ;--------------------------------------------------------
                                     86 ; interrupt vector 
                                     87 ;--------------------------------------------------------
                                     88 	.area HOME
      008000                         89 __interrupt_vect:
      008000 82 00 80 07             90 	int s_GSINIT ; reset
                                     91 ;--------------------------------------------------------
                                     92 ; global & static initialisations
                                     93 ;--------------------------------------------------------
                                     94 	.area HOME
                                     95 	.area GSINIT
                                     96 	.area GSFINAL
                                     97 	.area GSINIT
      008007                         98 __sdcc_gs_init_startup:
      008007                         99 __sdcc_init_data:
                                    100 ; stm8_genXINIT() start
      008007 AE 00 CB         [ 2]  101 	ldw x, #l_DATA
      00800A 27 07            [ 1]  102 	jreq	00002$
      00800C                        103 00001$:
      00800C 72 4F 00 00      [ 1]  104 	clr (s_DATA - 1, x)
      008010 5A               [ 2]  105 	decw x
      008011 26 F9            [ 1]  106 	jrne	00001$
      008013                        107 00002$:
      008013 AE 00 02         [ 2]  108 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]  109 	jreq	00004$
      008018                        110 00003$:
      008018 D6 80 3B         [ 1]  111 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 CB         [ 1]  112 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]  113 	decw	x
      00801F 26 F7            [ 1]  114 	jrne	00003$
      008021                        115 00004$:
                                    116 ; stm8_genXINIT() end
                                    117 ;	main.c: 64: static uint8_t column = 0;
      008021 72 5F 00 01      [ 1]  118 	clr	_rainbow_hills_column_65536_278+0
                                    119 ;	main.c: 65: static uint8_t target_level = 2;
      008025 35 02 00 02      [ 1]  120 	mov	_rainbow_hills_target_level_65536_278+0, #0x02
                                    121 ;	main.c: 66: static uint8_t current_level = 0;
      008029 72 5F 00 03      [ 1]  122 	clr	_rainbow_hills_current_level_65536_278+0
                                    123 	.area GSFINAL
      00802D CC 80 04         [ 2]  124 	jp	__sdcc_program_startup
                                    125 ;--------------------------------------------------------
                                    126 ; Home
                                    127 ;--------------------------------------------------------
                                    128 	.area HOME
                                    129 	.area HOME
      008004                        130 __sdcc_program_startup:
      008004 CC 81 CE         [ 2]  131 	jp	_main
                                    132 ;	return from main will return to caller
                                    133 ;--------------------------------------------------------
                                    134 ; code
                                    135 ;--------------------------------------------------------
                                    136 	.area CODE
                                    137 ;	main.c: 17: void clock_config()
                                    138 ;	-----------------------------------------
                                    139 ;	 function clock_config
                                    140 ;	-----------------------------------------
      00803E                        141 _clock_config:
                                    142 ;	main.c: 19: CLK_DeInit();
      00803E CD 82 DB         [ 4]  143 	call	_CLK_DeInit
                                    144 ;	main.c: 20: CLK_HSECmd(DISABLE);
      008041 4B 00            [ 1]  145 	push	#0x00
      008043 CD 83 25         [ 4]  146 	call	_CLK_HSECmd
      008046 84               [ 1]  147 	pop	a
                                    148 ;	main.c: 21: CLK_LSICmd(DISABLE);
      008047 4B 00            [ 1]  149 	push	#0x00
      008049 CD 83 4B         [ 4]  150 	call	_CLK_LSICmd
      00804C 84               [ 1]  151 	pop	a
                                    152 ;	main.c: 22: CLK_HSICmd(ENABLE);
      00804D 4B 01            [ 1]  153 	push	#0x01
      00804F CD 83 38         [ 4]  154 	call	_CLK_HSICmd
      008052 84               [ 1]  155 	pop	a
                                    156 ;	main.c: 23: while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE)
      008053                        157 00101$:
      008053 4B 02            [ 1]  158 	push	#0x02
      008055 4B 01            [ 1]  159 	push	#0x01
      008057 CD 85 A3         [ 4]  160 	call	_CLK_GetFlagStatus
      00805A 85               [ 2]  161 	popw	x
      00805B 4D               [ 1]  162 	tnz	a
      00805C 27 F5            [ 1]  163 	jreq	00101$
                                    164 ;	main.c: 25: CLK_ClockSwitchCmd(ENABLE);
      00805E 4B 01            [ 1]  165 	push	#0x01
      008060 CD 83 71         [ 4]  166 	call	_CLK_ClockSwitchCmd
      008063 84               [ 1]  167 	pop	a
                                    168 ;	main.c: 26: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      008064 4B 00            [ 1]  169 	push	#0x00
      008066 CD 84 8D         [ 4]  170 	call	_CLK_HSIPrescalerConfig
      008069 84               [ 1]  171 	pop	a
                                    172 ;	main.c: 27: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
      00806A 4B 80            [ 1]  173 	push	#0x80
      00806C CD 84 F3         [ 4]  174 	call	_CLK_SYSCLKConfig
      00806F 84               [ 1]  175 	pop	a
                                    176 ;	main.c: 28: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI,
      008070 4B 01            [ 1]  177 	push	#0x01
      008072 4B 00            [ 1]  178 	push	#0x00
      008074 4B E1            [ 1]  179 	push	#0xe1
      008076 4B 01            [ 1]  180 	push	#0x01
      008078 CD 83 DF         [ 4]  181 	call	_CLK_ClockSwitchConfig
      00807B 5B 04            [ 2]  182 	addw	sp, #4
                                    183 ;	main.c: 30: }
      00807D 81               [ 4]  184 	ret
                                    185 ;	main.c: 32: void gpio_config()
                                    186 ;	-----------------------------------------
                                    187 ;	 function gpio_config
                                    188 ;	-----------------------------------------
      00807E                        189 _gpio_config:
                                    190 ;	main.c: 34: GPIO_DeInit(GPIOC);
      00807E 4B 0A            [ 1]  191 	push	#0x0a
      008080 4B 50            [ 1]  192 	push	#0x50
      008082 CD 82 09         [ 4]  193 	call	_GPIO_DeInit
      008085 85               [ 2]  194 	popw	x
                                    195 ;	main.c: 35: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST); // MOSI
      008086 4B F0            [ 1]  196 	push	#0xf0
      008088 4B 40            [ 1]  197 	push	#0x40
      00808A 4B 0A            [ 1]  198 	push	#0x0a
      00808C 4B 50            [ 1]  199 	push	#0x50
      00808E CD 82 18         [ 4]  200 	call	_GPIO_Init
      008091 5B 04            [ 2]  201 	addw	sp, #4
                                    202 ;	main.c: 36: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST); // CLK
      008093 4B F0            [ 1]  203 	push	#0xf0
      008095 4B 20            [ 1]  204 	push	#0x20
      008097 4B 0A            [ 1]  205 	push	#0x0a
      008099 4B 50            [ 1]  206 	push	#0x50
      00809B CD 82 18         [ 4]  207 	call	_GPIO_Init
      00809E 5B 04            [ 2]  208 	addw	sp, #4
                                    209 ;	main.c: 37: }
      0080A0 81               [ 4]  210 	ret
                                    211 ;	main.c: 39: void spi_config()
                                    212 ;	-----------------------------------------
                                    213 ;	 function spi_config
                                    214 ;	-----------------------------------------
      0080A1                        215 _spi_config:
                                    216 ;	main.c: 41: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
      0080A1 4B 01            [ 1]  217 	push	#0x01
      0080A3 4B 01            [ 1]  218 	push	#0x01
      0080A5 CD 83 97         [ 4]  219 	call	_CLK_PeripheralClockConfig
      0080A8 85               [ 2]  220 	popw	x
                                    221 ;	main.c: 43: SPI_DeInit();
      0080A9 CD 86 15         [ 4]  222 	call	_SPI_DeInit
                                    223 ;	main.c: 44: SPI_Init(SPI_FIRSTBIT_MSB,
      0080AC 4B 00            [ 1]  224 	push	#0x00
      0080AE 4B 02            [ 1]  225 	push	#0x02
      0080B0 4B 00            [ 1]  226 	push	#0x00
      0080B2 4B 00            [ 1]  227 	push	#0x00
      0080B4 4B 00            [ 1]  228 	push	#0x00
      0080B6 4B 04            [ 1]  229 	push	#0x04
      0080B8 4B 00            [ 1]  230 	push	#0x00
      0080BA 4B 00            [ 1]  231 	push	#0x00
      0080BC CD 86 2A         [ 4]  232 	call	_SPI_Init
      0080BF 5B 08            [ 2]  233 	addw	sp, #8
                                    234 ;	main.c: 52: SPI_Cmd(ENABLE);
      0080C1 4B 01            [ 1]  235 	push	#0x01
      0080C3 CD 86 68         [ 4]  236 	call	_SPI_Cmd
      0080C6 84               [ 1]  237 	pop	a
                                    238 ;	main.c: 53: SPI_BiDirectionalLineConfig(SPI_DIRECTION_TX);
      0080C7 4B 01            [ 1]  239 	push	#0x01
      0080C9 CD 86 FC         [ 4]  240 	call	_SPI_BiDirectionalLineConfig
      0080CC 84               [ 1]  241 	pop	a
                                    242 ;	main.c: 54: }
      0080CD 81               [ 4]  243 	ret
                                    244 ;	main.c: 56: void leds_demo()
                                    245 ;	-----------------------------------------
                                    246 ;	 function leds_demo
                                    247 ;	-----------------------------------------
      0080CE                        248 _leds_demo:
                                    249 ;	main.c: 58: rainbow_hills();
      0080CE CD 80 D4         [ 4]  250 	call	_rainbow_hills
                                    251 ;	main.c: 59: WS2812_send_led_rgb_array();
                                    252 ;	main.c: 60: }
      0080D1 CC 8D 6E         [ 2]  253 	jp	_WS2812_send_led_rgb_array
                                    254 ;	main.c: 62: void rainbow_hills()
                                    255 ;	-----------------------------------------
                                    256 ;	 function rainbow_hills
                                    257 ;	-----------------------------------------
      0080D4                        258 _rainbow_hills:
                                    259 ;	main.c: 69: target_level = random(2, HEIGHT - 1);
      0080D4 4B 07            [ 1]  260 	push	#0x07
      0080D6 4B 00            [ 1]  261 	push	#0x00
      0080D8 4B 02            [ 1]  262 	push	#0x02
      0080DA 4B 00            [ 1]  263 	push	#0x00
      0080DC CD 88 0F         [ 4]  264 	call	_random
      0080DF 5B 04            [ 2]  265 	addw	sp, #4
      0080E1 9F               [ 1]  266 	ld	a, xl
      0080E2 C7 00 02         [ 1]  267 	ld	_rainbow_hills_target_level_65536_278+0, a
                                    268 ;	main.c: 71: if (column == WIDTH)
      0080E5 C6 00 01         [ 1]  269 	ld	a, _rainbow_hills_column_65536_278+0
      0080E8 A1 08            [ 1]  270 	cp	a, #0x08
      0080EA 26 07            [ 1]  271 	jrne	00102$
                                    272 ;	main.c: 74: shift_all_to_left();
      0080EC CD 81 4A         [ 4]  273 	call	_shift_all_to_left
                                    274 ;	main.c: 75: column = WIDTH - 1;
      0080EF 35 07 00 01      [ 1]  275 	mov	_rainbow_hills_column_65536_278+0, #0x07
      0080F3                        276 00102$:
                                    277 ;	main.c: 78: if (current_level < target_level)
      0080F3 C6 00 02         [ 1]  278 	ld	a, _rainbow_hills_target_level_65536_278+0
      0080F6 C1 00 03         [ 1]  279 	cp	a, _rainbow_hills_current_level_65536_278+0
      0080F9 23 35            [ 2]  280 	jrule	00104$
                                    281 ;	main.c: 80: hsv_to_rgb(&color, random(40, 255), 100, 100);
      0080FB 4B FF            [ 1]  282 	push	#0xff
      0080FD 4B 00            [ 1]  283 	push	#0x00
      0080FF 4B 28            [ 1]  284 	push	#0x28
      008101 4B 00            [ 1]  285 	push	#0x00
      008103 CD 88 0F         [ 4]  286 	call	_random
      008106 5B 04            [ 2]  287 	addw	sp, #4
      008108 9F               [ 1]  288 	ld	a, xl
      008109 4B 64            [ 1]  289 	push	#0x64
      00810B 4B 64            [ 1]  290 	push	#0x64
      00810D 88               [ 1]  291 	push	a
      00810E 4B 04            [ 1]  292 	push	#<_rainbow_hills_color_65536_278
      008110 4B 00            [ 1]  293 	push	#(_rainbow_hills_color_65536_278 >> 8)
      008112 CD 88 ED         [ 4]  294 	call	_hsv_to_rgb
      008115 5B 05            [ 2]  295 	addw	sp, #5
                                    296 ;	main.c: 81: set_color(get_pixel_number(column, current_level), &color);
      008117 3B 00 03         [ 1]  297 	push	_rainbow_hills_current_level_65536_278+0
      00811A 3B 00 01         [ 1]  298 	push	_rainbow_hills_column_65536_278+0
      00811D CD 81 C6         [ 4]  299 	call	_get_pixel_number
      008120 85               [ 2]  300 	popw	x
      008121 4B 04            [ 1]  301 	push	#<_rainbow_hills_color_65536_278
      008123 4B 00            [ 1]  302 	push	#(_rainbow_hills_color_65536_278 >> 8)
      008125 88               [ 1]  303 	push	a
      008126 CD 88 93         [ 4]  304 	call	_set_color
      008129 5B 03            [ 2]  305 	addw	sp, #3
                                    306 ;	main.c: 82: current_level++;
      00812B 72 5C 00 03      [ 1]  307 	inc	_rainbow_hills_current_level_65536_278+0
      00812F 81               [ 4]  308 	ret
      008130                        309 00104$:
                                    310 ;	main.c: 86: current_level = 0;
      008130 72 5F 00 03      [ 1]  311 	clr	_rainbow_hills_current_level_65536_278+0
                                    312 ;	main.c: 87: target_level = random(1, HEIGHT - 1);
      008134 4B 07            [ 1]  313 	push	#0x07
      008136 4B 00            [ 1]  314 	push	#0x00
      008138 4B 01            [ 1]  315 	push	#0x01
      00813A 4B 00            [ 1]  316 	push	#0x00
      00813C CD 88 0F         [ 4]  317 	call	_random
      00813F 5B 04            [ 2]  318 	addw	sp, #4
      008141 9F               [ 1]  319 	ld	a, xl
      008142 C7 00 02         [ 1]  320 	ld	_rainbow_hills_target_level_65536_278+0, a
                                    321 ;	main.c: 88: column++;
      008145 72 5C 00 01      [ 1]  322 	inc	_rainbow_hills_column_65536_278+0
                                    323 ;	main.c: 90: }
      008149 81               [ 4]  324 	ret
                                    325 ;	main.c: 92: void shift_all_to_left()
                                    326 ;	-----------------------------------------
                                    327 ;	 function shift_all_to_left
                                    328 ;	-----------------------------------------
      00814A                        329 _shift_all_to_left:
      00814A 89               [ 2]  330 	pushw	x
                                    331 ;	main.c: 97: for (uint8_t y = 0; y < HEIGHT; y++)
      00814B 0F 02            [ 1]  332 	clr	(0x02, sp)
      00814D                        333 00109$:
      00814D 7B 02            [ 1]  334 	ld	a, (0x02, sp)
      00814F A1 08            [ 1]  335 	cp	a, #0x08
      008151 24 71            [ 1]  336 	jrnc	00111$
                                    337 ;	main.c: 99: for (uint8_t x = 1; x < WIDTH; x++)
      008153 A6 01            [ 1]  338 	ld	a, #0x01
      008155 6B 01            [ 1]  339 	ld	(0x01, sp), a
      008157                        340 00106$:
      008157 7B 01            [ 1]  341 	ld	a, (0x01, sp)
      008159 A1 08            [ 1]  342 	cp	a, #0x08
      00815B 24 63            [ 1]  343 	jrnc	00110$
                                    344 ;	main.c: 101: idx_d = get_pixel_number(x - 1, y);
      00815D 7B 01            [ 1]  345 	ld	a, (0x01, sp)
      00815F 4A               [ 1]  346 	dec	a
      008160 97               [ 1]  347 	ld	xl, a
      008161 7B 02            [ 1]  348 	ld	a, (0x02, sp)
      008163 88               [ 1]  349 	push	a
      008164 9F               [ 1]  350 	ld	a, xl
      008165 88               [ 1]  351 	push	a
      008166 CD 81 C6         [ 4]  352 	call	_get_pixel_number
      008169 85               [ 2]  353 	popw	x
      00816A C7 00 07         [ 1]  354 	ld	_shift_all_to_left_idx_d_65536_282+0, a
                                    355 ;	main.c: 102: idx_t = get_pixel_number(x, y);
      00816D 7B 02            [ 1]  356 	ld	a, (0x02, sp)
      00816F 88               [ 1]  357 	push	a
      008170 7B 02            [ 1]  358 	ld	a, (0x02, sp)
      008172 88               [ 1]  359 	push	a
      008173 CD 81 C6         [ 4]  360 	call	_get_pixel_number
      008176 85               [ 2]  361 	popw	x
      008177 C7 00 08         [ 1]  362 	ld	_shift_all_to_left_idx_t_65536_282+0, a
                                    363 ;	main.c: 104: get_color(idx_t, &color);
      00817A 4B 09            [ 1]  364 	push	#<_shift_all_to_left_color_65536_282
      00817C 4B 00            [ 1]  365 	push	#(_shift_all_to_left_color_65536_282 >> 8)
      00817E 3B 00 08         [ 1]  366 	push	_shift_all_to_left_idx_t_65536_282+0
      008181 CD 88 67         [ 4]  367 	call	_get_color
      008184 5B 03            [ 2]  368 	addw	sp, #3
                                    369 ;	main.c: 105: set_color(idx_d, &color);
      008186 4B 09            [ 1]  370 	push	#<_shift_all_to_left_color_65536_282
      008188 4B 00            [ 1]  371 	push	#(_shift_all_to_left_color_65536_282 >> 8)
      00818A 3B 00 07         [ 1]  372 	push	_shift_all_to_left_idx_d_65536_282+0
      00818D CD 88 93         [ 4]  373 	call	_set_color
      008190 5B 03            [ 2]  374 	addw	sp, #3
                                    375 ;	main.c: 107: if ((x + 1) == WIDTH)
      008192 5F               [ 1]  376 	clrw	x
      008193 7B 01            [ 1]  377 	ld	a, (0x01, sp)
      008195 97               [ 1]  378 	ld	xl, a
      008196 5C               [ 1]  379 	incw	x
      008197 A3 00 08         [ 2]  380 	cpw	x, #0x0008
      00819A 26 20            [ 1]  381 	jrne	00107$
                                    382 ;	main.c: 109: color.b = 0;
      00819C AE 00 0B         [ 2]  383 	ldw	x, #_shift_all_to_left_color_65536_282+2
      00819F 7F               [ 1]  384 	clr	(x)
                                    385 ;	main.c: 110: color.r = 0;
      0081A0 35 00 00 09      [ 1]  386 	mov	_shift_all_to_left_color_65536_282+0, #0x00
                                    387 ;	main.c: 111: color.g = 0;
      0081A4 AE 00 0A         [ 2]  388 	ldw	x, #_shift_all_to_left_color_65536_282+1
      0081A7 7F               [ 1]  389 	clr	(x)
                                    390 ;	main.c: 112: set_color(get_pixel_number(x, y), &color);
      0081A8 7B 02            [ 1]  391 	ld	a, (0x02, sp)
      0081AA 88               [ 1]  392 	push	a
      0081AB 7B 02            [ 1]  393 	ld	a, (0x02, sp)
      0081AD 88               [ 1]  394 	push	a
      0081AE CD 81 C6         [ 4]  395 	call	_get_pixel_number
      0081B1 85               [ 2]  396 	popw	x
      0081B2 4B 09            [ 1]  397 	push	#<_shift_all_to_left_color_65536_282
      0081B4 4B 00            [ 1]  398 	push	#(_shift_all_to_left_color_65536_282 >> 8)
      0081B6 88               [ 1]  399 	push	a
      0081B7 CD 88 93         [ 4]  400 	call	_set_color
      0081BA 5B 03            [ 2]  401 	addw	sp, #3
      0081BC                        402 00107$:
                                    403 ;	main.c: 99: for (uint8_t x = 1; x < WIDTH; x++)
      0081BC 0C 01            [ 1]  404 	inc	(0x01, sp)
      0081BE 20 97            [ 2]  405 	jra	00106$
      0081C0                        406 00110$:
                                    407 ;	main.c: 97: for (uint8_t y = 0; y < HEIGHT; y++)
      0081C0 0C 02            [ 1]  408 	inc	(0x02, sp)
      0081C2 20 89            [ 2]  409 	jra	00109$
      0081C4                        410 00111$:
                                    411 ;	main.c: 116: }
      0081C4 85               [ 2]  412 	popw	x
      0081C5 81               [ 4]  413 	ret
                                    414 ;	main.c: 118: uint8_t get_pixel_number(uint8_t x, uint8_t y)
                                    415 ;	-----------------------------------------
                                    416 ;	 function get_pixel_number
                                    417 ;	-----------------------------------------
      0081C6                        418 _get_pixel_number:
                                    419 ;	main.c: 120: return(y * WIDTH + x);
      0081C6 7B 04            [ 1]  420 	ld	a, (0x04, sp)
      0081C8 48               [ 1]  421 	sll	a
      0081C9 48               [ 1]  422 	sll	a
      0081CA 48               [ 1]  423 	sll	a
      0081CB 1B 03            [ 1]  424 	add	a, (0x03, sp)
                                    425 ;	main.c: 121: }
      0081CD 81               [ 4]  426 	ret
                                    427 ;	main.c: 123: int main()
                                    428 ;	-----------------------------------------
                                    429 ;	 function main
                                    430 ;	-----------------------------------------
      0081CE                        431 _main:
                                    432 ;	main.c: 125: clock_config();
      0081CE CD 80 3E         [ 4]  433 	call	_clock_config
                                    434 ;	main.c: 126: gpio_config();
      0081D1 CD 80 7E         [ 4]  435 	call	_gpio_config
                                    436 ;	main.c: 127: spi_config();
      0081D4 CD 80 A1         [ 4]  437 	call	_spi_config
                                    438 ;	main.c: 128: delay_ms(50);
      0081D7 4B 32            [ 1]  439 	push	#0x32
      0081D9 4B 00            [ 1]  440 	push	#0x00
      0081DB CD 87 79         [ 4]  441 	call	_delay_ms
      0081DE 85               [ 2]  442 	popw	x
                                    443 ;	main.c: 130: init_rand(1077); // todo: read pins ADC
      0081DF 4B 35            [ 1]  444 	push	#0x35
      0081E1 4B 04            [ 1]  445 	push	#0x04
      0081E3 CD 88 04         [ 4]  446 	call	_init_rand
      0081E6 85               [ 2]  447 	popw	x
                                    448 ;	main.c: 132: WS2812_plain_color_fill(40, 40, 40);
      0081E7 4B 28            [ 1]  449 	push	#0x28
      0081E9 4B 28            [ 1]  450 	push	#0x28
      0081EB 4B 28            [ 1]  451 	push	#0x28
      0081ED CD 8D CD         [ 4]  452 	call	_WS2812_plain_color_fill
      0081F0 5B 03            [ 2]  453 	addw	sp, #3
                                    454 ;	main.c: 133: delay_ms(500);
      0081F2 4B F4            [ 1]  455 	push	#0xf4
      0081F4 4B 01            [ 1]  456 	push	#0x01
      0081F6 CD 87 79         [ 4]  457 	call	_delay_ms
      0081F9 85               [ 2]  458 	popw	x
                                    459 ;	main.c: 135: while (1)
      0081FA                        460 00102$:
                                    461 ;	main.c: 137: leds_demo();
      0081FA CD 80 CE         [ 4]  462 	call	_leds_demo
                                    463 ;	main.c: 139: __asm nop __endasm;
      0081FD 9D               [ 1]  464 	nop	
                                    465 ;	main.c: 141: delay_ms(250);
      0081FE 4B FA            [ 1]  466 	push	#0xfa
      008200 4B 00            [ 1]  467 	push	#0x00
      008202 CD 87 79         [ 4]  468 	call	_delay_ms
      008205 85               [ 2]  469 	popw	x
      008206 20 F2            [ 2]  470 	jra	00102$
                                    471 ;	main.c: 145: }
      008208 81               [ 4]  472 	ret
                                    473 	.area CODE
                                    474 	.area CONST
                                    475 	.area INITIALIZER
                                    476 	.area CABS (ABS)
