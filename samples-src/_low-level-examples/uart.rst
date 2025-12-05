                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module uart
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _uart_write
                                     13 	.globl _strlen
                                     14 ;--------------------------------------------------------
                                     15 ; ram data
                                     16 ;--------------------------------------------------------
                                     17 	.area DATA
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area INITIALIZED
                                     22 ;--------------------------------------------------------
                                     23 ; Stack segment in internal ram 
                                     24 ;--------------------------------------------------------
                                     25 	.area	SSEG
      FFFFFF                         26 __start__stack:
      FFFFFF                         27 	.ds	1
                                     28 
                                     29 ;--------------------------------------------------------
                                     30 ; absolute external ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DABS (ABS)
                                     33 
                                     34 ; default segment ordering for linker
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area CONST
                                     39 	.area INITIALIZER
                                     40 	.area CODE
                                     41 
                                     42 ;--------------------------------------------------------
                                     43 ; interrupt vector 
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
      008000                         46 __interrupt_vect:
      008000 82 00 80 07             47 	int s_GSINIT ; reset
                                     48 ;--------------------------------------------------------
                                     49 ; global & static initialisations
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area GSINIT
      008007                         55 __sdcc_gs_init_startup:
      008007                         56 __sdcc_init_data:
                                     57 ; stm8_genXINIT() start
      008007 AE 00 00         [ 2]   58 	ldw x, #l_DATA
      00800A 27 07            [ 1]   59 	jreq	00002$
      00800C                         60 00001$:
      00800C 72 4F 00 00      [ 1]   61 	clr (s_DATA - 1, x)
      008010 5A               [ 2]   62 	decw x
      008011 26 F9            [ 1]   63 	jrne	00001$
      008013                         64 00002$:
      008013 AE 00 00         [ 2]   65 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]   66 	jreq	00004$
      008018                         67 00003$:
      008018 D6 80 31         [ 1]   68 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 00         [ 1]   69 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]   70 	decw	x
      00801F 26 F7            [ 1]   71 	jrne	00003$
      008021                         72 00004$:
                                     73 ; stm8_genXINIT() end
                                     74 	.area GSFINAL
      008021 CC 80 04         [ 2]   75 	jp	__sdcc_program_startup
                                     76 ;--------------------------------------------------------
                                     77 ; Home
                                     78 ;--------------------------------------------------------
                                     79 	.area HOME
                                     80 	.area HOME
      008004                         81 __sdcc_program_startup:
      008004 CC 80 63         [ 2]   82 	jp	_main
                                     83 ;	return from main will return to caller
                                     84 ;--------------------------------------------------------
                                     85 ; code
                                     86 ;--------------------------------------------------------
                                     87 	.area CODE
                                     88 ;	uart.c: 4: int uart_write(const char *str) {
                                     89 ;	-----------------------------------------
                                     90 ;	 function uart_write
                                     91 ;	-----------------------------------------
      008032                         92 _uart_write:
      008032 52 03            [ 2]   93 	sub	sp, #3
                                     94 ;	uart.c: 6: for(i = 0; i < strlen(str); i++) {
      008034 0F 03            [ 1]   95 	clr	(0x03, sp)
      008036                         96 00106$:
      008036 1E 06            [ 2]   97 	ldw	x, (0x06, sp)
      008038 89               [ 2]   98 	pushw	x
      008039 CD 80 BD         [ 4]   99 	call	_strlen
      00803C 5B 02            [ 2]  100 	addw	sp, #2
      00803E 1F 01            [ 2]  101 	ldw	(0x01, sp), x
      008040 5F               [ 1]  102 	clrw	x
      008041 7B 03            [ 1]  103 	ld	a, (0x03, sp)
      008043 97               [ 1]  104 	ld	xl, a
      008044 13 01            [ 2]  105 	cpw	x, (0x01, sp)
      008046 24 14            [ 1]  106 	jrnc	00104$
                                    107 ;	uart.c: 7: while(!(USART1_SR & USART_SR_TXE));
      008048                        108 00101$:
      008048 C6 52 30         [ 1]  109 	ld	a, 0x5230
      00804B 2A FB            [ 1]  110 	jrpl	00101$
                                    111 ;	uart.c: 8: USART1_DR = str[i];
      00804D 5F               [ 1]  112 	clrw	x
      00804E 7B 03            [ 1]  113 	ld	a, (0x03, sp)
      008050 97               [ 1]  114 	ld	xl, a
      008051 72 FB 06         [ 2]  115 	addw	x, (0x06, sp)
      008054 F6               [ 1]  116 	ld	a, (x)
      008055 C7 52 31         [ 1]  117 	ld	0x5231, a
                                    118 ;	uart.c: 6: for(i = 0; i < strlen(str); i++) {
      008058 0C 03            [ 1]  119 	inc	(0x03, sp)
      00805A 20 DA            [ 2]  120 	jra	00106$
      00805C                        121 00104$:
                                    122 ;	uart.c: 10: return(i); // Bytes sent
      00805C 5F               [ 1]  123 	clrw	x
      00805D 7B 03            [ 1]  124 	ld	a, (0x03, sp)
      00805F 97               [ 1]  125 	ld	xl, a
                                    126 ;	uart.c: 11: }
      008060 5B 03            [ 2]  127 	addw	sp, #3
      008062 81               [ 4]  128 	ret
                                    129 ;	uart.c: 13: int main() {
                                    130 ;	-----------------------------------------
                                    131 ;	 function main
                                    132 ;	-----------------------------------------
      008063                        133 _main:
      008063 52 08            [ 2]  134 	sub	sp, #8
                                    135 ;	uart.c: 16: CLK_DIVR = 0x00; // Set the frequency to 16 MHz
      008065 35 00 50 C0      [ 1]  136 	mov	0x50c0+0, #0x00
                                    137 ;	uart.c: 17: CLK_PCKENR1 = 0xFF; // Enable peripherals
      008069 35 FF 50 C3      [ 1]  138 	mov	0x50c3+0, #0xff
                                    139 ;	uart.c: 19: PC_DDR = 0x08; // Put TX line on
      00806D 35 08 50 0C      [ 1]  140 	mov	0x500c+0, #0x08
                                    141 ;	uart.c: 20: PC_CR1 = 0x08;
      008071 35 08 50 0D      [ 1]  142 	mov	0x500d+0, #0x08
                                    143 ;	uart.c: 22: USART1_CR2 = USART_CR2_TEN; // Allow TX & RX
      008075 35 08 52 35      [ 1]  144 	mov	0x5235+0, #0x08
                                    145 ;	uart.c: 23: USART1_CR3 &= ~(USART_CR3_STOP1 | USART_CR3_STOP2); // 1 stop bit
      008079 C6 52 36         [ 1]  146 	ld	a, 0x5236
      00807C A4 CF            [ 1]  147 	and	a, #0xcf
      00807E C7 52 36         [ 1]  148 	ld	0x5236, a
                                    149 ;	uart.c: 24: USART1_BRR2 = 0x03; USART1_BRR1 = 0x68; // 9600 baud
      008081 35 03 52 33      [ 1]  150 	mov	0x5233+0, #0x03
      008085 35 68 52 32      [ 1]  151 	mov	0x5232+0, #0x68
                                    152 ;	uart.c: 26: do {
      008089                        153 00102$:
                                    154 ;	uart.c: 27: uart_write("Hello World!\n");
      008089 4B 24            [ 1]  155 	push	#<___str_0
      00808B 4B 80            [ 1]  156 	push	#(___str_0 >> 8)
      00808D CD 80 32         [ 4]  157 	call	_uart_write
      008090 5B 02            [ 2]  158 	addw	sp, #2
                                    159 ;	uart.c: 28: for(i = 0; i < 147456; i++) { } // Sleep
      008092 AE 40 00         [ 2]  160 	ldw	x, #0x4000
      008095 A6 02            [ 1]  161 	ld	a, #0x02
      008097 0F 05            [ 1]  162 	clr	(0x05, sp)
      008099                        163 00107$:
      008099 1D 00 01         [ 2]  164 	subw	x, #0x0001
      00809C 1F 03            [ 2]  165 	ldw	(0x03, sp), x
      00809E A2 00            [ 1]  166 	sbc	a, #0x00
      0080A0 6B 02            [ 1]  167 	ld	(0x02, sp), a
      0080A2 7B 05            [ 1]  168 	ld	a, (0x05, sp)
      0080A4 A2 00            [ 1]  169 	sbc	a, #0x00
      0080A6 6B 01            [ 1]  170 	ld	(0x01, sp), a
      0080A8 7B 01            [ 1]  171 	ld	a, (0x01, sp)
      0080AA 6B 05            [ 1]  172 	ld	(0x05, sp), a
      0080AC 1E 03            [ 2]  173 	ldw	x, (0x03, sp)
      0080AE 7B 02            [ 1]  174 	ld	a, (0x02, sp)
      0080B0 16 03            [ 2]  175 	ldw	y, (0x03, sp)
      0080B2 26 E5            [ 1]  176 	jrne	00107$
      0080B4 16 01            [ 2]  177 	ldw	y, (0x01, sp)
      0080B6 27 D1            [ 1]  178 	jreq	00102$
                                    179 ;	uart.c: 29: } while(1);
      0080B8 20 DF            [ 2]  180 	jra	00107$
                                    181 ;	uart.c: 30: }
      0080BA 5B 08            [ 2]  182 	addw	sp, #8
      0080BC 81               [ 4]  183 	ret
                                    184 	.area CODE
                                    185 	.area CONST
      008024                        186 ___str_0:
      008024 48 65 6C 6C 6F 20 57   187 	.ascii "Hello World!"
             6F 72 6C 64 21
      008030 0A                     188 	.db 0x0a
      008031 00                     189 	.db 0x00
                                    190 	.area INITIALIZER
                                    191 	.area CABS (ABS)
