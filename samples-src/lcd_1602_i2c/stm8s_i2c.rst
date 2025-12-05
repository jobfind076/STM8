                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_i2c
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _I2C_DeInit
                                     12 	.globl _I2C_Init
                                     13 	.globl _I2C_Cmd
                                     14 	.globl _I2C_GeneralCallCmd
                                     15 	.globl _I2C_GenerateSTART
                                     16 	.globl _I2C_GenerateSTOP
                                     17 	.globl _I2C_SoftwareResetCmd
                                     18 	.globl _I2C_StretchClockCmd
                                     19 	.globl _I2C_AcknowledgeConfig
                                     20 	.globl _I2C_ITConfig
                                     21 	.globl _I2C_FastModeDutyCycleConfig
                                     22 	.globl _I2C_ReceiveData
                                     23 	.globl _I2C_Send7bitAddress
                                     24 	.globl _I2C_SendData
                                     25 	.globl _I2C_CheckEvent
                                     26 	.globl _I2C_GetLastEvent
                                     27 	.globl _I2C_GetFlagStatus
                                     28 	.globl _I2C_ClearFlag
                                     29 	.globl _I2C_GetITStatus
                                     30 	.globl _I2C_ClearITPendingBit
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
                                     39 ;--------------------------------------------------------
                                     40 ; absolute external ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DABS (ABS)
                                     43 
                                     44 ; default segment ordering for linker
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area CONST
                                     49 	.area INITIALIZER
                                     50 	.area CODE
                                     51 
                                     52 ;--------------------------------------------------------
                                     53 ; global & static initialisations
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
                                     56 	.area GSINIT
                                     57 	.area GSFINAL
                                     58 	.area GSINIT
                                     59 ;--------------------------------------------------------
                                     60 ; Home
                                     61 ;--------------------------------------------------------
                                     62 	.area HOME
                                     63 	.area HOME
                                     64 ;--------------------------------------------------------
                                     65 ; code
                                     66 ;--------------------------------------------------------
                                     67 	.area CODE
                                     68 ;	stm8s_i2c.c: 67: void I2C_DeInit(void)
                                     69 ;	-----------------------------------------
                                     70 ;	 function I2C_DeInit
                                     71 ;	-----------------------------------------
      0085F5                         72 _I2C_DeInit:
                                     73 ;	stm8s_i2c.c: 69: I2C->CR1 = I2C_CR1_RESET_VALUE;
      0085F5 35 00 52 10      [ 1]   74 	mov	0x5210+0, #0x00
                                     75 ;	stm8s_i2c.c: 70: I2C->CR2 = I2C_CR2_RESET_VALUE;
      0085F9 35 00 52 11      [ 1]   76 	mov	0x5211+0, #0x00
                                     77 ;	stm8s_i2c.c: 71: I2C->FREQR = I2C_FREQR_RESET_VALUE;
      0085FD 35 00 52 12      [ 1]   78 	mov	0x5212+0, #0x00
                                     79 ;	stm8s_i2c.c: 72: I2C->OARL = I2C_OARL_RESET_VALUE;
      008601 35 00 52 13      [ 1]   80 	mov	0x5213+0, #0x00
                                     81 ;	stm8s_i2c.c: 73: I2C->OARH = I2C_OARH_RESET_VALUE;
      008605 35 00 52 14      [ 1]   82 	mov	0x5214+0, #0x00
                                     83 ;	stm8s_i2c.c: 74: I2C->ITR = I2C_ITR_RESET_VALUE;
      008609 35 00 52 1A      [ 1]   84 	mov	0x521a+0, #0x00
                                     85 ;	stm8s_i2c.c: 75: I2C->CCRL = I2C_CCRL_RESET_VALUE;
      00860D 35 00 52 1B      [ 1]   86 	mov	0x521b+0, #0x00
                                     87 ;	stm8s_i2c.c: 76: I2C->CCRH = I2C_CCRH_RESET_VALUE;
      008611 35 00 52 1C      [ 1]   88 	mov	0x521c+0, #0x00
                                     89 ;	stm8s_i2c.c: 77: I2C->TRISER = I2C_TRISER_RESET_VALUE;
      008615 35 02 52 1D      [ 1]   90 	mov	0x521d+0, #0x02
                                     91 ;	stm8s_i2c.c: 78: }
      008619 81               [ 4]   92 	ret
                                     93 ;	stm8s_i2c.c: 96: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
                                     94 ;	-----------------------------------------
                                     95 ;	 function I2C_Init
                                     96 ;	-----------------------------------------
      00861A                         97 _I2C_Init:
      00861A 52 06            [ 2]   98 	sub	sp, #6
                                     99 ;	stm8s_i2c.c: 102: uint8_t tmpccrh = 0;
      00861C 0F 06            [ 1]  100 	clr	(0x06, sp)
                                    101 ;	stm8s_i2c.c: 115: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
      00861E C6 52 12         [ 1]  102 	ld	a, 0x5212
      008621 A4 C0            [ 1]  103 	and	a, #0xc0
      008623 C7 52 12         [ 1]  104 	ld	0x5212, a
                                    105 ;	stm8s_i2c.c: 117: I2C->FREQR |= InputClockFrequencyMHz;
      008626 C6 52 12         [ 1]  106 	ld	a, 0x5212
      008629 1A 12            [ 1]  107 	or	a, (0x12, sp)
      00862B C7 52 12         [ 1]  108 	ld	0x5212, a
                                    109 ;	stm8s_i2c.c: 121: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      00862E 72 11 52 10      [ 1]  110 	bres	21008, #0
                                    111 ;	stm8s_i2c.c: 124: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      008632 C6 52 1C         [ 1]  112 	ld	a, 0x521c
      008635 A4 30            [ 1]  113 	and	a, #0x30
      008637 C7 52 1C         [ 1]  114 	ld	0x521c, a
                                    115 ;	stm8s_i2c.c: 125: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      00863A C6 52 1B         [ 1]  116 	ld	a, 0x521b
      00863D 35 00 52 1B      [ 1]  117 	mov	0x521b+0, #0x00
                                    118 ;	stm8s_i2c.c: 136: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      008641 5F               [ 1]  119 	clrw	x
      008642 7B 12            [ 1]  120 	ld	a, (0x12, sp)
      008644 97               [ 1]  121 	ld	xl, a
      008645 90 5F            [ 1]  122 	clrw	y
      008647 89               [ 2]  123 	pushw	x
      008648 90 89            [ 2]  124 	pushw	y
      00864A 4B 40            [ 1]  125 	push	#0x40
      00864C 4B 42            [ 1]  126 	push	#0x42
      00864E 4B 0F            [ 1]  127 	push	#0x0f
      008650 4B 00            [ 1]  128 	push	#0x00
      008652 CD 8D 46         [ 4]  129 	call	__mullong
      008655 5B 08            [ 2]  130 	addw	sp, #8
      008657 1F 04            [ 2]  131 	ldw	(0x04, sp), x
      008659 17 02            [ 2]  132 	ldw	(0x02, sp), y
                                    133 ;	stm8s_i2c.c: 128: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
      00865B AE 86 A0         [ 2]  134 	ldw	x, #0x86a0
      00865E 13 0B            [ 2]  135 	cpw	x, (0x0b, sp)
      008660 A6 01            [ 1]  136 	ld	a, #0x01
      008662 12 0A            [ 1]  137 	sbc	a, (0x0a, sp)
      008664 4F               [ 1]  138 	clr	a
      008665 12 09            [ 1]  139 	sbc	a, (0x09, sp)
      008667 25 03            [ 1]  140 	jrc	00133$
      008669 CC 86 E7         [ 2]  141 	jp	00109$
      00866C                        142 00133$:
                                    143 ;	stm8s_i2c.c: 131: tmpccrh = I2C_CCRH_FS;
      00866C A6 80            [ 1]  144 	ld	a, #0x80
      00866E 6B 06            [ 1]  145 	ld	(0x06, sp), a
                                    146 ;	stm8s_i2c.c: 133: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
      008670 0D 0F            [ 1]  147 	tnz	(0x0f, sp)
      008672 26 22            [ 1]  148 	jrne	00102$
                                    149 ;	stm8s_i2c.c: 136: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      008674 1E 0B            [ 2]  150 	ldw	x, (0x0b, sp)
      008676 89               [ 2]  151 	pushw	x
      008677 1E 0B            [ 2]  152 	ldw	x, (0x0b, sp)
      008679 89               [ 2]  153 	pushw	x
      00867A 4B 03            [ 1]  154 	push	#0x03
      00867C 5F               [ 1]  155 	clrw	x
      00867D 89               [ 2]  156 	pushw	x
      00867E 4B 00            [ 1]  157 	push	#0x00
      008680 CD 8D 46         [ 4]  158 	call	__mullong
      008683 5B 08            [ 2]  159 	addw	sp, #8
      008685 89               [ 2]  160 	pushw	x
      008686 90 89            [ 2]  161 	pushw	y
      008688 1E 08            [ 2]  162 	ldw	x, (0x08, sp)
      00868A 89               [ 2]  163 	pushw	x
      00868B 1E 08            [ 2]  164 	ldw	x, (0x08, sp)
      00868D 89               [ 2]  165 	pushw	x
      00868E CD 8C EC         [ 4]  166 	call	__divulong
      008691 5B 08            [ 2]  167 	addw	sp, #8
      008693 51               [ 1]  168 	exgw	x, y
      008694 20 27            [ 2]  169 	jra	00103$
      008696                        170 00102$:
                                    171 ;	stm8s_i2c.c: 141: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
      008696 1E 0B            [ 2]  172 	ldw	x, (0x0b, sp)
      008698 89               [ 2]  173 	pushw	x
      008699 1E 0B            [ 2]  174 	ldw	x, (0x0b, sp)
      00869B 89               [ 2]  175 	pushw	x
      00869C 4B 19            [ 1]  176 	push	#0x19
      00869E 5F               [ 1]  177 	clrw	x
      00869F 89               [ 2]  178 	pushw	x
      0086A0 4B 00            [ 1]  179 	push	#0x00
      0086A2 CD 8D 46         [ 4]  180 	call	__mullong
      0086A5 5B 08            [ 2]  181 	addw	sp, #8
      0086A7 9F               [ 1]  182 	ld	a, xl
      0086A8 88               [ 1]  183 	push	a
      0086A9 9E               [ 1]  184 	ld	a, xh
      0086AA 88               [ 1]  185 	push	a
      0086AB 90 89            [ 2]  186 	pushw	y
      0086AD 1E 08            [ 2]  187 	ldw	x, (0x08, sp)
      0086AF 89               [ 2]  188 	pushw	x
      0086B0 1E 08            [ 2]  189 	ldw	x, (0x08, sp)
      0086B2 89               [ 2]  190 	pushw	x
      0086B3 CD 8C EC         [ 4]  191 	call	__divulong
      0086B6 5B 08            [ 2]  192 	addw	sp, #8
      0086B8 51               [ 1]  193 	exgw	x, y
                                    194 ;	stm8s_i2c.c: 143: tmpccrh |= I2C_CCRH_DUTY;
      0086B9 A6 C0            [ 1]  195 	ld	a, #0xc0
      0086BB 6B 06            [ 1]  196 	ld	(0x06, sp), a
      0086BD                        197 00103$:
                                    198 ;	stm8s_i2c.c: 147: if (result < (uint16_t)0x01)
      0086BD 90 A3 00 01      [ 2]  199 	cpw	y, #0x0001
      0086C1 24 04            [ 1]  200 	jrnc	00105$
                                    201 ;	stm8s_i2c.c: 150: result = (uint16_t)0x0001;
      0086C3 90 AE 00 01      [ 2]  202 	ldw	y, #0x0001
      0086C7                        203 00105$:
                                    204 ;	stm8s_i2c.c: 156: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
      0086C7 5F               [ 1]  205 	clrw	x
      0086C8 7B 12            [ 1]  206 	ld	a, (0x12, sp)
      0086CA 97               [ 1]  207 	ld	xl, a
      0086CB 89               [ 2]  208 	pushw	x
      0086CC 58               [ 2]  209 	sllw	x
      0086CD 72 FB 01         [ 2]  210 	addw	x, (1, sp)
      0086D0 5B 02            [ 2]  211 	addw	sp, #2
      0086D2 90 89            [ 2]  212 	pushw	y
      0086D4 4B 0A            [ 1]  213 	push	#0x0a
      0086D6 4B 00            [ 1]  214 	push	#0x00
      0086D8 89               [ 2]  215 	pushw	x
      0086D9 CD 8D C2         [ 4]  216 	call	__divsint
      0086DC 5B 04            [ 2]  217 	addw	sp, #4
      0086DE 90 85            [ 2]  218 	popw	y
      0086E0 5C               [ 1]  219 	incw	x
      0086E1 9F               [ 1]  220 	ld	a, xl
                                    221 ;	stm8s_i2c.c: 157: I2C->TRISER = (uint8_t)tmpval;
      0086E2 C7 52 1D         [ 1]  222 	ld	0x521d, a
      0086E5 20 26            [ 2]  223 	jra	00110$
      0086E7                        224 00109$:
                                    225 ;	stm8s_i2c.c: 164: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
      0086E7 1E 0B            [ 2]  226 	ldw	x, (0x0b, sp)
      0086E9 16 09            [ 2]  227 	ldw	y, (0x09, sp)
      0086EB 58               [ 2]  228 	sllw	x
      0086EC 90 59            [ 2]  229 	rlcw	y
      0086EE 89               [ 2]  230 	pushw	x
      0086EF 90 89            [ 2]  231 	pushw	y
      0086F1 1E 08            [ 2]  232 	ldw	x, (0x08, sp)
      0086F3 89               [ 2]  233 	pushw	x
      0086F4 1E 08            [ 2]  234 	ldw	x, (0x08, sp)
      0086F6 89               [ 2]  235 	pushw	x
      0086F7 CD 8C EC         [ 4]  236 	call	__divulong
      0086FA 5B 08            [ 2]  237 	addw	sp, #8
      0086FC 51               [ 1]  238 	exgw	x, y
                                    239 ;	stm8s_i2c.c: 167: if (result < (uint16_t)0x0004)
      0086FD 90 A3 00 04      [ 2]  240 	cpw	y, #0x0004
      008701 24 04            [ 1]  241 	jrnc	00107$
                                    242 ;	stm8s_i2c.c: 170: result = (uint16_t)0x0004;
      008703 90 AE 00 04      [ 2]  243 	ldw	y, #0x0004
      008707                        244 00107$:
                                    245 ;	stm8s_i2c.c: 176: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
      008707 7B 12            [ 1]  246 	ld	a, (0x12, sp)
      008709 4C               [ 1]  247 	inc	a
      00870A C7 52 1D         [ 1]  248 	ld	0x521d, a
      00870D                        249 00110$:
                                    250 ;	stm8s_i2c.c: 181: I2C->CCRL = (uint8_t)result;
      00870D 90 9F            [ 1]  251 	ld	a, yl
      00870F C7 52 1B         [ 1]  252 	ld	0x521b, a
                                    253 ;	stm8s_i2c.c: 182: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
      008712 90 9E            [ 1]  254 	ld	a, yh
      008714 A4 0F            [ 1]  255 	and	a, #0x0f
      008716 1A 06            [ 1]  256 	or	a, (0x06, sp)
      008718 C7 52 1C         [ 1]  257 	ld	0x521c, a
                                    258 ;	stm8s_i2c.c: 185: I2C->CR1 |= I2C_CR1_PE;
      00871B 72 10 52 10      [ 1]  259 	bset	21008, #0
                                    260 ;	stm8s_i2c.c: 188: I2C_AcknowledgeConfig(Ack);
      00871F 7B 10            [ 1]  261 	ld	a, (0x10, sp)
      008721 88               [ 1]  262 	push	a
      008722 CD 87 B6         [ 4]  263 	call	_I2C_AcknowledgeConfig
      008725 84               [ 1]  264 	pop	a
                                    265 ;	stm8s_i2c.c: 191: I2C->OARL = (uint8_t)(OwnAddress);
      008726 7B 0E            [ 1]  266 	ld	a, (0x0e, sp)
      008728 C7 52 13         [ 1]  267 	ld	0x5213, a
                                    268 ;	stm8s_i2c.c: 192: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
      00872B 7B 11            [ 1]  269 	ld	a, (0x11, sp)
      00872D AA 40            [ 1]  270 	or	a, #0x40
      00872F 6B 01            [ 1]  271 	ld	(0x01, sp), a
                                    272 ;	stm8s_i2c.c: 193: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
      008731 4F               [ 1]  273 	clr	a
      008732 97               [ 1]  274 	ld	xl, a
      008733 7B 0D            [ 1]  275 	ld	a, (0x0d, sp)
      008735 A4 03            [ 1]  276 	and	a, #0x03
      008737 95               [ 1]  277 	ld	xh, a
      008738 A6 80            [ 1]  278 	ld	a, #0x80
      00873A 62               [ 2]  279 	div	x, a
      00873B 9F               [ 1]  280 	ld	a, xl
      00873C 1A 01            [ 1]  281 	or	a, (0x01, sp)
      00873E C7 52 14         [ 1]  282 	ld	0x5214, a
                                    283 ;	stm8s_i2c.c: 194: }
      008741 5B 06            [ 2]  284 	addw	sp, #6
      008743 81               [ 4]  285 	ret
                                    286 ;	stm8s_i2c.c: 202: void I2C_Cmd(FunctionalState NewState)
                                    287 ;	-----------------------------------------
                                    288 ;	 function I2C_Cmd
                                    289 ;	-----------------------------------------
      008744                        290 _I2C_Cmd:
                                    291 ;	stm8s_i2c.c: 210: I2C->CR1 |= I2C_CR1_PE;
      008744 C6 52 10         [ 1]  292 	ld	a, 0x5210
                                    293 ;	stm8s_i2c.c: 207: if (NewState != DISABLE)
      008747 0D 03            [ 1]  294 	tnz	(0x03, sp)
      008749 27 06            [ 1]  295 	jreq	00102$
                                    296 ;	stm8s_i2c.c: 210: I2C->CR1 |= I2C_CR1_PE;
      00874B AA 01            [ 1]  297 	or	a, #0x01
      00874D C7 52 10         [ 1]  298 	ld	0x5210, a
      008750 81               [ 4]  299 	ret
      008751                        300 00102$:
                                    301 ;	stm8s_i2c.c: 215: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      008751 A4 FE            [ 1]  302 	and	a, #0xfe
      008753 C7 52 10         [ 1]  303 	ld	0x5210, a
                                    304 ;	stm8s_i2c.c: 217: }
      008756 81               [ 4]  305 	ret
                                    306 ;	stm8s_i2c.c: 225: void I2C_GeneralCallCmd(FunctionalState NewState)
                                    307 ;	-----------------------------------------
                                    308 ;	 function I2C_GeneralCallCmd
                                    309 ;	-----------------------------------------
      008757                        310 _I2C_GeneralCallCmd:
                                    311 ;	stm8s_i2c.c: 233: I2C->CR1 |= I2C_CR1_ENGC;
      008757 C6 52 10         [ 1]  312 	ld	a, 0x5210
                                    313 ;	stm8s_i2c.c: 230: if (NewState != DISABLE)
      00875A 0D 03            [ 1]  314 	tnz	(0x03, sp)
      00875C 27 06            [ 1]  315 	jreq	00102$
                                    316 ;	stm8s_i2c.c: 233: I2C->CR1 |= I2C_CR1_ENGC;
      00875E AA 40            [ 1]  317 	or	a, #0x40
      008760 C7 52 10         [ 1]  318 	ld	0x5210, a
      008763 81               [ 4]  319 	ret
      008764                        320 00102$:
                                    321 ;	stm8s_i2c.c: 238: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
      008764 A4 BF            [ 1]  322 	and	a, #0xbf
      008766 C7 52 10         [ 1]  323 	ld	0x5210, a
                                    324 ;	stm8s_i2c.c: 240: }
      008769 81               [ 4]  325 	ret
                                    326 ;	stm8s_i2c.c: 250: void I2C_GenerateSTART(FunctionalState NewState)
                                    327 ;	-----------------------------------------
                                    328 ;	 function I2C_GenerateSTART
                                    329 ;	-----------------------------------------
      00876A                        330 _I2C_GenerateSTART:
                                    331 ;	stm8s_i2c.c: 258: I2C->CR2 |= I2C_CR2_START;
      00876A C6 52 11         [ 1]  332 	ld	a, 0x5211
                                    333 ;	stm8s_i2c.c: 255: if (NewState != DISABLE)
      00876D 0D 03            [ 1]  334 	tnz	(0x03, sp)
      00876F 27 06            [ 1]  335 	jreq	00102$
                                    336 ;	stm8s_i2c.c: 258: I2C->CR2 |= I2C_CR2_START;
      008771 AA 01            [ 1]  337 	or	a, #0x01
      008773 C7 52 11         [ 1]  338 	ld	0x5211, a
      008776 81               [ 4]  339 	ret
      008777                        340 00102$:
                                    341 ;	stm8s_i2c.c: 263: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
      008777 A4 FE            [ 1]  342 	and	a, #0xfe
      008779 C7 52 11         [ 1]  343 	ld	0x5211, a
                                    344 ;	stm8s_i2c.c: 265: }
      00877C 81               [ 4]  345 	ret
                                    346 ;	stm8s_i2c.c: 273: void I2C_GenerateSTOP(FunctionalState NewState)
                                    347 ;	-----------------------------------------
                                    348 ;	 function I2C_GenerateSTOP
                                    349 ;	-----------------------------------------
      00877D                        350 _I2C_GenerateSTOP:
                                    351 ;	stm8s_i2c.c: 281: I2C->CR2 |= I2C_CR2_STOP;
      00877D C6 52 11         [ 1]  352 	ld	a, 0x5211
                                    353 ;	stm8s_i2c.c: 278: if (NewState != DISABLE)
      008780 0D 03            [ 1]  354 	tnz	(0x03, sp)
      008782 27 06            [ 1]  355 	jreq	00102$
                                    356 ;	stm8s_i2c.c: 281: I2C->CR2 |= I2C_CR2_STOP;
      008784 AA 02            [ 1]  357 	or	a, #0x02
      008786 C7 52 11         [ 1]  358 	ld	0x5211, a
      008789 81               [ 4]  359 	ret
      00878A                        360 00102$:
                                    361 ;	stm8s_i2c.c: 286: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
      00878A A4 FD            [ 1]  362 	and	a, #0xfd
      00878C C7 52 11         [ 1]  363 	ld	0x5211, a
                                    364 ;	stm8s_i2c.c: 288: }
      00878F 81               [ 4]  365 	ret
                                    366 ;	stm8s_i2c.c: 296: void I2C_SoftwareResetCmd(FunctionalState NewState)
                                    367 ;	-----------------------------------------
                                    368 ;	 function I2C_SoftwareResetCmd
                                    369 ;	-----------------------------------------
      008790                        370 _I2C_SoftwareResetCmd:
                                    371 ;	stm8s_i2c.c: 304: I2C->CR2 |= I2C_CR2_SWRST;
      008790 C6 52 11         [ 1]  372 	ld	a, 0x5211
                                    373 ;	stm8s_i2c.c: 301: if (NewState != DISABLE)
      008793 0D 03            [ 1]  374 	tnz	(0x03, sp)
      008795 27 06            [ 1]  375 	jreq	00102$
                                    376 ;	stm8s_i2c.c: 304: I2C->CR2 |= I2C_CR2_SWRST;
      008797 AA 80            [ 1]  377 	or	a, #0x80
      008799 C7 52 11         [ 1]  378 	ld	0x5211, a
      00879C 81               [ 4]  379 	ret
      00879D                        380 00102$:
                                    381 ;	stm8s_i2c.c: 309: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
      00879D A4 7F            [ 1]  382 	and	a, #0x7f
      00879F C7 52 11         [ 1]  383 	ld	0x5211, a
                                    384 ;	stm8s_i2c.c: 311: }
      0087A2 81               [ 4]  385 	ret
                                    386 ;	stm8s_i2c.c: 320: void I2C_StretchClockCmd(FunctionalState NewState)
                                    387 ;	-----------------------------------------
                                    388 ;	 function I2C_StretchClockCmd
                                    389 ;	-----------------------------------------
      0087A3                        390 _I2C_StretchClockCmd:
                                    391 ;	stm8s_i2c.c: 328: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      0087A3 C6 52 10         [ 1]  392 	ld	a, 0x5210
                                    393 ;	stm8s_i2c.c: 325: if (NewState != DISABLE)
      0087A6 0D 03            [ 1]  394 	tnz	(0x03, sp)
      0087A8 27 06            [ 1]  395 	jreq	00102$
                                    396 ;	stm8s_i2c.c: 328: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      0087AA A4 7F            [ 1]  397 	and	a, #0x7f
      0087AC C7 52 10         [ 1]  398 	ld	0x5210, a
      0087AF 81               [ 4]  399 	ret
      0087B0                        400 00102$:
                                    401 ;	stm8s_i2c.c: 334: I2C->CR1 |= I2C_CR1_NOSTRETCH;
      0087B0 AA 80            [ 1]  402 	or	a, #0x80
      0087B2 C7 52 10         [ 1]  403 	ld	0x5210, a
                                    404 ;	stm8s_i2c.c: 336: }
      0087B5 81               [ 4]  405 	ret
                                    406 ;	stm8s_i2c.c: 345: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
                                    407 ;	-----------------------------------------
                                    408 ;	 function I2C_AcknowledgeConfig
                                    409 ;	-----------------------------------------
      0087B6                        410 _I2C_AcknowledgeConfig:
                                    411 ;	stm8s_i2c.c: 353: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      0087B6 C6 52 11         [ 1]  412 	ld	a, 0x5211
                                    413 ;	stm8s_i2c.c: 350: if (Ack == I2C_ACK_NONE)
      0087B9 0D 03            [ 1]  414 	tnz	(0x03, sp)
      0087BB 26 06            [ 1]  415 	jrne	00105$
                                    416 ;	stm8s_i2c.c: 353: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      0087BD A4 FB            [ 1]  417 	and	a, #0xfb
      0087BF C7 52 11         [ 1]  418 	ld	0x5211, a
      0087C2 81               [ 4]  419 	ret
      0087C3                        420 00105$:
                                    421 ;	stm8s_i2c.c: 358: I2C->CR2 |= I2C_CR2_ACK;
      0087C3 AA 04            [ 1]  422 	or	a, #0x04
      0087C5 C7 52 11         [ 1]  423 	ld	0x5211, a
                                    424 ;	stm8s_i2c.c: 353: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      0087C8 C6 52 11         [ 1]  425 	ld	a, 0x5211
                                    426 ;	stm8s_i2c.c: 360: if (Ack == I2C_ACK_CURR)
      0087CB 88               [ 1]  427 	push	a
      0087CC 7B 04            [ 1]  428 	ld	a, (0x04, sp)
      0087CE 4A               [ 1]  429 	dec	a
      0087CF 84               [ 1]  430 	pop	a
      0087D0 26 06            [ 1]  431 	jrne	00102$
                                    432 ;	stm8s_i2c.c: 363: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
      0087D2 A4 F7            [ 1]  433 	and	a, #0xf7
      0087D4 C7 52 11         [ 1]  434 	ld	0x5211, a
      0087D7 81               [ 4]  435 	ret
      0087D8                        436 00102$:
                                    437 ;	stm8s_i2c.c: 368: I2C->CR2 |= I2C_CR2_POS;
      0087D8 AA 08            [ 1]  438 	or	a, #0x08
      0087DA C7 52 11         [ 1]  439 	ld	0x5211, a
                                    440 ;	stm8s_i2c.c: 371: }
      0087DD 81               [ 4]  441 	ret
                                    442 ;	stm8s_i2c.c: 381: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
                                    443 ;	-----------------------------------------
                                    444 ;	 function I2C_ITConfig
                                    445 ;	-----------------------------------------
      0087DE                        446 _I2C_ITConfig:
      0087DE 88               [ 1]  447 	push	a
                                    448 ;	stm8s_i2c.c: 390: I2C->ITR |= (uint8_t)I2C_IT;
      0087DF C6 52 1A         [ 1]  449 	ld	a, 0x521a
                                    450 ;	stm8s_i2c.c: 387: if (NewState != DISABLE)
      0087E2 0D 05            [ 1]  451 	tnz	(0x05, sp)
      0087E4 27 07            [ 1]  452 	jreq	00102$
                                    453 ;	stm8s_i2c.c: 390: I2C->ITR |= (uint8_t)I2C_IT;
      0087E6 1A 04            [ 1]  454 	or	a, (0x04, sp)
      0087E8 C7 52 1A         [ 1]  455 	ld	0x521a, a
      0087EB 20 0C            [ 2]  456 	jra	00104$
      0087ED                        457 00102$:
                                    458 ;	stm8s_i2c.c: 395: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
      0087ED 88               [ 1]  459 	push	a
      0087EE 7B 05            [ 1]  460 	ld	a, (0x05, sp)
      0087F0 43               [ 1]  461 	cpl	a
      0087F1 6B 02            [ 1]  462 	ld	(0x02, sp), a
      0087F3 84               [ 1]  463 	pop	a
      0087F4 14 01            [ 1]  464 	and	a, (0x01, sp)
      0087F6 C7 52 1A         [ 1]  465 	ld	0x521a, a
      0087F9                        466 00104$:
                                    467 ;	stm8s_i2c.c: 397: }
      0087F9 84               [ 1]  468 	pop	a
      0087FA 81               [ 4]  469 	ret
                                    470 ;	stm8s_i2c.c: 405: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
                                    471 ;	-----------------------------------------
                                    472 ;	 function I2C_FastModeDutyCycleConfig
                                    473 ;	-----------------------------------------
      0087FB                        474 _I2C_FastModeDutyCycleConfig:
                                    475 ;	stm8s_i2c.c: 413: I2C->CCRH |= I2C_CCRH_DUTY;
      0087FB C6 52 1C         [ 1]  476 	ld	a, 0x521c
                                    477 ;	stm8s_i2c.c: 410: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
      0087FE 88               [ 1]  478 	push	a
      0087FF 7B 04            [ 1]  479 	ld	a, (0x04, sp)
      008801 A1 40            [ 1]  480 	cp	a, #0x40
      008803 84               [ 1]  481 	pop	a
      008804 26 06            [ 1]  482 	jrne	00102$
                                    483 ;	stm8s_i2c.c: 413: I2C->CCRH |= I2C_CCRH_DUTY;
      008806 AA 40            [ 1]  484 	or	a, #0x40
      008808 C7 52 1C         [ 1]  485 	ld	0x521c, a
      00880B 81               [ 4]  486 	ret
      00880C                        487 00102$:
                                    488 ;	stm8s_i2c.c: 418: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
      00880C A4 BF            [ 1]  489 	and	a, #0xbf
      00880E C7 52 1C         [ 1]  490 	ld	0x521c, a
                                    491 ;	stm8s_i2c.c: 420: }
      008811 81               [ 4]  492 	ret
                                    493 ;	stm8s_i2c.c: 427: uint8_t I2C_ReceiveData(void)
                                    494 ;	-----------------------------------------
                                    495 ;	 function I2C_ReceiveData
                                    496 ;	-----------------------------------------
      008812                        497 _I2C_ReceiveData:
                                    498 ;	stm8s_i2c.c: 430: return ((uint8_t)I2C->DR);
      008812 C6 52 16         [ 1]  499 	ld	a, 0x5216
                                    500 ;	stm8s_i2c.c: 431: }
      008815 81               [ 4]  501 	ret
                                    502 ;	stm8s_i2c.c: 440: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
                                    503 ;	-----------------------------------------
                                    504 ;	 function I2C_Send7bitAddress
                                    505 ;	-----------------------------------------
      008816                        506 _I2C_Send7bitAddress:
                                    507 ;	stm8s_i2c.c: 447: Address &= (uint8_t)0xFE;
      008816 04 03            [ 1]  508 	srl	(0x03, sp)
      008818 08 03            [ 1]  509 	sll	(0x03, sp)
                                    510 ;	stm8s_i2c.c: 450: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
      00881A 7B 03            [ 1]  511 	ld	a, (0x03, sp)
      00881C 1A 04            [ 1]  512 	or	a, (0x04, sp)
      00881E C7 52 16         [ 1]  513 	ld	0x5216, a
                                    514 ;	stm8s_i2c.c: 451: }
      008821 81               [ 4]  515 	ret
                                    516 ;	stm8s_i2c.c: 458: void I2C_SendData(uint8_t Data)
                                    517 ;	-----------------------------------------
                                    518 ;	 function I2C_SendData
                                    519 ;	-----------------------------------------
      008822                        520 _I2C_SendData:
                                    521 ;	stm8s_i2c.c: 461: I2C->DR = Data;
      008822 AE 52 16         [ 2]  522 	ldw	x, #0x5216
      008825 7B 03            [ 1]  523 	ld	a, (0x03, sp)
      008827 F7               [ 1]  524 	ld	(x), a
                                    525 ;	stm8s_i2c.c: 462: }
      008828 81               [ 4]  526 	ret
                                    527 ;	stm8s_i2c.c: 578: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
                                    528 ;	-----------------------------------------
                                    529 ;	 function I2C_CheckEvent
                                    530 ;	-----------------------------------------
      008829                        531 _I2C_CheckEvent:
      008829 52 08            [ 2]  532 	sub	sp, #8
                                    533 ;	stm8s_i2c.c: 580: __IO uint16_t lastevent = 0x00;
      00882B 5F               [ 1]  534 	clrw	x
      00882C 1F 01            [ 2]  535 	ldw	(0x01, sp), x
                                    536 ;	stm8s_i2c.c: 588: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
      00882E 1E 0B            [ 2]  537 	ldw	x, (0x0b, sp)
      008830 A3 00 04         [ 2]  538 	cpw	x, #0x0004
      008833 26 0B            [ 1]  539 	jrne	00102$
                                    540 ;	stm8s_i2c.c: 590: lastevent = I2C->SR2 & I2C_SR2_AF;
      008835 C6 52 18         [ 1]  541 	ld	a, 0x5218
      008838 A4 04            [ 1]  542 	and	a, #0x04
      00883A 5F               [ 1]  543 	clrw	x
      00883B 97               [ 1]  544 	ld	xl, a
      00883C 1F 01            [ 2]  545 	ldw	(0x01, sp), x
      00883E 20 1A            [ 2]  546 	jra	00103$
      008840                        547 00102$:
                                    548 ;	stm8s_i2c.c: 594: flag1 = I2C->SR1;
      008840 C6 52 17         [ 1]  549 	ld	a, 0x5217
      008843 95               [ 1]  550 	ld	xh, a
                                    551 ;	stm8s_i2c.c: 595: flag2 = I2C->SR3;
      008844 C6 52 19         [ 1]  552 	ld	a, 0x5219
                                    553 ;	stm8s_i2c.c: 596: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
      008847 97               [ 1]  554 	ld	xl, a
      008848 0F 08            [ 1]  555 	clr	(0x08, sp)
      00884A 9E               [ 1]  556 	ld	a, xh
      00884B 0F 05            [ 1]  557 	clr	(0x05, sp)
      00884D 1A 08            [ 1]  558 	or	a, (0x08, sp)
      00884F 6B 04            [ 1]  559 	ld	(0x04, sp), a
      008851 9F               [ 1]  560 	ld	a, xl
      008852 1A 05            [ 1]  561 	or	a, (0x05, sp)
      008854 6B 01            [ 1]  562 	ld	(0x01, sp), a
      008856 7B 04            [ 1]  563 	ld	a, (0x04, sp)
      008858 6B 02            [ 1]  564 	ld	(0x02, sp), a
      00885A                        565 00103$:
                                    566 ;	stm8s_i2c.c: 599: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
      00885A 7B 02            [ 1]  567 	ld	a, (0x02, sp)
      00885C 14 0C            [ 1]  568 	and	a, (0x0c, sp)
      00885E 97               [ 1]  569 	ld	xl, a
      00885F 7B 01            [ 1]  570 	ld	a, (0x01, sp)
      008861 14 0B            [ 1]  571 	and	a, (0x0b, sp)
      008863 95               [ 1]  572 	ld	xh, a
      008864 13 0B            [ 2]  573 	cpw	x, (0x0b, sp)
      008866 26 03            [ 1]  574 	jrne	00105$
                                    575 ;	stm8s_i2c.c: 602: status = SUCCESS;
      008868 A6 01            [ 1]  576 	ld	a, #0x01
                                    577 ;	stm8s_i2c.c: 607: status = ERROR;
      00886A 21                     578 	.byte 0x21
      00886B                        579 00105$:
      00886B 4F               [ 1]  580 	clr	a
      00886C                        581 00106$:
                                    582 ;	stm8s_i2c.c: 611: return status;
                                    583 ;	stm8s_i2c.c: 612: }
      00886C 5B 08            [ 2]  584 	addw	sp, #8
      00886E 81               [ 4]  585 	ret
                                    586 ;	stm8s_i2c.c: 628: I2C_Event_TypeDef I2C_GetLastEvent(void)
                                    587 ;	-----------------------------------------
                                    588 ;	 function I2C_GetLastEvent
                                    589 ;	-----------------------------------------
      00886F                        590 _I2C_GetLastEvent:
      00886F 52 04            [ 2]  591 	sub	sp, #4
                                    592 ;	stm8s_i2c.c: 630: __IO uint16_t lastevent = 0;
      008871 5F               [ 1]  593 	clrw	x
      008872 1F 01            [ 2]  594 	ldw	(0x01, sp), x
                                    595 ;	stm8s_i2c.c: 634: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
      008874 C6 52 18         [ 1]  596 	ld	a, 0x5218
      008877 A5 04            [ 1]  597 	bcp	a, #0x04
      008879 27 07            [ 1]  598 	jreq	00102$
                                    599 ;	stm8s_i2c.c: 636: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
      00887B AE 00 04         [ 2]  600 	ldw	x, #0x0004
      00887E 1F 01            [ 2]  601 	ldw	(0x01, sp), x
      008880 20 13            [ 2]  602 	jra	00103$
      008882                        603 00102$:
                                    604 ;	stm8s_i2c.c: 641: flag1 = I2C->SR1;
      008882 C6 52 17         [ 1]  605 	ld	a, 0x5217
      008885 5F               [ 1]  606 	clrw	x
      008886 97               [ 1]  607 	ld	xl, a
      008887 1F 03            [ 2]  608 	ldw	(0x03, sp), x
                                    609 ;	stm8s_i2c.c: 642: flag2 = I2C->SR3;
      008889 C6 52 19         [ 1]  610 	ld	a, 0x5219
      00888C 95               [ 1]  611 	ld	xh, a
                                    612 ;	stm8s_i2c.c: 645: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
      00888D 7B 04            [ 1]  613 	ld	a, (0x04, sp)
      00888F 02               [ 1]  614 	rlwa	x
      008890 1A 03            [ 1]  615 	or	a, (0x03, sp)
      008892 95               [ 1]  616 	ld	xh, a
      008893 1F 01            [ 2]  617 	ldw	(0x01, sp), x
      008895                        618 00103$:
                                    619 ;	stm8s_i2c.c: 648: return (I2C_Event_TypeDef)lastevent;
      008895 1E 01            [ 2]  620 	ldw	x, (0x01, sp)
                                    621 ;	stm8s_i2c.c: 649: }
      008897 5B 04            [ 2]  622 	addw	sp, #4
      008899 81               [ 4]  623 	ret
                                    624 ;	stm8s_i2c.c: 679: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
                                    625 ;	-----------------------------------------
                                    626 ;	 function I2C_GetFlagStatus
                                    627 ;	-----------------------------------------
      00889A                        628 _I2C_GetFlagStatus:
                                    629 ;	stm8s_i2c.c: 681: uint8_t tempreg = 0;
      00889A 4F               [ 1]  630 	clr	a
      00889B 97               [ 1]  631 	ld	xl, a
                                    632 ;	stm8s_i2c.c: 689: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
      00889C 7B 03            [ 1]  633 	ld	a, (0x03, sp)
      00889E 90 5F            [ 1]  634 	clrw	y
                                    635 ;	stm8s_i2c.c: 691: switch (regindex)
      0088A0 A1 01            [ 1]  636 	cp	a, #0x01
      0088A2 27 0A            [ 1]  637 	jreq	00101$
      0088A4 A1 02            [ 1]  638 	cp	a, #0x02
      0088A6 27 0C            [ 1]  639 	jreq	00102$
      0088A8 A1 03            [ 1]  640 	cp	a, #0x03
      0088AA 27 0E            [ 1]  641 	jreq	00103$
      0088AC 20 10            [ 2]  642 	jra	00105$
                                    643 ;	stm8s_i2c.c: 694: case 0x01:
      0088AE                        644 00101$:
                                    645 ;	stm8s_i2c.c: 695: tempreg = (uint8_t)I2C->SR1;
      0088AE C6 52 17         [ 1]  646 	ld	a, 0x5217
      0088B1 97               [ 1]  647 	ld	xl, a
                                    648 ;	stm8s_i2c.c: 696: break;
      0088B2 20 0A            [ 2]  649 	jra	00105$
                                    650 ;	stm8s_i2c.c: 699: case 0x02:
      0088B4                        651 00102$:
                                    652 ;	stm8s_i2c.c: 700: tempreg = (uint8_t)I2C->SR2;
      0088B4 C6 52 18         [ 1]  653 	ld	a, 0x5218
      0088B7 97               [ 1]  654 	ld	xl, a
                                    655 ;	stm8s_i2c.c: 701: break;
      0088B8 20 04            [ 2]  656 	jra	00105$
                                    657 ;	stm8s_i2c.c: 704: case 0x03:
      0088BA                        658 00103$:
                                    659 ;	stm8s_i2c.c: 705: tempreg = (uint8_t)I2C->SR3;
      0088BA C6 52 19         [ 1]  660 	ld	a, 0x5219
      0088BD 97               [ 1]  661 	ld	xl, a
                                    662 ;	stm8s_i2c.c: 710: }
      0088BE                        663 00105$:
                                    664 ;	stm8s_i2c.c: 713: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
      0088BE 7B 04            [ 1]  665 	ld	a, (0x04, sp)
      0088C0 89               [ 2]  666 	pushw	x
      0088C1 14 02            [ 1]  667 	and	a, (2, sp)
      0088C3 85               [ 2]  668 	popw	x
      0088C4 4D               [ 1]  669 	tnz	a
      0088C5 27 03            [ 1]  670 	jreq	00107$
                                    671 ;	stm8s_i2c.c: 716: bitstatus = SET;
      0088C7 A6 01            [ 1]  672 	ld	a, #0x01
      0088C9 81               [ 4]  673 	ret
      0088CA                        674 00107$:
                                    675 ;	stm8s_i2c.c: 721: bitstatus = RESET;
      0088CA 4F               [ 1]  676 	clr	a
                                    677 ;	stm8s_i2c.c: 724: return bitstatus;
                                    678 ;	stm8s_i2c.c: 725: }
      0088CB 81               [ 4]  679 	ret
                                    680 ;	stm8s_i2c.c: 759: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
                                    681 ;	-----------------------------------------
                                    682 ;	 function I2C_ClearFlag
                                    683 ;	-----------------------------------------
      0088CC                        684 _I2C_ClearFlag:
                                    685 ;	stm8s_i2c.c: 766: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
      0088CC 7B 04            [ 1]  686 	ld	a, (0x04, sp)
      0088CE 97               [ 1]  687 	ld	xl, a
      0088CF 4F               [ 1]  688 	clr	a
                                    689 ;	stm8s_i2c.c: 768: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
      0088D0 95               [ 1]  690 	ld	xh, a
      0088D1 53               [ 2]  691 	cplw	x
      0088D2 9F               [ 1]  692 	ld	a, xl
      0088D3 C7 52 18         [ 1]  693 	ld	0x5218, a
                                    694 ;	stm8s_i2c.c: 769: }
      0088D6 81               [ 4]  695 	ret
                                    696 ;	stm8s_i2c.c: 791: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    697 ;	-----------------------------------------
                                    698 ;	 function I2C_GetITStatus
                                    699 ;	-----------------------------------------
      0088D7                        700 _I2C_GetITStatus:
      0088D7 52 04            [ 2]  701 	sub	sp, #4
                                    702 ;	stm8s_i2c.c: 794: __IO uint8_t enablestatus = 0;
      0088D9 0F 01            [ 1]  703 	clr	(0x01, sp)
                                    704 ;	stm8s_i2c.c: 800: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
      0088DB 0F 04            [ 1]  705 	clr	(0x04, sp)
      0088DD 7B 07            [ 1]  706 	ld	a, (0x07, sp)
      0088DF A4 07            [ 1]  707 	and	a, #0x07
      0088E1 90 5F            [ 1]  708 	clrw	y
      0088E3 5F               [ 1]  709 	clrw	x
      0088E4 97               [ 1]  710 	ld	xl, a
                                    711 ;	stm8s_i2c.c: 803: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
      0088E5 C6 52 1A         [ 1]  712 	ld	a, 0x521a
      0088E8 89               [ 2]  713 	pushw	x
      0088E9 14 02            [ 1]  714 	and	a, (2, sp)
      0088EB 85               [ 2]  715 	popw	x
      0088EC 6B 01            [ 1]  716 	ld	(0x01, sp), a
                                    717 ;	stm8s_i2c.c: 805: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0088EE 4F               [ 1]  718 	clr	a
      0088EF 97               [ 1]  719 	ld	xl, a
      0088F0 7B 07            [ 1]  720 	ld	a, (0x07, sp)
      0088F2 A4 30            [ 1]  721 	and	a, #0x30
      0088F4 95               [ 1]  722 	ld	xh, a
                                    723 ;	stm8s_i2c.c: 808: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0088F5 7B 08            [ 1]  724 	ld	a, (0x08, sp)
      0088F7 6B 02            [ 1]  725 	ld	(0x02, sp), a
                                    726 ;	stm8s_i2c.c: 805: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0088F9 A3 01 00         [ 2]  727 	cpw	x, #0x0100
      0088FC 26 12            [ 1]  728 	jrne	00110$
                                    729 ;	stm8s_i2c.c: 808: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0088FE C6 52 17         [ 1]  730 	ld	a, 0x5217
      008901 14 02            [ 1]  731 	and	a, (0x02, sp)
      008903 27 08            [ 1]  732 	jreq	00102$
      008905 0D 01            [ 1]  733 	tnz	(0x01, sp)
      008907 27 04            [ 1]  734 	jreq	00102$
                                    735 ;	stm8s_i2c.c: 811: bitstatus = SET;
      008909 A6 01            [ 1]  736 	ld	a, #0x01
      00890B 20 12            [ 2]  737 	jra	00111$
      00890D                        738 00102$:
                                    739 ;	stm8s_i2c.c: 816: bitstatus = RESET;
      00890D 4F               [ 1]  740 	clr	a
      00890E 20 0F            [ 2]  741 	jra	00111$
      008910                        742 00110$:
                                    743 ;	stm8s_i2c.c: 822: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      008910 C6 52 18         [ 1]  744 	ld	a, 0x5218
      008913 14 02            [ 1]  745 	and	a, (0x02, sp)
      008915 27 07            [ 1]  746 	jreq	00106$
      008917 0D 01            [ 1]  747 	tnz	(0x01, sp)
      008919 27 03            [ 1]  748 	jreq	00106$
                                    749 ;	stm8s_i2c.c: 825: bitstatus = SET;
      00891B A6 01            [ 1]  750 	ld	a, #0x01
                                    751 ;	stm8s_i2c.c: 830: bitstatus = RESET;
      00891D 21                     752 	.byte 0x21
      00891E                        753 00106$:
      00891E 4F               [ 1]  754 	clr	a
      00891F                        755 00111$:
                                    756 ;	stm8s_i2c.c: 834: return  bitstatus;
                                    757 ;	stm8s_i2c.c: 835: }
      00891F 5B 04            [ 2]  758 	addw	sp, #4
      008921 81               [ 4]  759 	ret
                                    760 ;	stm8s_i2c.c: 871: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    761 ;	-----------------------------------------
                                    762 ;	 function I2C_ClearITPendingBit
                                    763 ;	-----------------------------------------
      008922                        764 _I2C_ClearITPendingBit:
                                    765 ;	stm8s_i2c.c: 879: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
      008922 7B 04            [ 1]  766 	ld	a, (0x04, sp)
      008924 97               [ 1]  767 	ld	xl, a
      008925 4F               [ 1]  768 	clr	a
                                    769 ;	stm8s_i2c.c: 882: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
      008926 95               [ 1]  770 	ld	xh, a
      008927 53               [ 2]  771 	cplw	x
      008928 9F               [ 1]  772 	ld	a, xl
      008929 C7 52 18         [ 1]  773 	ld	0x5218, a
                                    774 ;	stm8s_i2c.c: 883: }
      00892C 81               [ 4]  775 	ret
                                    776 	.area CODE
                                    777 	.area CONST
                                    778 	.area INITIALIZER
                                    779 	.area CABS (ABS)
