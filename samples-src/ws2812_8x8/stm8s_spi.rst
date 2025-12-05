                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_spi
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _SPI_DeInit
                                     12 	.globl _SPI_Init
                                     13 	.globl _SPI_Cmd
                                     14 	.globl _SPI_ITConfig
                                     15 	.globl _SPI_SendData
                                     16 	.globl _SPI_ReceiveData
                                     17 	.globl _SPI_NSSInternalSoftwareCmd
                                     18 	.globl _SPI_TransmitCRC
                                     19 	.globl _SPI_CalculateCRCCmd
                                     20 	.globl _SPI_GetCRC
                                     21 	.globl _SPI_ResetCRC
                                     22 	.globl _SPI_GetCRCPolynomial
                                     23 	.globl _SPI_BiDirectionalLineConfig
                                     24 	.globl _SPI_GetFlagStatus
                                     25 	.globl _SPI_ClearFlag
                                     26 	.globl _SPI_GetITStatus
                                     27 	.globl _SPI_ClearITPendingBit
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DATA
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area INITIALIZED
                                     36 ;--------------------------------------------------------
                                     37 ; absolute external ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DABS (ABS)
                                     40 
                                     41 ; default segment ordering for linker
                                     42 	.area HOME
                                     43 	.area GSINIT
                                     44 	.area GSFINAL
                                     45 	.area CONST
                                     46 	.area INITIALIZER
                                     47 	.area CODE
                                     48 
                                     49 ;--------------------------------------------------------
                                     50 ; global & static initialisations
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area GSINIT
                                     56 ;--------------------------------------------------------
                                     57 ; Home
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
                                     60 	.area HOME
                                     61 ;--------------------------------------------------------
                                     62 ; code
                                     63 ;--------------------------------------------------------
                                     64 	.area CODE
                                     65 ;	stm8s_spi.c: 50: void SPI_DeInit(void)
                                     66 ;	-----------------------------------------
                                     67 ;	 function SPI_DeInit
                                     68 ;	-----------------------------------------
      008615                         69 _SPI_DeInit:
                                     70 ;	stm8s_spi.c: 52: SPI->CR1    = SPI_CR1_RESET_VALUE;
      008615 35 00 52 00      [ 1]   71 	mov	0x5200+0, #0x00
                                     72 ;	stm8s_spi.c: 53: SPI->CR2    = SPI_CR2_RESET_VALUE;
      008619 35 00 52 01      [ 1]   73 	mov	0x5201+0, #0x00
                                     74 ;	stm8s_spi.c: 54: SPI->ICR    = SPI_ICR_RESET_VALUE;
      00861D 35 00 52 02      [ 1]   75 	mov	0x5202+0, #0x00
                                     76 ;	stm8s_spi.c: 55: SPI->SR     = SPI_SR_RESET_VALUE;
      008621 35 02 52 03      [ 1]   77 	mov	0x5203+0, #0x02
                                     78 ;	stm8s_spi.c: 56: SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
      008625 35 07 52 05      [ 1]   79 	mov	0x5205+0, #0x07
                                     80 ;	stm8s_spi.c: 57: }
      008629 81               [ 4]   81 	ret
                                     82 ;	stm8s_spi.c: 78: void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
                                     83 ;	-----------------------------------------
                                     84 ;	 function SPI_Init
                                     85 ;	-----------------------------------------
      00862A                         86 _SPI_Init:
      00862A 88               [ 1]   87 	push	a
                                     88 ;	stm8s_spi.c: 91: SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
      00862B 7B 04            [ 1]   89 	ld	a, (0x04, sp)
      00862D 1A 05            [ 1]   90 	or	a, (0x05, sp)
      00862F 6B 01            [ 1]   91 	ld	(0x01, sp), a
                                     92 ;	stm8s_spi.c: 92: (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
      008631 7B 07            [ 1]   93 	ld	a, (0x07, sp)
      008633 1A 08            [ 1]   94 	or	a, (0x08, sp)
      008635 1A 01            [ 1]   95 	or	a, (0x01, sp)
      008637 C7 52 00         [ 1]   96 	ld	0x5200, a
                                     97 ;	stm8s_spi.c: 95: SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
      00863A 7B 09            [ 1]   98 	ld	a, (0x09, sp)
      00863C 1A 0A            [ 1]   99 	or	a, (0x0a, sp)
      00863E C7 52 01         [ 1]  100 	ld	0x5201, a
                                    101 ;	stm8s_spi.c: 99: SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
      008641 C6 52 01         [ 1]  102 	ld	a, 0x5201
                                    103 ;	stm8s_spi.c: 97: if (Mode == SPI_MODE_MASTER)
      008644 88               [ 1]  104 	push	a
      008645 7B 07            [ 1]  105 	ld	a, (0x07, sp)
      008647 A1 04            [ 1]  106 	cp	a, #0x04
      008649 84               [ 1]  107 	pop	a
      00864A 26 07            [ 1]  108 	jrne	00102$
                                    109 ;	stm8s_spi.c: 99: SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
      00864C AA 01            [ 1]  110 	or	a, #0x01
      00864E C7 52 01         [ 1]  111 	ld	0x5201, a
      008651 20 05            [ 2]  112 	jra	00103$
      008653                        113 00102$:
                                    114 ;	stm8s_spi.c: 103: SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
      008653 A4 FE            [ 1]  115 	and	a, #0xfe
      008655 C7 52 01         [ 1]  116 	ld	0x5201, a
      008658                        117 00103$:
                                    118 ;	stm8s_spi.c: 107: SPI->CR1 |= (uint8_t)(Mode);
      008658 C6 52 00         [ 1]  119 	ld	a, 0x5200
      00865B 1A 06            [ 1]  120 	or	a, (0x06, sp)
      00865D C7 52 00         [ 1]  121 	ld	0x5200, a
                                    122 ;	stm8s_spi.c: 110: SPI->CRCPR = (uint8_t)CRCPolynomial;
      008660 AE 52 05         [ 2]  123 	ldw	x, #0x5205
      008663 7B 0B            [ 1]  124 	ld	a, (0x0b, sp)
      008665 F7               [ 1]  125 	ld	(x), a
                                    126 ;	stm8s_spi.c: 111: }
      008666 84               [ 1]  127 	pop	a
      008667 81               [ 4]  128 	ret
                                    129 ;	stm8s_spi.c: 119: void SPI_Cmd(FunctionalState NewState)
                                    130 ;	-----------------------------------------
                                    131 ;	 function SPI_Cmd
                                    132 ;	-----------------------------------------
      008668                        133 _SPI_Cmd:
                                    134 ;	stm8s_spi.c: 126: SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
      008668 C6 52 00         [ 1]  135 	ld	a, 0x5200
                                    136 ;	stm8s_spi.c: 124: if (NewState != DISABLE)
      00866B 0D 03            [ 1]  137 	tnz	(0x03, sp)
      00866D 27 06            [ 1]  138 	jreq	00102$
                                    139 ;	stm8s_spi.c: 126: SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
      00866F AA 40            [ 1]  140 	or	a, #0x40
      008671 C7 52 00         [ 1]  141 	ld	0x5200, a
      008674 81               [ 4]  142 	ret
      008675                        143 00102$:
                                    144 ;	stm8s_spi.c: 130: SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
      008675 A4 BF            [ 1]  145 	and	a, #0xbf
      008677 C7 52 00         [ 1]  146 	ld	0x5200, a
                                    147 ;	stm8s_spi.c: 132: }
      00867A 81               [ 4]  148 	ret
                                    149 ;	stm8s_spi.c: 141: void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
                                    150 ;	-----------------------------------------
                                    151 ;	 function SPI_ITConfig
                                    152 ;	-----------------------------------------
      00867B                        153 _SPI_ITConfig:
      00867B 88               [ 1]  154 	push	a
                                    155 ;	stm8s_spi.c: 149: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
      00867C 7B 04            [ 1]  156 	ld	a, (0x04, sp)
      00867E A4 0F            [ 1]  157 	and	a, #0x0f
      008680 97               [ 1]  158 	ld	xl, a
      008681 A6 01            [ 1]  159 	ld	a, #0x01
      008683 88               [ 1]  160 	push	a
      008684 9F               [ 1]  161 	ld	a, xl
      008685 4D               [ 1]  162 	tnz	a
      008686 27 05            [ 1]  163 	jreq	00112$
      008688                        164 00111$:
      008688 08 01            [ 1]  165 	sll	(1, sp)
      00868A 4A               [ 1]  166 	dec	a
      00868B 26 FB            [ 1]  167 	jrne	00111$
      00868D                        168 00112$:
      00868D 84               [ 1]  169 	pop	a
                                    170 ;	stm8s_spi.c: 153: SPI->ICR |= itpos; /* Enable interrupt*/
      00868E AE 52 02         [ 2]  171 	ldw	x, #0x5202
      008691 88               [ 1]  172 	push	a
      008692 F6               [ 1]  173 	ld	a, (x)
      008693 6B 02            [ 1]  174 	ld	(0x02, sp), a
      008695 84               [ 1]  175 	pop	a
                                    176 ;	stm8s_spi.c: 151: if (NewState != DISABLE)
      008696 0D 05            [ 1]  177 	tnz	(0x05, sp)
      008698 27 07            [ 1]  178 	jreq	00102$
                                    179 ;	stm8s_spi.c: 153: SPI->ICR |= itpos; /* Enable interrupt*/
      00869A 1A 01            [ 1]  180 	or	a, (0x01, sp)
      00869C C7 52 02         [ 1]  181 	ld	0x5202, a
      00869F 20 06            [ 2]  182 	jra	00104$
      0086A1                        183 00102$:
                                    184 ;	stm8s_spi.c: 157: SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
      0086A1 43               [ 1]  185 	cpl	a
      0086A2 14 01            [ 1]  186 	and	a, (0x01, sp)
      0086A4 C7 52 02         [ 1]  187 	ld	0x5202, a
      0086A7                        188 00104$:
                                    189 ;	stm8s_spi.c: 159: }
      0086A7 84               [ 1]  190 	pop	a
      0086A8 81               [ 4]  191 	ret
                                    192 ;	stm8s_spi.c: 166: void SPI_SendData(uint8_t Data)
                                    193 ;	-----------------------------------------
                                    194 ;	 function SPI_SendData
                                    195 ;	-----------------------------------------
      0086A9                        196 _SPI_SendData:
                                    197 ;	stm8s_spi.c: 168: SPI->DR = Data; /* Write in the DR register the data to be sent*/
      0086A9 AE 52 04         [ 2]  198 	ldw	x, #0x5204
      0086AC 7B 03            [ 1]  199 	ld	a, (0x03, sp)
      0086AE F7               [ 1]  200 	ld	(x), a
                                    201 ;	stm8s_spi.c: 169: }
      0086AF 81               [ 4]  202 	ret
                                    203 ;	stm8s_spi.c: 176: uint8_t SPI_ReceiveData(void)
                                    204 ;	-----------------------------------------
                                    205 ;	 function SPI_ReceiveData
                                    206 ;	-----------------------------------------
      0086B0                        207 _SPI_ReceiveData:
                                    208 ;	stm8s_spi.c: 178: return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
      0086B0 C6 52 04         [ 1]  209 	ld	a, 0x5204
                                    210 ;	stm8s_spi.c: 179: }
      0086B3 81               [ 4]  211 	ret
                                    212 ;	stm8s_spi.c: 187: void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
                                    213 ;	-----------------------------------------
                                    214 ;	 function SPI_NSSInternalSoftwareCmd
                                    215 ;	-----------------------------------------
      0086B4                        216 _SPI_NSSInternalSoftwareCmd:
                                    217 ;	stm8s_spi.c: 194: SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
      0086B4 C6 52 01         [ 1]  218 	ld	a, 0x5201
                                    219 ;	stm8s_spi.c: 192: if (NewState != DISABLE)
      0086B7 0D 03            [ 1]  220 	tnz	(0x03, sp)
      0086B9 27 06            [ 1]  221 	jreq	00102$
                                    222 ;	stm8s_spi.c: 194: SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
      0086BB AA 01            [ 1]  223 	or	a, #0x01
      0086BD C7 52 01         [ 1]  224 	ld	0x5201, a
      0086C0 81               [ 4]  225 	ret
      0086C1                        226 00102$:
                                    227 ;	stm8s_spi.c: 198: SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
      0086C1 A4 FE            [ 1]  228 	and	a, #0xfe
      0086C3 C7 52 01         [ 1]  229 	ld	0x5201, a
                                    230 ;	stm8s_spi.c: 200: }
      0086C6 81               [ 4]  231 	ret
                                    232 ;	stm8s_spi.c: 207: void SPI_TransmitCRC(void)
                                    233 ;	-----------------------------------------
                                    234 ;	 function SPI_TransmitCRC
                                    235 ;	-----------------------------------------
      0086C7                        236 _SPI_TransmitCRC:
                                    237 ;	stm8s_spi.c: 209: SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
      0086C7 72 18 52 01      [ 1]  238 	bset	20993, #4
                                    239 ;	stm8s_spi.c: 210: }
      0086CB 81               [ 4]  240 	ret
                                    241 ;	stm8s_spi.c: 218: void SPI_CalculateCRCCmd(FunctionalState NewState)
                                    242 ;	-----------------------------------------
                                    243 ;	 function SPI_CalculateCRCCmd
                                    244 ;	-----------------------------------------
      0086CC                        245 _SPI_CalculateCRCCmd:
                                    246 ;	stm8s_spi.c: 225: SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
      0086CC C6 52 01         [ 1]  247 	ld	a, 0x5201
                                    248 ;	stm8s_spi.c: 223: if (NewState != DISABLE)
      0086CF 0D 03            [ 1]  249 	tnz	(0x03, sp)
      0086D1 27 06            [ 1]  250 	jreq	00102$
                                    251 ;	stm8s_spi.c: 225: SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
      0086D3 AA 20            [ 1]  252 	or	a, #0x20
      0086D5 C7 52 01         [ 1]  253 	ld	0x5201, a
      0086D8 81               [ 4]  254 	ret
      0086D9                        255 00102$:
                                    256 ;	stm8s_spi.c: 229: SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
      0086D9 A4 DF            [ 1]  257 	and	a, #0xdf
      0086DB C7 52 01         [ 1]  258 	ld	0x5201, a
                                    259 ;	stm8s_spi.c: 231: }
      0086DE 81               [ 4]  260 	ret
                                    261 ;	stm8s_spi.c: 238: uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
                                    262 ;	-----------------------------------------
                                    263 ;	 function SPI_GetCRC
                                    264 ;	-----------------------------------------
      0086DF                        265 _SPI_GetCRC:
                                    266 ;	stm8s_spi.c: 245: if (SPI_CRC != SPI_CRC_RX)
      0086DF 0D 03            [ 1]  267 	tnz	(0x03, sp)
      0086E1 27 04            [ 1]  268 	jreq	00102$
                                    269 ;	stm8s_spi.c: 247: crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
      0086E3 C6 52 07         [ 1]  270 	ld	a, 0x5207
      0086E6 81               [ 4]  271 	ret
      0086E7                        272 00102$:
                                    273 ;	stm8s_spi.c: 251: crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
      0086E7 C6 52 06         [ 1]  274 	ld	a, 0x5206
                                    275 ;	stm8s_spi.c: 255: return crcreg;
                                    276 ;	stm8s_spi.c: 256: }
      0086EA 81               [ 4]  277 	ret
                                    278 ;	stm8s_spi.c: 263: void SPI_ResetCRC(void)
                                    279 ;	-----------------------------------------
                                    280 ;	 function SPI_ResetCRC
                                    281 ;	-----------------------------------------
      0086EB                        282 _SPI_ResetCRC:
                                    283 ;	stm8s_spi.c: 267: SPI_CalculateCRCCmd(ENABLE);
      0086EB 4B 01            [ 1]  284 	push	#0x01
      0086ED CD 86 CC         [ 4]  285 	call	_SPI_CalculateCRCCmd
      0086F0 84               [ 1]  286 	pop	a
                                    287 ;	stm8s_spi.c: 270: SPI_Cmd(ENABLE);
      0086F1 4B 01            [ 1]  288 	push	#0x01
      0086F3 CD 86 68         [ 4]  289 	call	_SPI_Cmd
      0086F6 84               [ 1]  290 	pop	a
                                    291 ;	stm8s_spi.c: 271: }
      0086F7 81               [ 4]  292 	ret
                                    293 ;	stm8s_spi.c: 278: uint8_t SPI_GetCRCPolynomial(void)
                                    294 ;	-----------------------------------------
                                    295 ;	 function SPI_GetCRCPolynomial
                                    296 ;	-----------------------------------------
      0086F8                        297 _SPI_GetCRCPolynomial:
                                    298 ;	stm8s_spi.c: 280: return SPI->CRCPR; /* Return the CRC polynomial register */
      0086F8 C6 52 05         [ 1]  299 	ld	a, 0x5205
                                    300 ;	stm8s_spi.c: 281: }
      0086FB 81               [ 4]  301 	ret
                                    302 ;	stm8s_spi.c: 288: void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
                                    303 ;	-----------------------------------------
                                    304 ;	 function SPI_BiDirectionalLineConfig
                                    305 ;	-----------------------------------------
      0086FC                        306 _SPI_BiDirectionalLineConfig:
                                    307 ;	stm8s_spi.c: 295: SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
      0086FC C6 52 01         [ 1]  308 	ld	a, 0x5201
                                    309 ;	stm8s_spi.c: 293: if (SPI_Direction != SPI_DIRECTION_RX)
      0086FF 0D 03            [ 1]  310 	tnz	(0x03, sp)
      008701 27 06            [ 1]  311 	jreq	00102$
                                    312 ;	stm8s_spi.c: 295: SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
      008703 AA 40            [ 1]  313 	or	a, #0x40
      008705 C7 52 01         [ 1]  314 	ld	0x5201, a
      008708 81               [ 4]  315 	ret
      008709                        316 00102$:
                                    317 ;	stm8s_spi.c: 299: SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
      008709 A4 BF            [ 1]  318 	and	a, #0xbf
      00870B C7 52 01         [ 1]  319 	ld	0x5201, a
                                    320 ;	stm8s_spi.c: 301: }
      00870E 81               [ 4]  321 	ret
                                    322 ;	stm8s_spi.c: 311: FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
                                    323 ;	-----------------------------------------
                                    324 ;	 function SPI_GetFlagStatus
                                    325 ;	-----------------------------------------
      00870F                        326 _SPI_GetFlagStatus:
                                    327 ;	stm8s_spi.c: 318: if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
      00870F C6 52 03         [ 1]  328 	ld	a, 0x5203
      008712 14 03            [ 1]  329 	and	a, (0x03, sp)
      008714 27 03            [ 1]  330 	jreq	00102$
                                    331 ;	stm8s_spi.c: 320: status = SET; /* SPI_FLAG is set */
      008716 A6 01            [ 1]  332 	ld	a, #0x01
      008718 81               [ 4]  333 	ret
      008719                        334 00102$:
                                    335 ;	stm8s_spi.c: 324: status = RESET; /* SPI_FLAG is reset*/
      008719 4F               [ 1]  336 	clr	a
                                    337 ;	stm8s_spi.c: 328: return status;
                                    338 ;	stm8s_spi.c: 329: }
      00871A 81               [ 4]  339 	ret
                                    340 ;	stm8s_spi.c: 346: void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
                                    341 ;	-----------------------------------------
                                    342 ;	 function SPI_ClearFlag
                                    343 ;	-----------------------------------------
      00871B                        344 _SPI_ClearFlag:
                                    345 ;	stm8s_spi.c: 350: SPI->SR = (uint8_t)(~SPI_FLAG);
      00871B 7B 03            [ 1]  346 	ld	a, (0x03, sp)
      00871D 43               [ 1]  347 	cpl	a
      00871E C7 52 03         [ 1]  348 	ld	0x5203, a
                                    349 ;	stm8s_spi.c: 351: }
      008721 81               [ 4]  350 	ret
                                    351 ;	stm8s_spi.c: 366: ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
                                    352 ;	-----------------------------------------
                                    353 ;	 function SPI_GetITStatus
                                    354 ;	-----------------------------------------
      008722                        355 _SPI_GetITStatus:
      008722 89               [ 2]  356 	pushw	x
                                    357 ;	stm8s_spi.c: 375: itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
      008723 7B 05            [ 1]  358 	ld	a, (0x05, sp)
      008725 A4 0F            [ 1]  359 	and	a, #0x0f
      008727 88               [ 1]  360 	push	a
      008728 A6 01            [ 1]  361 	ld	a, #0x01
      00872A 6B 03            [ 1]  362 	ld	(0x03, sp), a
      00872C 84               [ 1]  363 	pop	a
      00872D 4D               [ 1]  364 	tnz	a
      00872E 27 05            [ 1]  365 	jreq	00118$
      008730                        366 00117$:
      008730 08 02            [ 1]  367 	sll	(0x02, sp)
      008732 4A               [ 1]  368 	dec	a
      008733 26 FB            [ 1]  369 	jrne	00117$
      008735                        370 00118$:
                                    371 ;	stm8s_spi.c: 378: itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
      008735 7B 05            [ 1]  372 	ld	a, (0x05, sp)
      008737 4E               [ 1]  373 	swap	a
      008738 A4 0F            [ 1]  374 	and	a, #0x0f
                                    375 ;	stm8s_spi.c: 380: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      00873A 88               [ 1]  376 	push	a
      00873B A6 01            [ 1]  377 	ld	a, #0x01
      00873D 6B 02            [ 1]  378 	ld	(0x02, sp), a
      00873F 84               [ 1]  379 	pop	a
      008740 4D               [ 1]  380 	tnz	a
      008741 27 05            [ 1]  381 	jreq	00120$
      008743                        382 00119$:
      008743 08 01            [ 1]  383 	sll	(0x01, sp)
      008745 4A               [ 1]  384 	dec	a
      008746 26 FB            [ 1]  385 	jrne	00119$
      008748                        386 00120$:
                                    387 ;	stm8s_spi.c: 382: enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
      008748 C6 52 03         [ 1]  388 	ld	a, 0x5203
      00874B 14 01            [ 1]  389 	and	a, (0x01, sp)
      00874D 97               [ 1]  390 	ld	xl, a
                                    391 ;	stm8s_spi.c: 384: if (((SPI->ICR & itpos) != RESET) && enablestatus)
      00874E C6 52 02         [ 1]  392 	ld	a, 0x5202
      008751 14 02            [ 1]  393 	and	a, (0x02, sp)
      008753 27 07            [ 1]  394 	jreq	00102$
      008755 9F               [ 1]  395 	ld	a, xl
      008756 4D               [ 1]  396 	tnz	a
      008757 27 03            [ 1]  397 	jreq	00102$
                                    398 ;	stm8s_spi.c: 387: pendingbitstatus = SET;
      008759 A6 01            [ 1]  399 	ld	a, #0x01
                                    400 ;	stm8s_spi.c: 392: pendingbitstatus = RESET;
      00875B 21                     401 	.byte 0x21
      00875C                        402 00102$:
      00875C 4F               [ 1]  403 	clr	a
      00875D                        404 00103$:
                                    405 ;	stm8s_spi.c: 395: return  pendingbitstatus;
                                    406 ;	stm8s_spi.c: 396: }
      00875D 85               [ 2]  407 	popw	x
      00875E 81               [ 4]  408 	ret
                                    409 ;	stm8s_spi.c: 412: void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
                                    410 ;	-----------------------------------------
                                    411 ;	 function SPI_ClearITPendingBit
                                    412 ;	-----------------------------------------
      00875F                        413 _SPI_ClearITPendingBit:
                                    414 ;	stm8s_spi.c: 420: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
      00875F 7B 03            [ 1]  415 	ld	a, (0x03, sp)
      008761 A4 F0            [ 1]  416 	and	a, #0xf0
      008763 4E               [ 1]  417 	swap	a
      008764 A4 0F            [ 1]  418 	and	a, #0x0f
      008766 97               [ 1]  419 	ld	xl, a
      008767 A6 01            [ 1]  420 	ld	a, #0x01
      008769 88               [ 1]  421 	push	a
      00876A 9F               [ 1]  422 	ld	a, xl
      00876B 4D               [ 1]  423 	tnz	a
      00876C 27 05            [ 1]  424 	jreq	00104$
      00876E                        425 00103$:
      00876E 08 01            [ 1]  426 	sll	(1, sp)
      008770 4A               [ 1]  427 	dec	a
      008771 26 FB            [ 1]  428 	jrne	00103$
      008773                        429 00104$:
      008773 84               [ 1]  430 	pop	a
                                    431 ;	stm8s_spi.c: 422: SPI->SR = (uint8_t)(~itpos);
      008774 43               [ 1]  432 	cpl	a
      008775 C7 52 03         [ 1]  433 	ld	0x5203, a
                                    434 ;	stm8s_spi.c: 424: }
      008778 81               [ 4]  435 	ret
                                    436 	.area CODE
                                    437 	.area CONST
                                    438 	.area INITIALIZER
                                    439 	.area CABS (ABS)
