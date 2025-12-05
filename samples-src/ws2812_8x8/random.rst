                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module random
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _rand
                                     12 	.globl _init_rand
                                     13 	.globl _rand_byte
                                     14 	.globl _random
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area INITIALIZED
      0000CC                         23 _g_seed:
      0000CC                         24 	.ds 2
                                     25 ;--------------------------------------------------------
                                     26 ; absolute external ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area DABS (ABS)
                                     29 
                                     30 ; default segment ordering for linker
                                     31 	.area HOME
                                     32 	.area GSINIT
                                     33 	.area GSFINAL
                                     34 	.area CONST
                                     35 	.area INITIALIZER
                                     36 	.area CODE
                                     37 
                                     38 ;--------------------------------------------------------
                                     39 ; global & static initialisations
                                     40 ;--------------------------------------------------------
                                     41 	.area HOME
                                     42 	.area GSINIT
                                     43 	.area GSFINAL
                                     44 	.area GSINIT
                                     45 ;--------------------------------------------------------
                                     46 ; Home
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
                                     49 	.area HOME
                                     50 ;--------------------------------------------------------
                                     51 ; code
                                     52 ;--------------------------------------------------------
                                     53 	.area CODE
                                     54 ;	random.c: 7: uint16_t rand(void)
                                     55 ;	-----------------------------------------
                                     56 ;	 function rand
                                     57 ;	-----------------------------------------
      0087ED                         58 _rand:
                                     59 ;	random.c: 9: g_seed = (g_seed * 1103515245 + 12345) & 0xFFFF; // A common LCG formula
      0087ED CE 00 CC         [ 2]   60 	ldw	x, _g_seed+0
      0087F0 89               [ 2]   61 	pushw	x
      0087F1 4B 6D            [ 1]   62 	push	#0x6d
      0087F3 4B 4E            [ 1]   63 	push	#0x4e
      0087F5 CD 91 BC         [ 4]   64 	call	__mulint
      0087F8 5B 04            [ 2]   65 	addw	sp, #4
      0087FA 1C 30 39         [ 2]   66 	addw	x, #0x3039
      0087FD CF 00 CC         [ 2]   67 	ldw	_g_seed+0, x
                                     68 ;	random.c: 10: return g_seed;
      008800 CE 00 CC         [ 2]   69 	ldw	x, _g_seed+0
                                     70 ;	random.c: 11: }
      008803 81               [ 4]   71 	ret
                                     72 ;	random.c: 15: void init_rand(uint16_t value)
                                     73 ;	-----------------------------------------
                                     74 ;	 function init_rand
                                     75 ;	-----------------------------------------
      008804                         76 _init_rand:
                                     77 ;	random.c: 17: g_seed = value;
      008804 1E 03            [ 2]   78 	ldw	x, (0x03, sp)
      008806 CF 00 CC         [ 2]   79 	ldw	_g_seed+0, x
                                     80 ;	random.c: 18: }
      008809 81               [ 4]   81 	ret
                                     82 ;	random.c: 21: uint8_t rand_byte(void)
                                     83 ;	-----------------------------------------
                                     84 ;	 function rand_byte
                                     85 ;	-----------------------------------------
      00880A                         86 _rand_byte:
                                     87 ;	random.c: 23: return rand() & 0xFF;
      00880A CD 87 ED         [ 4]   88 	call	_rand
      00880D 9F               [ 1]   89 	ld	a, xl
                                     90 ;	random.c: 24: }
      00880E 81               [ 4]   91 	ret
                                     92 ;	random.c: 26: uint16_t random(uint16_t min_v, uint16_t max_v)
                                     93 ;	-----------------------------------------
                                     94 ;	 function random
                                     95 ;	-----------------------------------------
      00880F                         96 _random:
                                     97 ;	random.c: 28: uint16_t v = (min_v + rand()) % max_v;
      00880F CD 87 ED         [ 4]   98 	call	_rand
      008812 72 FB 03         [ 2]   99 	addw	x, (0x03, sp)
      008815 16 05            [ 2]  100 	ldw	y, (0x05, sp)
      008817 65               [ 2]  101 	divw	x, y
      008818 93               [ 1]  102 	ldw	x, y
                                    103 ;	random.c: 30: if (v < min_v)
      008819 13 03            [ 2]  104 	cpw	x, (0x03, sp)
      00881B 25 01            [ 1]  105 	jrc	00110$
      00881D 81               [ 4]  106 	ret
      00881E                        107 00110$:
                                    108 ;	random.c: 32: v = min_v;
      00881E 1E 03            [ 2]  109 	ldw	x, (0x03, sp)
                                    110 ;	random.c: 35: return v;
                                    111 ;	random.c: 36: }
      008820 81               [ 4]  112 	ret
                                    113 	.area CODE
                                    114 	.area CONST
                                    115 	.area INITIALIZER
      00803C                        116 __xinit__g_seed:
      00803C 00 00                  117 	.dw #0x0000
                                    118 	.area CABS (ABS)
