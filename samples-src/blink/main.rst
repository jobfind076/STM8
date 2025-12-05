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
                                     12 	.globl _clock_config
                                     13 	.globl _delay_ms
                                     14 	.globl _GPIO_WriteLow
                                     15 	.globl _GPIO_WriteHigh
                                     16 	.globl _GPIO_Init
                                     17 	.globl _CLK_GetFlagStatus
                                     18 	.globl _CLK_SYSCLKConfig
                                     19 	.globl _CLK_HSICmd
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area INITIALIZED
                                     28 ;--------------------------------------------------------
                                     29 ; Stack segment in internal ram 
                                     30 ;--------------------------------------------------------
                                     31 	.area	SSEG
      FFFFFF                         32 __start__stack:
      FFFFFF                         33 	.ds	1
                                     34 
                                     35 ;--------------------------------------------------------
                                     36 ; absolute external ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area DABS (ABS)
                                     39 
                                     40 ; default segment ordering for linker
                                     41 	.area HOME
                                     42 	.area GSINIT
                                     43 	.area GSFINAL
                                     44 	.area CONST
                                     45 	.area INITIALIZER
                                     46 	.area CODE
                                     47 
                                     48 ;--------------------------------------------------------
                                     49 ; interrupt vector 
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
      008000                         52 __interrupt_vect:
      008000 82 00 80 07             53 	int s_GSINIT ; reset
                                     54 ;--------------------------------------------------------
                                     55 ; global & static initialisations
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area GSINIT
                                     59 	.area GSFINAL
                                     60 	.area GSINIT
      008007                         61 __sdcc_gs_init_startup:
      008007                         62 __sdcc_init_data:
                                     63 ; stm8_genXINIT() start
      008007 AE 00 00         [ 2]   64 	ldw x, #l_DATA
      00800A 27 07            [ 1]   65 	jreq	00002$
      00800C                         66 00001$:
      00800C 72 4F 00 00      [ 1]   67 	clr (s_DATA - 1, x)
      008010 5A               [ 2]   68 	decw x
      008011 26 F9            [ 1]   69 	jrne	00001$
      008013                         70 00002$:
      008013 AE 00 00         [ 2]   71 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]   72 	jreq	00004$
      008018                         73 00003$:
      008018 D6 80 2F         [ 1]   74 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 00         [ 1]   75 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]   76 	decw	x
      00801F 26 F7            [ 1]   77 	jrne	00003$
      008021                         78 00004$:
                                     79 ; stm8_genXINIT() end
                                     80 	.area GSFINAL
      008021 CC 80 04         [ 2]   81 	jp	__sdcc_program_startup
                                     82 ;--------------------------------------------------------
                                     83 ; Home
                                     84 ;--------------------------------------------------------
                                     85 	.area HOME
                                     86 	.area HOME
      008004                         87 __sdcc_program_startup:
      008004 CC 80 4C         [ 2]   88 	jp	_main
                                     89 ;	return from main will return to caller
                                     90 ;--------------------------------------------------------
                                     91 ; code
                                     92 ;--------------------------------------------------------
                                     93 	.area CODE
                                     94 ;	main.c: 6: void clock_config()
                                     95 ;	-----------------------------------------
                                     96 ;	 function clock_config
                                     97 ;	-----------------------------------------
      008030                         98 _clock_config:
                                     99 ;	main.c: 9: CLK_HSICmd(ENABLE);
      008030 4B 01            [ 1]  100 	push	#0x01
      008032 CD 81 B4         [ 4]  101 	call	_CLK_HSICmd
      008035 84               [ 1]  102 	pop	a
                                    103 ;	main.c: 10: while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET)
      008036                        104 00101$:
      008036 4B 02            [ 1]  105 	push	#0x02
      008038 4B 01            [ 1]  106 	push	#0x01
      00803A CD 84 1F         [ 4]  107 	call	_CLK_GetFlagStatus
      00803D 85               [ 2]  108 	popw	x
      00803E 4D               [ 1]  109 	tnz	a
      00803F 27 F5            [ 1]  110 	jreq	00101$
                                    111 ;	main.c: 12: CLK_SYSCLKConfig(CLK_SOURCE_HSI);
      008041 4B E1            [ 1]  112 	push	#0xe1
      008043 CD 83 6F         [ 4]  113 	call	_CLK_SYSCLKConfig
      008046 84               [ 1]  114 	pop	a
                                    115 ;	main.c: 13: CLK->CKDIVR = 0x0;
      008047 35 00 50 C6      [ 1]  116 	mov	0x50c6+0, #0x00
                                    117 ;	main.c: 14: }
      00804B 81               [ 4]  118 	ret
                                    119 ;	main.c: 16: int main()
                                    120 ;	-----------------------------------------
                                    121 ;	 function main
                                    122 ;	-----------------------------------------
      00804C                        123 _main:
                                    124 ;	main.c: 18: clock_config();
      00804C CD 80 30         [ 4]  125 	call	_clock_config
                                    126 ;	main.c: 20: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
      00804F 4B F0            [ 1]  127 	push	#0xf0
      008051 4B 08            [ 1]  128 	push	#0x08
      008053 4B 0F            [ 1]  129 	push	#0x0f
      008055 4B 50            [ 1]  130 	push	#0x50
      008057 CD 80 94         [ 4]  131 	call	_GPIO_Init
      00805A 5B 04            [ 2]  132 	addw	sp, #4
                                    133 ;	main.c: 22: while (1)
      00805C                        134 00102$:
                                    135 ;	main.c: 24: GPIO_WriteHigh(GPIOD, GPIO_PIN_3);
      00805C 4B 08            [ 1]  136 	push	#0x08
      00805E 4B 0F            [ 1]  137 	push	#0x0f
      008060 4B 50            [ 1]  138 	push	#0x50
      008062 CD 81 0F         [ 4]  139 	call	_GPIO_WriteHigh
      008065 5B 03            [ 2]  140 	addw	sp, #3
                                    141 ;	main.c: 25: delay_ms(500);
      008067 4B F4            [ 1]  142 	push	#0xf4
      008069 4B 01            [ 1]  143 	push	#0x01
      00806B CD 84 91         [ 4]  144 	call	_delay_ms
      00806E 85               [ 2]  145 	popw	x
                                    146 ;	main.c: 26: GPIO_WriteLow(GPIOD, GPIO_PIN_3);
      00806F 4B 08            [ 1]  147 	push	#0x08
      008071 4B 0F            [ 1]  148 	push	#0x0f
      008073 4B 50            [ 1]  149 	push	#0x50
      008075 CD 81 16         [ 4]  150 	call	_GPIO_WriteLow
      008078 5B 03            [ 2]  151 	addw	sp, #3
                                    152 ;	main.c: 27: delay_ms(500);
      00807A 4B F4            [ 1]  153 	push	#0xf4
      00807C 4B 01            [ 1]  154 	push	#0x01
      00807E CD 84 91         [ 4]  155 	call	_delay_ms
      008081 85               [ 2]  156 	popw	x
      008082 20 D8            [ 2]  157 	jra	00102$
                                    158 ;	main.c: 30: return 0;
                                    159 ;	main.c: 31: }
      008084 81               [ 4]  160 	ret
                                    161 	.area CODE
                                    162 	.area CONST
                                    163 	.area INITIALIZER
                                    164 	.area CABS (ABS)
