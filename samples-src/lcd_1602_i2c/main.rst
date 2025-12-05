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
                                     12 	.globl _lcd_demo
                                     13 	.globl _gpio_config
                                     14 	.globl _clock_config_16MHz
                                     15 	.globl _delay_ms
                                     16 	.globl _lcd_bl_on
                                     17 	.globl _lcd_print_integer
                                     18 	.globl _lcd_print_string
                                     19 	.globl _lcd_set_cursor
                                     20 	.globl _lcd_clear
                                     21 	.globl _lcd_init
                                     22 	.globl _GPIO_WriteLow
                                     23 	.globl _GPIO_WriteHigh
                                     24 	.globl _GPIO_Init
                                     25 	.globl _GPIO_DeInit
                                     26 	.globl _CLK_GetFlagStatus
                                     27 	.globl _CLK_GetClockFreq
                                     28 	.globl _CLK_SYSCLKConfig
                                     29 	.globl _CLK_HSIPrescalerConfig
                                     30 	.globl _CLK_ClockSwitchConfig
                                     31 	.globl _CLK_PeripheralClockConfig
                                     32 	.globl _CLK_ClockSwitchCmd
                                     33 	.globl _CLK_LSICmd
                                     34 	.globl _CLK_HSICmd
                                     35 	.globl _CLK_HSECmd
                                     36 	.globl _CLK_DeInit
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DATA
                                     41 ;--------------------------------------------------------
                                     42 ; ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area INITIALIZED
                                     45 ;--------------------------------------------------------
                                     46 ; Stack segment in internal ram 
                                     47 ;--------------------------------------------------------
                                     48 	.area	SSEG
      FFFFFF                         49 __start__stack:
      FFFFFF                         50 	.ds	1
                                     51 
                                     52 ;--------------------------------------------------------
                                     53 ; absolute external ram data
                                     54 ;--------------------------------------------------------
                                     55 	.area DABS (ABS)
                                     56 
                                     57 ; default segment ordering for linker
                                     58 	.area HOME
                                     59 	.area GSINIT
                                     60 	.area GSFINAL
                                     61 	.area CONST
                                     62 	.area INITIALIZER
                                     63 	.area CODE
                                     64 
                                     65 ;--------------------------------------------------------
                                     66 ; interrupt vector 
                                     67 ;--------------------------------------------------------
                                     68 	.area HOME
      008000                         69 __interrupt_vect:
      008000 82 00 80 07             70 	int s_GSINIT ; reset
                                     71 ;--------------------------------------------------------
                                     72 ; global & static initialisations
                                     73 ;--------------------------------------------------------
                                     74 	.area HOME
                                     75 	.area GSINIT
                                     76 	.area GSFINAL
                                     77 	.area GSINIT
      008007                         78 __sdcc_gs_init_startup:
      008007                         79 __sdcc_init_data:
                                     80 ; stm8_genXINIT() start
      008007 AE 00 01         [ 2]   81 	ldw x, #l_DATA
      00800A 27 07            [ 1]   82 	jreq	00002$
      00800C                         83 00001$:
      00800C 72 4F 00 00      [ 1]   84 	clr (s_DATA - 1, x)
      008010 5A               [ 2]   85 	decw x
      008011 26 F9            [ 1]   86 	jrne	00001$
      008013                         87 00002$:
      008013 AE 00 00         [ 2]   88 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]   89 	jreq	00004$
      008018                         90 00003$:
      008018 D6 80 44         [ 1]   91 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 01         [ 1]   92 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]   93 	decw	x
      00801F 26 F7            [ 1]   94 	jrne	00003$
      008021                         95 00004$:
                                     96 ; stm8_genXINIT() end
                                     97 	.area GSFINAL
      008021 CC 80 04         [ 2]   98 	jp	__sdcc_program_startup
                                     99 ;--------------------------------------------------------
                                    100 ; Home
                                    101 ;--------------------------------------------------------
                                    102 	.area HOME
                                    103 	.area HOME
      008004                        104 __sdcc_program_startup:
      008004 CC 80 EF         [ 2]  105 	jp	_main
                                    106 ;	return from main will return to caller
                                    107 ;--------------------------------------------------------
                                    108 ; code
                                    109 ;--------------------------------------------------------
                                    110 	.area CODE
                                    111 ;	main.c: 11: void clock_config_16MHz()
                                    112 ;	-----------------------------------------
                                    113 ;	 function clock_config_16MHz
                                    114 ;	-----------------------------------------
      008045                        115 _clock_config_16MHz:
                                    116 ;	main.c: 13: CLK_DeInit();
      008045 CD 82 47         [ 4]  117 	call	_CLK_DeInit
                                    118 ;	main.c: 14: CLK_HSECmd(DISABLE);
      008048 4B 00            [ 1]  119 	push	#0x00
      00804A CD 82 91         [ 4]  120 	call	_CLK_HSECmd
      00804D 84               [ 1]  121 	pop	a
                                    122 ;	main.c: 15: CLK_LSICmd(DISABLE);
      00804E 4B 00            [ 1]  123 	push	#0x00
      008050 CD 82 B7         [ 4]  124 	call	_CLK_LSICmd
      008053 84               [ 1]  125 	pop	a
                                    126 ;	main.c: 16: CLK_HSICmd(ENABLE);
      008054 4B 01            [ 1]  127 	push	#0x01
      008056 CD 82 A4         [ 4]  128 	call	_CLK_HSICmd
      008059 84               [ 1]  129 	pop	a
                                    130 ;	main.c: 17: while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE)
      00805A                        131 00101$:
      00805A 4B 02            [ 1]  132 	push	#0x02
      00805C 4B 01            [ 1]  133 	push	#0x01
      00805E CD 85 0F         [ 4]  134 	call	_CLK_GetFlagStatus
      008061 85               [ 2]  135 	popw	x
      008062 4D               [ 1]  136 	tnz	a
      008063 27 F5            [ 1]  137 	jreq	00101$
                                    138 ;	main.c: 19: CLK_ClockSwitchCmd(ENABLE);
      008065 4B 01            [ 1]  139 	push	#0x01
      008067 CD 82 DD         [ 4]  140 	call	_CLK_ClockSwitchCmd
      00806A 84               [ 1]  141 	pop	a
                                    142 ;	main.c: 20: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      00806B 4B 00            [ 1]  143 	push	#0x00
      00806D CD 83 F9         [ 4]  144 	call	_CLK_HSIPrescalerConfig
      008070 84               [ 1]  145 	pop	a
                                    146 ;	main.c: 21: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
      008071 4B 80            [ 1]  147 	push	#0x80
      008073 CD 84 5F         [ 4]  148 	call	_CLK_SYSCLKConfig
      008076 84               [ 1]  149 	pop	a
                                    150 ;	main.c: 22: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI,
      008077 4B 01            [ 1]  151 	push	#0x01
      008079 4B 00            [ 1]  152 	push	#0x00
      00807B 4B E1            [ 1]  153 	push	#0xe1
      00807D 4B 01            [ 1]  154 	push	#0x01
      00807F CD 83 4B         [ 4]  155 	call	_CLK_ClockSwitchConfig
      008082 5B 04            [ 2]  156 	addw	sp, #4
                                    157 ;	main.c: 25: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      008084 4B 01            [ 1]  158 	push	#0x01
      008086 4B 00            [ 1]  159 	push	#0x00
      008088 CD 83 03         [ 4]  160 	call	_CLK_PeripheralClockConfig
      00808B 85               [ 2]  161 	popw	x
                                    162 ;	main.c: 26: }
      00808C 81               [ 4]  163 	ret
                                    164 ;	main.c: 28: void gpio_config()
                                    165 ;	-----------------------------------------
                                    166 ;	 function gpio_config
                                    167 ;	-----------------------------------------
      00808D                        168 _gpio_config:
                                    169 ;	main.c: 30: GPIO_DeInit(GPIOB);
      00808D 4B 05            [ 1]  170 	push	#0x05
      00808F 4B 50            [ 1]  171 	push	#0x50
      008091 CD 81 75         [ 4]  172 	call	_GPIO_DeInit
      008094 85               [ 2]  173 	popw	x
                                    174 ;	main.c: 31: GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
      008095 4B B0            [ 1]  175 	push	#0xb0
      008097 4B 10            [ 1]  176 	push	#0x10
      008099 4B 05            [ 1]  177 	push	#0x05
      00809B 4B 50            [ 1]  178 	push	#0x50
      00809D CD 81 84         [ 4]  179 	call	_GPIO_Init
      0080A0 5B 04            [ 2]  180 	addw	sp, #4
                                    181 ;	main.c: 32: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
      0080A2 4B B0            [ 1]  182 	push	#0xb0
      0080A4 4B 20            [ 1]  183 	push	#0x20
      0080A6 4B 05            [ 1]  184 	push	#0x05
      0080A8 4B 50            [ 1]  185 	push	#0x50
      0080AA CD 81 84         [ 4]  186 	call	_GPIO_Init
      0080AD 5B 04            [ 2]  187 	addw	sp, #4
                                    188 ;	main.c: 34: GPIO_DeInit(GPIOD);
      0080AF 4B 0F            [ 1]  189 	push	#0x0f
      0080B1 4B 50            [ 1]  190 	push	#0x50
      0080B3 CD 81 75         [ 4]  191 	call	_GPIO_DeInit
      0080B6 85               [ 2]  192 	popw	x
                                    193 ;	main.c: 35: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
      0080B7 4B F0            [ 1]  194 	push	#0xf0
      0080B9 4B 08            [ 1]  195 	push	#0x08
      0080BB 4B 0F            [ 1]  196 	push	#0x0f
      0080BD 4B 50            [ 1]  197 	push	#0x50
      0080BF CD 81 84         [ 4]  198 	call	_GPIO_Init
      0080C2 5B 04            [ 2]  199 	addw	sp, #4
                                    200 ;	main.c: 36: }
      0080C4 81               [ 4]  201 	ret
                                    202 ;	main.c: 38: void lcd_demo()
                                    203 ;	-----------------------------------------
                                    204 ;	 function lcd_demo
                                    205 ;	-----------------------------------------
      0080C5                        206 _lcd_demo:
                                    207 ;	main.c: 40: lcd_init();
      0080C5 CD 8A 2C         [ 4]  208 	call	_lcd_init
                                    209 ;	main.c: 41: lcd_clear();
      0080C8 CD 8A C1         [ 4]  210 	call	_lcd_clear
                                    211 ;	main.c: 42: lcd_bl_on(); // Back light on
      0080CB CD 8C 1E         [ 4]  212 	call	_lcd_bl_on
                                    213 ;	main.c: 43: lcd_set_cursor(0, 0);
      0080CE 4B 00            [ 1]  214 	push	#0x00
      0080D0 4B 00            [ 1]  215 	push	#0x00
      0080D2 CD 8A CE         [ 4]  216 	call	_lcd_set_cursor
      0080D5 85               [ 2]  217 	popw	x
                                    218 ;	main.c: 44: lcd_print_string("STM8 1602a TEST");
      0080D6 4B 24            [ 1]  219 	push	#<___str_0
      0080D8 4B 80            [ 1]  220 	push	#(___str_0 >> 8)
      0080DA CD 8B 5E         [ 4]  221 	call	_lcd_print_string
      0080DD 85               [ 2]  222 	popw	x
                                    223 ;	main.c: 45: lcd_set_cursor(1, 0);
      0080DE 4B 00            [ 1]  224 	push	#0x00
      0080E0 4B 01            [ 1]  225 	push	#0x01
      0080E2 CD 8A CE         [ 4]  226 	call	_lcd_set_cursor
      0080E5 85               [ 2]  227 	popw	x
                                    228 ;	main.c: 46: lcd_print_string("MHz:");
      0080E6 4B 34            [ 1]  229 	push	#<___str_1
      0080E8 4B 80            [ 1]  230 	push	#(___str_1 >> 8)
      0080EA CD 8B 5E         [ 4]  231 	call	_lcd_print_string
      0080ED 85               [ 2]  232 	popw	x
                                    233 ;	main.c: 47: }
      0080EE 81               [ 4]  234 	ret
                                    235 ;	main.c: 49: int main()
                                    236 ;	-----------------------------------------
                                    237 ;	 function main
                                    238 ;	-----------------------------------------
      0080EF                        239 _main:
      0080EF 52 08            [ 2]  240 	sub	sp, #8
                                    241 ;	main.c: 53: clock_config_16MHz();
      0080F1 CD 80 45         [ 4]  242 	call	_clock_config_16MHz
                                    243 ;	main.c: 55: gpio_config();
      0080F4 CD 80 8D         [ 4]  244 	call	_gpio_config
                                    245 ;	main.c: 57: lcd_demo();
      0080F7 CD 80 C5         [ 4]  246 	call	_lcd_demo
                                    247 ;	main.c: 59: count = CLK_GetClockFreq() / 1000000;
      0080FA CD 84 AD         [ 4]  248 	call	_CLK_GetClockFreq
      0080FD 4B 40            [ 1]  249 	push	#0x40
      0080FF 4B 42            [ 1]  250 	push	#0x42
      008101 4B 0F            [ 1]  251 	push	#0x0f
      008103 4B 00            [ 1]  252 	push	#0x00
      008105 89               [ 2]  253 	pushw	x
      008106 90 89            [ 2]  254 	pushw	y
      008108 CD 8C EC         [ 4]  255 	call	__divulong
      00810B 5B 08            [ 2]  256 	addw	sp, #8
      00810D 17 05            [ 2]  257 	ldw	(0x05, sp), y
                                    258 ;	main.c: 60: lcd_set_cursor(1, 4);
      00810F 89               [ 2]  259 	pushw	x
      008110 4B 04            [ 1]  260 	push	#0x04
      008112 4B 01            [ 1]  261 	push	#0x01
      008114 CD 8A CE         [ 4]  262 	call	_lcd_set_cursor
      008117 85               [ 2]  263 	popw	x
      008118 85               [ 2]  264 	popw	x
                                    265 ;	main.c: 61: lcd_print_integer(count, 0);
      008119 4B 00            [ 1]  266 	push	#0x00
      00811B 89               [ 2]  267 	pushw	x
      00811C 1E 08            [ 2]  268 	ldw	x, (0x08, sp)
      00811E 89               [ 2]  269 	pushw	x
      00811F CD 8B 7E         [ 4]  270 	call	_lcd_print_integer
      008122 5B 05            [ 2]  271 	addw	sp, #5
                                    272 ;	main.c: 65: while (1)
      008124 5F               [ 1]  273 	clrw	x
      008125 1F 03            [ 2]  274 	ldw	(0x03, sp), x
      008127 1F 01            [ 2]  275 	ldw	(0x01, sp), x
      008129                        276 00102$:
                                    277 ;	main.c: 67: lcd_set_cursor(1, 7);
      008129 4B 07            [ 1]  278 	push	#0x07
      00812B 4B 01            [ 1]  279 	push	#0x01
      00812D CD 8A CE         [ 4]  280 	call	_lcd_set_cursor
      008130 85               [ 2]  281 	popw	x
                                    282 ;	main.c: 68: lcd_print_integer(count, 0);
      008131 4B 00            [ 1]  283 	push	#0x00
      008133 1E 04            [ 2]  284 	ldw	x, (0x04, sp)
      008135 89               [ 2]  285 	pushw	x
      008136 1E 04            [ 2]  286 	ldw	x, (0x04, sp)
      008138 89               [ 2]  287 	pushw	x
      008139 CD 8B 7E         [ 4]  288 	call	_lcd_print_integer
      00813C 5B 05            [ 2]  289 	addw	sp, #5
                                    290 ;	main.c: 69: count++;
      00813E 1E 03            [ 2]  291 	ldw	x, (0x03, sp)
      008140 5C               [ 1]  292 	incw	x
      008141 1F 03            [ 2]  293 	ldw	(0x03, sp), x
      008143 26 05            [ 1]  294 	jrne	00111$
      008145 1E 01            [ 2]  295 	ldw	x, (0x01, sp)
      008147 5C               [ 1]  296 	incw	x
      008148 1F 01            [ 2]  297 	ldw	(0x01, sp), x
      00814A                        298 00111$:
                                    299 ;	main.c: 71: GPIO_WriteHigh(GPIOD, GPIO_PIN_3);
      00814A 4B 08            [ 1]  300 	push	#0x08
      00814C 4B 0F            [ 1]  301 	push	#0x0f
      00814E 4B 50            [ 1]  302 	push	#0x50
      008150 CD 81 FF         [ 4]  303 	call	_GPIO_WriteHigh
      008153 5B 03            [ 2]  304 	addw	sp, #3
                                    305 ;	main.c: 72: delay_ms(500);
      008155 4B F4            [ 1]  306 	push	#0xf4
      008157 4B 01            [ 1]  307 	push	#0x01
      008159 CD 85 81         [ 4]  308 	call	_delay_ms
      00815C 85               [ 2]  309 	popw	x
                                    310 ;	main.c: 73: GPIO_WriteLow(GPIOD, GPIO_PIN_3);
      00815D 4B 08            [ 1]  311 	push	#0x08
      00815F 4B 0F            [ 1]  312 	push	#0x0f
      008161 4B 50            [ 1]  313 	push	#0x50
      008163 CD 82 06         [ 4]  314 	call	_GPIO_WriteLow
      008166 5B 03            [ 2]  315 	addw	sp, #3
                                    316 ;	main.c: 74: delay_ms(500);
      008168 4B F4            [ 1]  317 	push	#0xf4
      00816A 4B 01            [ 1]  318 	push	#0x01
      00816C CD 85 81         [ 4]  319 	call	_delay_ms
      00816F 85               [ 2]  320 	popw	x
      008170 20 B7            [ 2]  321 	jra	00102$
                                    322 ;	main.c: 78: }
      008172 5B 08            [ 2]  323 	addw	sp, #8
      008174 81               [ 4]  324 	ret
                                    325 	.area CODE
                                    326 	.area CONST
      008024                        327 ___str_0:
      008024 53 54 4D 38 20 31 36   328 	.ascii "STM8 1602a TEST"
             30 32 61 20 54 45 53
             54
      008033 00                     329 	.db 0x00
      008034                        330 ___str_1:
      008034 4D 48 7A 3A            331 	.ascii "MHz:"
      008038 00                     332 	.db 0x00
                                    333 	.area INITIALIZER
                                    334 	.area CABS (ABS)
