                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module blinky
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 ;--------------------------------------------------------
                                     13 ; ram data
                                     14 ;--------------------------------------------------------
                                     15 	.area DATA
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area INITIALIZED
                                     20 ;--------------------------------------------------------
                                     21 ; Stack segment in internal ram 
                                     22 ;--------------------------------------------------------
                                     23 	.area	SSEG
      FFFFFF                         24 __start__stack:
      FFFFFF                         25 	.ds	1
                                     26 
                                     27 ;--------------------------------------------------------
                                     28 ; absolute external ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DABS (ABS)
                                     31 
                                     32 ; default segment ordering for linker
                                     33 	.area HOME
                                     34 	.area GSINIT
                                     35 	.area GSFINAL
                                     36 	.area CONST
                                     37 	.area INITIALIZER
                                     38 	.area CODE
                                     39 
                                     40 ;--------------------------------------------------------
                                     41 ; interrupt vector 
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
      008000                         44 __interrupt_vect:
      008000 82 00 80 07             45 	int s_GSINIT ; reset
                                     46 ;--------------------------------------------------------
                                     47 ; global & static initialisations
                                     48 ;--------------------------------------------------------
                                     49 	.area HOME
                                     50 	.area GSINIT
                                     51 	.area GSFINAL
                                     52 	.area GSINIT
      008007                         53 __sdcc_gs_init_startup:
      008007                         54 __sdcc_init_data:
                                     55 ; stm8_genXINIT() start
      008007 AE 00 00         [ 2]   56 	ldw x, #l_DATA
      00800A 27 07            [ 1]   57 	jreq	00002$
      00800C                         58 00001$:
      00800C 72 4F 00 00      [ 1]   59 	clr (s_DATA - 1, x)
      008010 5A               [ 2]   60 	decw x
      008011 26 F9            [ 1]   61 	jrne	00001$
      008013                         62 00002$:
      008013 AE 00 00         [ 2]   63 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]   64 	jreq	00004$
      008018                         65 00003$:
      008018 D6 80 23         [ 1]   66 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 00         [ 1]   67 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]   68 	decw	x
      00801F 26 F7            [ 1]   69 	jrne	00003$
      008021                         70 00004$:
                                     71 ; stm8_genXINIT() end
                                     72 	.area GSFINAL
      008021 CC 80 04         [ 2]   73 	jp	__sdcc_program_startup
                                     74 ;--------------------------------------------------------
                                     75 ; Home
                                     76 ;--------------------------------------------------------
                                     77 	.area HOME
                                     78 	.area HOME
      008004                         79 __sdcc_program_startup:
      008004 CC 80 24         [ 2]   80 	jp	_main
                                     81 ;	return from main will return to caller
                                     82 ;--------------------------------------------------------
                                     83 ; code
                                     84 ;--------------------------------------------------------
                                     85 	.area CODE
                                     86 ;	blinky.c: 3: int main() 
                                     87 ;	-----------------------------------------
                                     88 ;	 function main
                                     89 ;	-----------------------------------------
      008024                         90 _main:
                                     91 ;	blinky.c: 8: PB_DDR = 0x20;
      008024 35 20 50 07      [ 1]   92 	mov	0x5007+0, #0x20
                                     93 ;	blinky.c: 9: PB_CR1 = 0x20;
      008028 35 20 50 08      [ 1]   94 	mov	0x5008+0, #0x20
                                     95 ;	blinky.c: 11: do {
      00802C                         96 00102$:
                                     97 ;	blinky.c: 12: PB_ODR ^= 0b00100000;
      00802C C6 50 05         [ 1]   98 	ld	a, 0x5005
      00802F A8 20            [ 1]   99 	xor	a, #0x20
      008031 C7 50 05         [ 1]  100 	ld	0x5005, a
                                    101 ;	blinky.c: 13: for(unsigned long d = 0; d < 150000; d++) 
      008034 90 5F            [ 1]  102 	clrw	y
      008036 5F               [ 1]  103 	clrw	x
      008037                        104 00106$:
      008037 90 A3 49 F0      [ 2]  105 	cpw	y, #0x49f0
      00803B 9F               [ 1]  106 	ld	a, xl
      00803C A2 02            [ 1]  107 	sbc	a, #0x02
      00803E 9E               [ 1]  108 	ld	a, xh
      00803F A2 00            [ 1]  109 	sbc	a, #0x00
      008041 24 E9            [ 1]  110 	jrnc	00102$
      008043 90 5C            [ 1]  111 	incw	y
      008045 26 F0            [ 1]  112 	jrne	00106$
      008047 5C               [ 1]  113 	incw	x
      008048 20 ED            [ 2]  114 	jra	00106$
                                    115 ;	blinky.c: 17: } while(1);
                                    116 ;	blinky.c: 18: }
      00804A 81               [ 4]  117 	ret
                                    118 	.area CODE
                                    119 	.area CONST
                                    120 	.area INITIALIZER
                                    121 	.area CABS (ABS)
