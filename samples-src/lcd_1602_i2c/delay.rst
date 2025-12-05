                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module delay
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _delay_10us
                                     12 	.globl _delay_ms
                                     13 	.globl _CLK_PeripheralClockConfig
                                     14 ;--------------------------------------------------------
                                     15 ; ram data
                                     16 ;--------------------------------------------------------
                                     17 	.area DATA
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area INITIALIZED
                                     22 ;--------------------------------------------------------
                                     23 ; absolute external ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DABS (ABS)
                                     26 
                                     27 ; default segment ordering for linker
                                     28 	.area HOME
                                     29 	.area GSINIT
                                     30 	.area GSFINAL
                                     31 	.area CONST
                                     32 	.area INITIALIZER
                                     33 	.area CODE
                                     34 
                                     35 ;--------------------------------------------------------
                                     36 ; global & static initialisations
                                     37 ;--------------------------------------------------------
                                     38 	.area HOME
                                     39 	.area GSINIT
                                     40 	.area GSFINAL
                                     41 	.area GSINIT
                                     42 ;--------------------------------------------------------
                                     43 ; Home
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
                                     46 	.area HOME
                                     47 ;--------------------------------------------------------
                                     48 ; code
                                     49 ;--------------------------------------------------------
                                     50 	.area CODE
                                     51 ;	delay.c: 30: void delay_ms(uint16_t n_ms)
                                     52 ;	-----------------------------------------
                                     53 ;	 function delay_ms
                                     54 ;	-----------------------------------------
      008581                         55 _delay_ms:
                                     56 ;	delay.c: 33: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      008581 4B 01            [ 1]   57 	push	#0x01
      008583 4B 04            [ 1]   58 	push	#0x04
      008585 CD 83 03         [ 4]   59 	call	_CLK_PeripheralClockConfig
      008588 85               [ 2]   60 	popw	x
                                     61 ;	delay.c: 36: TIM4->PSCR = 6;
      008589 35 06 53 47      [ 1]   62 	mov	0x5347+0, #0x06
                                     63 ;	delay.c: 39: TIM4->ARR = 250;
      00858D 35 FA 53 48      [ 1]   64 	mov	0x5348+0, #0xfa
                                     65 ;	delay.c: 42: TIM4->CNTR = 2;
      008591 35 02 53 46      [ 1]   66 	mov	0x5346+0, #0x02
                                     67 ;	delay.c: 45: TIM4->SR1 &= ~TIM4_SR1_UIF;
      008595 72 11 53 44      [ 1]   68 	bres	21316, #0
                                     69 ;	delay.c: 48: TIM4->CR1 |= TIM4_CR1_CEN;
      008599 72 10 53 40      [ 1]   70 	bset	21312, #0
                                     71 ;	delay.c: 50: while(n_ms--)
      00859D 1E 03            [ 2]   72 	ldw	x, (0x03, sp)
      00859F                         73 00104$:
      00859F 90 93            [ 1]   74 	ldw	y, x
      0085A1 5A               [ 2]   75 	decw	x
      0085A2 90 5D            [ 2]   76 	tnzw	y
      0085A4 27 0C            [ 1]   77 	jreq	00106$
                                     78 ;	delay.c: 52: while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
      0085A6                         79 00101$:
      0085A6 C6 53 44         [ 1]   80 	ld	a, 0x5344
      0085A9 44               [ 1]   81 	srl	a
      0085AA 24 FA            [ 1]   82 	jrnc	00101$
                                     83 ;	delay.c: 53: TIM4->SR1 &= ~TIM4_SR1_UIF;
      0085AC 72 11 53 44      [ 1]   84 	bres	21316, #0
      0085B0 20 ED            [ 2]   85 	jra	00104$
      0085B2                         86 00106$:
                                     87 ;	delay.c: 57: TIM4->CR1 &= ~TIM4_CR1_CEN;
      0085B2 72 11 53 40      [ 1]   88 	bres	21312, #0
                                     89 ;	delay.c: 58: }
      0085B6 81               [ 4]   90 	ret
                                     91 ;	delay.c: 66: void delay_10us(uint16_t n_10us)
                                     92 ;	-----------------------------------------
                                     93 ;	 function delay_10us
                                     94 ;	-----------------------------------------
      0085B7                         95 _delay_10us:
                                     96 ;	delay.c: 69: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      0085B7 4B 01            [ 1]   97 	push	#0x01
      0085B9 4B 04            [ 1]   98 	push	#0x04
      0085BB CD 83 03         [ 4]   99 	call	_CLK_PeripheralClockConfig
      0085BE 85               [ 2]  100 	popw	x
                                    101 ;	delay.c: 72: TIM4->PSCR = 0;
      0085BF 35 00 53 47      [ 1]  102 	mov	0x5347+0, #0x00
                                    103 ;	delay.c: 75: TIM4->ARR = 160;
      0085C3 35 A0 53 48      [ 1]  104 	mov	0x5348+0, #0xa0
                                    105 ;	delay.c: 78: TIM4->CNTR = 10;
      0085C7 35 0A 53 46      [ 1]  106 	mov	0x5346+0, #0x0a
                                    107 ;	delay.c: 81: TIM4->SR1 &= ~TIM4_SR1_UIF;
      0085CB 72 11 53 44      [ 1]  108 	bres	21316, #0
                                    109 ;	delay.c: 84: TIM4->CR1 |= TIM4_CR1_CEN;
      0085CF 72 10 53 40      [ 1]  110 	bset	21312, #0
                                    111 ;	delay.c: 86: while(n_10us--)
      0085D3 1E 03            [ 2]  112 	ldw	x, (0x03, sp)
      0085D5                        113 00104$:
      0085D5 90 93            [ 1]  114 	ldw	y, x
      0085D7 5A               [ 2]  115 	decw	x
      0085D8 90 5D            [ 2]  116 	tnzw	y
      0085DA 27 0C            [ 1]  117 	jreq	00106$
                                    118 ;	delay.c: 88: while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
      0085DC                        119 00101$:
      0085DC C6 53 44         [ 1]  120 	ld	a, 0x5344
      0085DF 44               [ 1]  121 	srl	a
      0085E0 24 FA            [ 1]  122 	jrnc	00101$
                                    123 ;	delay.c: 89: TIM4->SR1 &= ~TIM4_SR1_UIF;
      0085E2 72 11 53 44      [ 1]  124 	bres	21316, #0
      0085E6 20 ED            [ 2]  125 	jra	00104$
      0085E8                        126 00106$:
                                    127 ;	delay.c: 93: TIM4->CR1 &= ~TIM4_CR1_CEN;
      0085E8 72 11 53 40      [ 1]  128 	bres	21312, #0
                                    129 ;	delay.c: 94: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
      0085EC 4B 00            [ 1]  130 	push	#0x00
      0085EE 4B 04            [ 1]  131 	push	#0x04
      0085F0 CD 83 03         [ 4]  132 	call	_CLK_PeripheralClockConfig
      0085F3 85               [ 2]  133 	popw	x
                                    134 ;	delay.c: 96: }
      0085F4 81               [ 4]  135 	ret
                                    136 	.area CODE
                                    137 	.area CONST
                                    138 	.area INITIALIZER
                                    139 	.area CABS (ABS)
