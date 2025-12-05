                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CLKPrescTable
                                     12 	.globl _HSIDivFactor
                                     13 	.globl _CLK_DeInit
                                     14 	.globl _CLK_FastHaltWakeUpCmd
                                     15 	.globl _CLK_HSECmd
                                     16 	.globl _CLK_HSICmd
                                     17 	.globl _CLK_LSICmd
                                     18 	.globl _CLK_CCOCmd
                                     19 	.globl _CLK_ClockSwitchCmd
                                     20 	.globl _CLK_SlowActiveHaltWakeUpCmd
                                     21 	.globl _CLK_PeripheralClockConfig
                                     22 	.globl _CLK_ClockSwitchConfig
                                     23 	.globl _CLK_HSIPrescalerConfig
                                     24 	.globl _CLK_CCOConfig
                                     25 	.globl _CLK_ITConfig
                                     26 	.globl _CLK_SYSCLKConfig
                                     27 	.globl _CLK_SWIMConfig
                                     28 	.globl _CLK_ClockSecuritySystemEnable
                                     29 	.globl _CLK_GetSYSCLKSource
                                     30 	.globl _CLK_GetClockFreq
                                     31 	.globl _CLK_AdjustHSICalibrationValue
                                     32 	.globl _CLK_SYSCLKEmergencyClear
                                     33 	.globl _CLK_GetFlagStatus
                                     34 	.globl _CLK_GetITStatus
                                     35 	.globl _CLK_ClearITPendingBit
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DATA
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area INITIALIZED
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 
                                     49 ; default segment ordering for linker
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area CONST
                                     54 	.area INITIALIZER
                                     55 	.area CODE
                                     56 
                                     57 ;--------------------------------------------------------
                                     58 ; global & static initialisations
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
                                     61 	.area GSINIT
                                     62 	.area GSFINAL
                                     63 	.area GSINIT
                                     64 ;--------------------------------------------------------
                                     65 ; Home
                                     66 ;--------------------------------------------------------
                                     67 	.area HOME
                                     68 	.area HOME
                                     69 ;--------------------------------------------------------
                                     70 ; code
                                     71 ;--------------------------------------------------------
                                     72 	.area CODE
                                     73 ;	stm8s_clk.c: 72: void CLK_DeInit(void)
                                     74 ;	-----------------------------------------
                                     75 ;	 function CLK_DeInit
                                     76 ;	-----------------------------------------
      0082DB                         77 _CLK_DeInit:
                                     78 ;	stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      0082DB 35 01 50 C0      [ 1]   79 	mov	0x50c0+0, #0x01
                                     80 ;	stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      0082DF 35 00 50 C1      [ 1]   81 	mov	0x50c1+0, #0x00
                                     82 ;	stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      0082E3 35 E1 50 C4      [ 1]   83 	mov	0x50c4+0, #0xe1
                                     84 ;	stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      0082E7 35 00 50 C5      [ 1]   85 	mov	0x50c5+0, #0x00
                                     86 ;	stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      0082EB 35 18 50 C6      [ 1]   87 	mov	0x50c6+0, #0x18
                                     88 ;	stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      0082EF 35 FF 50 C7      [ 1]   89 	mov	0x50c7+0, #0xff
                                     90 ;	stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      0082F3 35 FF 50 CA      [ 1]   91 	mov	0x50ca+0, #0xff
                                     92 ;	stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      0082F7 35 00 50 C8      [ 1]   93 	mov	0x50c8+0, #0x00
                                     94 ;	stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0082FB 35 00 50 C9      [ 1]   95 	mov	0x50c9+0, #0x00
                                     96 ;	stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      0082FF                         97 00101$:
      0082FF C6 50 C9         [ 1]   98 	ld	a, 0x50c9
      008302 44               [ 1]   99 	srl	a
      008303 25 FA            [ 1]  100 	jrc	00101$
                                    101 ;	stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008305 35 00 50 C9      [ 1]  102 	mov	0x50c9+0, #0x00
                                    103 ;	stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008309 35 00 50 CC      [ 1]  104 	mov	0x50cc+0, #0x00
                                    105 ;	stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      00830D 35 00 50 CD      [ 1]  106 	mov	0x50cd+0, #0x00
                                    107 ;	stm8s_clk.c: 88: }
      008311 81               [ 4]  108 	ret
                                    109 ;	stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    110 ;	-----------------------------------------
                                    111 ;	 function CLK_FastHaltWakeUpCmd
                                    112 ;	-----------------------------------------
      008312                        113 _CLK_FastHaltWakeUpCmd:
                                    114 ;	stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      008312 C6 50 C0         [ 1]  115 	ld	a, 0x50c0
                                    116 ;	stm8s_clk.c: 104: if (NewState != DISABLE)
      008315 0D 03            [ 1]  117 	tnz	(0x03, sp)
      008317 27 06            [ 1]  118 	jreq	00102$
                                    119 ;	stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      008319 AA 04            [ 1]  120 	or	a, #0x04
      00831B C7 50 C0         [ 1]  121 	ld	0x50c0, a
      00831E 81               [ 4]  122 	ret
      00831F                        123 00102$:
                                    124 ;	stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      00831F A4 FB            [ 1]  125 	and	a, #0xfb
      008321 C7 50 C0         [ 1]  126 	ld	0x50c0, a
                                    127 ;	stm8s_clk.c: 114: }
      008324 81               [ 4]  128 	ret
                                    129 ;	stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
                                    130 ;	-----------------------------------------
                                    131 ;	 function CLK_HSECmd
                                    132 ;	-----------------------------------------
      008325                        133 _CLK_HSECmd:
                                    134 ;	stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      008325 C6 50 C1         [ 1]  135 	ld	a, 0x50c1
                                    136 ;	stm8s_clk.c: 126: if (NewState != DISABLE)
      008328 0D 03            [ 1]  137 	tnz	(0x03, sp)
      00832A 27 06            [ 1]  138 	jreq	00102$
                                    139 ;	stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      00832C AA 01            [ 1]  140 	or	a, #0x01
      00832E C7 50 C1         [ 1]  141 	ld	0x50c1, a
      008331 81               [ 4]  142 	ret
      008332                        143 00102$:
                                    144 ;	stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008332 A4 FE            [ 1]  145 	and	a, #0xfe
      008334 C7 50 C1         [ 1]  146 	ld	0x50c1, a
                                    147 ;	stm8s_clk.c: 136: }
      008337 81               [ 4]  148 	ret
                                    149 ;	stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
                                    150 ;	-----------------------------------------
                                    151 ;	 function CLK_HSICmd
                                    152 ;	-----------------------------------------
      008338                        153 _CLK_HSICmd:
                                    154 ;	stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      008338 C6 50 C0         [ 1]  155 	ld	a, 0x50c0
                                    156 ;	stm8s_clk.c: 148: if (NewState != DISABLE)
      00833B 0D 03            [ 1]  157 	tnz	(0x03, sp)
      00833D 27 06            [ 1]  158 	jreq	00102$
                                    159 ;	stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      00833F AA 01            [ 1]  160 	or	a, #0x01
      008341 C7 50 C0         [ 1]  161 	ld	0x50c0, a
      008344 81               [ 4]  162 	ret
      008345                        163 00102$:
                                    164 ;	stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      008345 A4 FE            [ 1]  165 	and	a, #0xfe
      008347 C7 50 C0         [ 1]  166 	ld	0x50c0, a
                                    167 ;	stm8s_clk.c: 158: }
      00834A 81               [ 4]  168 	ret
                                    169 ;	stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
                                    170 ;	-----------------------------------------
                                    171 ;	 function CLK_LSICmd
                                    172 ;	-----------------------------------------
      00834B                        173 _CLK_LSICmd:
                                    174 ;	stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      00834B C6 50 C0         [ 1]  175 	ld	a, 0x50c0
                                    176 ;	stm8s_clk.c: 171: if (NewState != DISABLE)
      00834E 0D 03            [ 1]  177 	tnz	(0x03, sp)
      008350 27 06            [ 1]  178 	jreq	00102$
                                    179 ;	stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      008352 AA 08            [ 1]  180 	or	a, #0x08
      008354 C7 50 C0         [ 1]  181 	ld	0x50c0, a
      008357 81               [ 4]  182 	ret
      008358                        183 00102$:
                                    184 ;	stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      008358 A4 F7            [ 1]  185 	and	a, #0xf7
      00835A C7 50 C0         [ 1]  186 	ld	0x50c0, a
                                    187 ;	stm8s_clk.c: 181: }
      00835D 81               [ 4]  188 	ret
                                    189 ;	stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
                                    190 ;	-----------------------------------------
                                    191 ;	 function CLK_CCOCmd
                                    192 ;	-----------------------------------------
      00835E                        193 _CLK_CCOCmd:
                                    194 ;	stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      00835E C6 50 C9         [ 1]  195 	ld	a, 0x50c9
                                    196 ;	stm8s_clk.c: 194: if (NewState != DISABLE)
      008361 0D 03            [ 1]  197 	tnz	(0x03, sp)
      008363 27 06            [ 1]  198 	jreq	00102$
                                    199 ;	stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      008365 AA 01            [ 1]  200 	or	a, #0x01
      008367 C7 50 C9         [ 1]  201 	ld	0x50c9, a
      00836A 81               [ 4]  202 	ret
      00836B                        203 00102$:
                                    204 ;	stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      00836B A4 FE            [ 1]  205 	and	a, #0xfe
      00836D C7 50 C9         [ 1]  206 	ld	0x50c9, a
                                    207 ;	stm8s_clk.c: 204: }
      008370 81               [ 4]  208 	ret
                                    209 ;	stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    210 ;	-----------------------------------------
                                    211 ;	 function CLK_ClockSwitchCmd
                                    212 ;	-----------------------------------------
      008371                        213 _CLK_ClockSwitchCmd:
                                    214 ;	stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      008371 C6 50 C5         [ 1]  215 	ld	a, 0x50c5
                                    216 ;	stm8s_clk.c: 218: if (NewState != DISABLE )
      008374 0D 03            [ 1]  217 	tnz	(0x03, sp)
      008376 27 06            [ 1]  218 	jreq	00102$
                                    219 ;	stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      008378 AA 02            [ 1]  220 	or	a, #0x02
      00837A C7 50 C5         [ 1]  221 	ld	0x50c5, a
      00837D 81               [ 4]  222 	ret
      00837E                        223 00102$:
                                    224 ;	stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      00837E A4 FD            [ 1]  225 	and	a, #0xfd
      008380 C7 50 C5         [ 1]  226 	ld	0x50c5, a
                                    227 ;	stm8s_clk.c: 228: }
      008383 81               [ 4]  228 	ret
                                    229 ;	stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    232 ;	-----------------------------------------
      008384                        233 _CLK_SlowActiveHaltWakeUpCmd:
                                    234 ;	stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      008384 C6 50 C0         [ 1]  235 	ld	a, 0x50c0
                                    236 ;	stm8s_clk.c: 243: if (NewState != DISABLE)
      008387 0D 03            [ 1]  237 	tnz	(0x03, sp)
      008389 27 06            [ 1]  238 	jreq	00102$
                                    239 ;	stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      00838B AA 20            [ 1]  240 	or	a, #0x20
      00838D C7 50 C0         [ 1]  241 	ld	0x50c0, a
      008390 81               [ 4]  242 	ret
      008391                        243 00102$:
                                    244 ;	stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      008391 A4 DF            [ 1]  245 	and	a, #0xdf
      008393 C7 50 C0         [ 1]  246 	ld	0x50c0, a
                                    247 ;	stm8s_clk.c: 253: }
      008396 81               [ 4]  248 	ret
                                    249 ;	stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    250 ;	-----------------------------------------
                                    251 ;	 function CLK_PeripheralClockConfig
                                    252 ;	-----------------------------------------
      008397                        253 _CLK_PeripheralClockConfig:
      008397 89               [ 2]  254 	pushw	x
                                    255 ;	stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008398 7B 05            [ 1]  256 	ld	a, (0x05, sp)
      00839A A4 0F            [ 1]  257 	and	a, #0x0f
      00839C 88               [ 1]  258 	push	a
      00839D A6 01            [ 1]  259 	ld	a, #0x01
      00839F 6B 03            [ 1]  260 	ld	(0x03, sp), a
      0083A1 84               [ 1]  261 	pop	a
      0083A2 4D               [ 1]  262 	tnz	a
      0083A3 27 05            [ 1]  263 	jreq	00128$
      0083A5                        264 00127$:
      0083A5 08 02            [ 1]  265 	sll	(0x02, sp)
      0083A7 4A               [ 1]  266 	dec	a
      0083A8 26 FB            [ 1]  267 	jrne	00127$
      0083AA                        268 00128$:
                                    269 ;	stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0083AA 7B 02            [ 1]  270 	ld	a, (0x02, sp)
      0083AC 43               [ 1]  271 	cpl	a
      0083AD 6B 01            [ 1]  272 	ld	(0x01, sp), a
                                    273 ;	stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      0083AF 7B 05            [ 1]  274 	ld	a, (0x05, sp)
      0083B1 A5 10            [ 1]  275 	bcp	a, #0x10
      0083B3 26 15            [ 1]  276 	jrne	00108$
                                    277 ;	stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0083B5 C6 50 C7         [ 1]  278 	ld	a, 0x50c7
                                    279 ;	stm8s_clk.c: 271: if (NewState != DISABLE)
      0083B8 0D 06            [ 1]  280 	tnz	(0x06, sp)
      0083BA 27 07            [ 1]  281 	jreq	00102$
                                    282 ;	stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0083BC 1A 02            [ 1]  283 	or	a, (0x02, sp)
      0083BE C7 50 C7         [ 1]  284 	ld	0x50c7, a
      0083C1 20 1A            [ 2]  285 	jra	00110$
      0083C3                        286 00102$:
                                    287 ;	stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0083C3 14 01            [ 1]  288 	and	a, (0x01, sp)
      0083C5 C7 50 C7         [ 1]  289 	ld	0x50c7, a
      0083C8 20 13            [ 2]  290 	jra	00110$
      0083CA                        291 00108$:
                                    292 ;	stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0083CA C6 50 CA         [ 1]  293 	ld	a, 0x50ca
                                    294 ;	stm8s_clk.c: 284: if (NewState != DISABLE)
      0083CD 0D 06            [ 1]  295 	tnz	(0x06, sp)
      0083CF 27 07            [ 1]  296 	jreq	00105$
                                    297 ;	stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0083D1 1A 02            [ 1]  298 	or	a, (0x02, sp)
      0083D3 C7 50 CA         [ 1]  299 	ld	0x50ca, a
      0083D6 20 05            [ 2]  300 	jra	00110$
      0083D8                        301 00105$:
                                    302 ;	stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0083D8 14 01            [ 1]  303 	and	a, (0x01, sp)
      0083DA C7 50 CA         [ 1]  304 	ld	0x50ca, a
      0083DD                        305 00110$:
                                    306 ;	stm8s_clk.c: 295: }
      0083DD 85               [ 2]  307 	popw	x
      0083DE 81               [ 4]  308 	ret
                                    309 ;	stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    310 ;	-----------------------------------------
                                    311 ;	 function CLK_ClockSwitchConfig
                                    312 ;	-----------------------------------------
      0083DF                        313 _CLK_ClockSwitchConfig:
                                    314 ;	stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      0083DF C6 50 C3         [ 1]  315 	ld	a, 0x50c3
      0083E2 90 97            [ 1]  316 	ld	yl, a
                                    317 ;	stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      0083E4 C6 50 C5         [ 1]  318 	ld	a, 0x50c5
                                    319 ;	stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      0083E7 88               [ 1]  320 	push	a
      0083E8 7B 04            [ 1]  321 	ld	a, (0x04, sp)
      0083EA 4A               [ 1]  322 	dec	a
      0083EB 84               [ 1]  323 	pop	a
      0083EC 26 38            [ 1]  324 	jrne	00122$
                                    325 ;	stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      0083EE AA 02            [ 1]  326 	or	a, #0x02
      0083F0 C7 50 C5         [ 1]  327 	ld	0x50c5, a
      0083F3 C6 50 C5         [ 1]  328 	ld	a, 0x50c5
                                    329 ;	stm8s_clk.c: 331: if (ITState != DISABLE)
      0083F6 0D 05            [ 1]  330 	tnz	(0x05, sp)
      0083F8 27 07            [ 1]  331 	jreq	00102$
                                    332 ;	stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
      0083FA AA 04            [ 1]  333 	or	a, #0x04
      0083FC C7 50 C5         [ 1]  334 	ld	0x50c5, a
      0083FF 20 05            [ 2]  335 	jra	00103$
      008401                        336 00102$:
                                    337 ;	stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008401 A4 FB            [ 1]  338 	and	a, #0xfb
      008403 C7 50 C5         [ 1]  339 	ld	0x50c5, a
      008406                        340 00103$:
                                    341 ;	stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
      008406 AE 50 C4         [ 2]  342 	ldw	x, #0x50c4
      008409 7B 04            [ 1]  343 	ld	a, (0x04, sp)
      00840B F7               [ 1]  344 	ld	(x), a
                                    345 ;	stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      00840C 5F               [ 1]  346 	clrw	x
      00840D 5A               [ 2]  347 	decw	x
      00840E                        348 00105$:
      00840E C6 50 C5         [ 1]  349 	ld	a, 0x50c5
      008411 44               [ 1]  350 	srl	a
      008412 24 06            [ 1]  351 	jrnc	00107$
      008414 5D               [ 2]  352 	tnzw	x
      008415 27 03            [ 1]  353 	jreq	00107$
                                    354 ;	stm8s_clk.c: 346: DownCounter--;
      008417 5A               [ 2]  355 	decw	x
      008418 20 F4            [ 2]  356 	jra	00105$
      00841A                        357 00107$:
                                    358 ;	stm8s_clk.c: 349: if(DownCounter != 0)
      00841A 5D               [ 2]  359 	tnzw	x
      00841B 27 05            [ 1]  360 	jreq	00109$
                                    361 ;	stm8s_clk.c: 351: Swif = SUCCESS;
      00841D A6 01            [ 1]  362 	ld	a, #0x01
      00841F 97               [ 1]  363 	ld	xl, a
      008420 20 37            [ 2]  364 	jra	00123$
      008422                        365 00109$:
                                    366 ;	stm8s_clk.c: 355: Swif = ERROR;
      008422 4F               [ 1]  367 	clr	a
      008423 97               [ 1]  368 	ld	xl, a
      008424 20 33            [ 2]  369 	jra	00123$
      008426                        370 00122$:
                                    371 ;	stm8s_clk.c: 361: if (ITState != DISABLE)
      008426 0D 05            [ 1]  372 	tnz	(0x05, sp)
      008428 27 07            [ 1]  373 	jreq	00112$
                                    374 ;	stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
      00842A AA 04            [ 1]  375 	or	a, #0x04
      00842C C7 50 C5         [ 1]  376 	ld	0x50c5, a
      00842F 20 05            [ 2]  377 	jra	00113$
      008431                        378 00112$:
                                    379 ;	stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008431 A4 FB            [ 1]  380 	and	a, #0xfb
      008433 C7 50 C5         [ 1]  381 	ld	0x50c5, a
      008436                        382 00113$:
                                    383 ;	stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
      008436 AE 50 C4         [ 2]  384 	ldw	x, #0x50c4
      008439 7B 04            [ 1]  385 	ld	a, (0x04, sp)
      00843B F7               [ 1]  386 	ld	(x), a
                                    387 ;	stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      00843C 5F               [ 1]  388 	clrw	x
      00843D 5A               [ 2]  389 	decw	x
      00843E                        390 00115$:
      00843E C6 50 C5         [ 1]  391 	ld	a, 0x50c5
      008441 A5 08            [ 1]  392 	bcp	a, #0x08
      008443 27 06            [ 1]  393 	jreq	00117$
      008445 5D               [ 2]  394 	tnzw	x
      008446 27 03            [ 1]  395 	jreq	00117$
                                    396 ;	stm8s_clk.c: 376: DownCounter--;
      008448 5A               [ 2]  397 	decw	x
      008449 20 F3            [ 2]  398 	jra	00115$
      00844B                        399 00117$:
                                    400 ;	stm8s_clk.c: 379: if(DownCounter != 0)
      00844B 5D               [ 2]  401 	tnzw	x
      00844C 27 09            [ 1]  402 	jreq	00119$
                                    403 ;	stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
      00844E 72 12 50 C5      [ 1]  404 	bset	20677, #1
                                    405 ;	stm8s_clk.c: 383: Swif = SUCCESS;
      008452 A6 01            [ 1]  406 	ld	a, #0x01
      008454 97               [ 1]  407 	ld	xl, a
      008455 20 02            [ 2]  408 	jra	00123$
      008457                        409 00119$:
                                    410 ;	stm8s_clk.c: 387: Swif = ERROR;
      008457 4F               [ 1]  411 	clr	a
      008458 97               [ 1]  412 	ld	xl, a
      008459                        413 00123$:
                                    414 ;	stm8s_clk.c: 390: if(Swif != ERROR)
      008459 9F               [ 1]  415 	ld	a, xl
      00845A 4D               [ 1]  416 	tnz	a
      00845B 27 2E            [ 1]  417 	jreq	00136$
                                    418 ;	stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      00845D 0D 06            [ 1]  419 	tnz	(0x06, sp)
      00845F 26 0C            [ 1]  420 	jrne	00132$
      008461 90 9F            [ 1]  421 	ld	a, yl
      008463 A1 E1            [ 1]  422 	cp	a, #0xe1
      008465 26 06            [ 1]  423 	jrne	00132$
                                    424 ;	stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      008467 72 11 50 C0      [ 1]  425 	bres	20672, #0
      00846B 20 1E            [ 2]  426 	jra	00136$
      00846D                        427 00132$:
                                    428 ;	stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      00846D 0D 06            [ 1]  429 	tnz	(0x06, sp)
      00846F 26 0C            [ 1]  430 	jrne	00128$
      008471 90 9F            [ 1]  431 	ld	a, yl
      008473 A1 D2            [ 1]  432 	cp	a, #0xd2
      008475 26 06            [ 1]  433 	jrne	00128$
                                    434 ;	stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      008477 72 17 50 C0      [ 1]  435 	bres	20672, #3
      00847B 20 0E            [ 2]  436 	jra	00136$
      00847D                        437 00128$:
                                    438 ;	stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      00847D 0D 06            [ 1]  439 	tnz	(0x06, sp)
      00847F 26 0A            [ 1]  440 	jrne	00136$
      008481 90 9F            [ 1]  441 	ld	a, yl
      008483 A1 B4            [ 1]  442 	cp	a, #0xb4
      008485 26 04            [ 1]  443 	jrne	00136$
                                    444 ;	stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008487 72 11 50 C1      [ 1]  445 	bres	20673, #0
      00848B                        446 00136$:
                                    447 ;	stm8s_clk.c: 406: return(Swif);
      00848B 9F               [ 1]  448 	ld	a, xl
                                    449 ;	stm8s_clk.c: 407: }
      00848C 81               [ 4]  450 	ret
                                    451 ;	stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    452 ;	-----------------------------------------
                                    453 ;	 function CLK_HSIPrescalerConfig
                                    454 ;	-----------------------------------------
      00848D                        455 _CLK_HSIPrescalerConfig:
                                    456 ;	stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00848D C6 50 C6         [ 1]  457 	ld	a, 0x50c6
      008490 A4 E7            [ 1]  458 	and	a, #0xe7
      008492 C7 50 C6         [ 1]  459 	ld	0x50c6, a
                                    460 ;	stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      008495 C6 50 C6         [ 1]  461 	ld	a, 0x50c6
      008498 1A 03            [ 1]  462 	or	a, (0x03, sp)
      00849A C7 50 C6         [ 1]  463 	ld	0x50c6, a
                                    464 ;	stm8s_clk.c: 425: }
      00849D 81               [ 4]  465 	ret
                                    466 ;	stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    467 ;	-----------------------------------------
                                    468 ;	 function CLK_CCOConfig
                                    469 ;	-----------------------------------------
      00849E                        470 _CLK_CCOConfig:
                                    471 ;	stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      00849E C6 50 C9         [ 1]  472 	ld	a, 0x50c9
      0084A1 A4 E1            [ 1]  473 	and	a, #0xe1
      0084A3 C7 50 C9         [ 1]  474 	ld	0x50c9, a
                                    475 ;	stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
      0084A6 C6 50 C9         [ 1]  476 	ld	a, 0x50c9
      0084A9 1A 03            [ 1]  477 	or	a, (0x03, sp)
      0084AB C7 50 C9         [ 1]  478 	ld	0x50c9, a
                                    479 ;	stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
      0084AE 72 10 50 C9      [ 1]  480 	bset	20681, #0
                                    481 ;	stm8s_clk.c: 449: }
      0084B2 81               [ 4]  482 	ret
                                    483 ;	stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    484 ;	-----------------------------------------
                                    485 ;	 function CLK_ITConfig
                                    486 ;	-----------------------------------------
      0084B3                        487 _CLK_ITConfig:
      0084B3 88               [ 1]  488 	push	a
                                    489 ;	stm8s_clk.c: 467: switch (CLK_IT)
      0084B4 7B 04            [ 1]  490 	ld	a, (0x04, sp)
      0084B6 A0 0C            [ 1]  491 	sub	a, #0x0c
      0084B8 26 04            [ 1]  492 	jrne	00140$
      0084BA 4C               [ 1]  493 	inc	a
      0084BB 6B 01            [ 1]  494 	ld	(0x01, sp), a
      0084BD C1                     495 	.byte 0xc1
      0084BE                        496 00140$:
      0084BE 0F 01            [ 1]  497 	clr	(0x01, sp)
      0084C0                        498 00141$:
      0084C0 7B 04            [ 1]  499 	ld	a, (0x04, sp)
      0084C2 A0 1C            [ 1]  500 	sub	a, #0x1c
      0084C4 26 02            [ 1]  501 	jrne	00143$
      0084C6 4C               [ 1]  502 	inc	a
      0084C7 21                     503 	.byte 0x21
      0084C8                        504 00143$:
      0084C8 4F               [ 1]  505 	clr	a
      0084C9                        506 00144$:
                                    507 ;	stm8s_clk.c: 465: if (NewState != DISABLE)
      0084C9 0D 05            [ 1]  508 	tnz	(0x05, sp)
      0084CB 27 13            [ 1]  509 	jreq	00110$
                                    510 ;	stm8s_clk.c: 467: switch (CLK_IT)
      0084CD 0D 01            [ 1]  511 	tnz	(0x01, sp)
      0084CF 26 09            [ 1]  512 	jrne	00102$
      0084D1 4D               [ 1]  513 	tnz	a
      0084D2 27 1D            [ 1]  514 	jreq	00112$
                                    515 ;	stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
      0084D4 72 14 50 C5      [ 1]  516 	bset	20677, #2
                                    517 ;	stm8s_clk.c: 471: break;
      0084D8 20 17            [ 2]  518 	jra	00112$
                                    519 ;	stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      0084DA                        520 00102$:
                                    521 ;	stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
      0084DA 72 14 50 C8      [ 1]  522 	bset	20680, #2
                                    523 ;	stm8s_clk.c: 474: break;
      0084DE 20 11            [ 2]  524 	jra	00112$
                                    525 ;	stm8s_clk.c: 477: }
      0084E0                        526 00110$:
                                    527 ;	stm8s_clk.c: 481: switch (CLK_IT)
      0084E0 0D 01            [ 1]  528 	tnz	(0x01, sp)
      0084E2 26 09            [ 1]  529 	jrne	00106$
      0084E4 4D               [ 1]  530 	tnz	a
      0084E5 27 0A            [ 1]  531 	jreq	00112$
                                    532 ;	stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      0084E7 72 15 50 C5      [ 1]  533 	bres	20677, #2
                                    534 ;	stm8s_clk.c: 485: break;
      0084EB 20 04            [ 2]  535 	jra	00112$
                                    536 ;	stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      0084ED                        537 00106$:
                                    538 ;	stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      0084ED 72 15 50 C8      [ 1]  539 	bres	20680, #2
                                    540 ;	stm8s_clk.c: 491: }
      0084F1                        541 00112$:
                                    542 ;	stm8s_clk.c: 493: }
      0084F1 84               [ 1]  543 	pop	a
      0084F2 81               [ 4]  544 	ret
                                    545 ;	stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    546 ;	-----------------------------------------
                                    547 ;	 function CLK_SYSCLKConfig
                                    548 ;	-----------------------------------------
      0084F3                        549 _CLK_SYSCLKConfig:
      0084F3 89               [ 2]  550 	pushw	x
                                    551 ;	stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0084F4 C6 50 C6         [ 1]  552 	ld	a, 0x50c6
                                    553 ;	stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      0084F7 0D 05            [ 1]  554 	tnz	(0x05, sp)
      0084F9 2B 15            [ 1]  555 	jrmi	00102$
                                    556 ;	stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0084FB A4 E7            [ 1]  557 	and	a, #0xe7
      0084FD C7 50 C6         [ 1]  558 	ld	0x50c6, a
                                    559 ;	stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      008500 C6 50 C6         [ 1]  560 	ld	a, 0x50c6
      008503 6B 02            [ 1]  561 	ld	(0x02, sp), a
      008505 7B 05            [ 1]  562 	ld	a, (0x05, sp)
      008507 A4 18            [ 1]  563 	and	a, #0x18
      008509 1A 02            [ 1]  564 	or	a, (0x02, sp)
      00850B C7 50 C6         [ 1]  565 	ld	0x50c6, a
      00850E 20 13            [ 2]  566 	jra	00104$
      008510                        567 00102$:
                                    568 ;	stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      008510 A4 F8            [ 1]  569 	and	a, #0xf8
      008512 C7 50 C6         [ 1]  570 	ld	0x50c6, a
                                    571 ;	stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      008515 C6 50 C6         [ 1]  572 	ld	a, 0x50c6
      008518 6B 01            [ 1]  573 	ld	(0x01, sp), a
      00851A 7B 05            [ 1]  574 	ld	a, (0x05, sp)
      00851C A4 07            [ 1]  575 	and	a, #0x07
      00851E 1A 01            [ 1]  576 	or	a, (0x01, sp)
      008520 C7 50 C6         [ 1]  577 	ld	0x50c6, a
      008523                        578 00104$:
                                    579 ;	stm8s_clk.c: 515: }
      008523 85               [ 2]  580 	popw	x
      008524 81               [ 4]  581 	ret
                                    582 ;	stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    583 ;	-----------------------------------------
                                    584 ;	 function CLK_SWIMConfig
                                    585 ;	-----------------------------------------
      008525                        586 _CLK_SWIMConfig:
                                    587 ;	stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      008525 C6 50 CD         [ 1]  588 	ld	a, 0x50cd
                                    589 ;	stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      008528 0D 03            [ 1]  590 	tnz	(0x03, sp)
      00852A 27 06            [ 1]  591 	jreq	00102$
                                    592 ;	stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      00852C AA 01            [ 1]  593 	or	a, #0x01
      00852E C7 50 CD         [ 1]  594 	ld	0x50cd, a
      008531 81               [ 4]  595 	ret
      008532                        596 00102$:
                                    597 ;	stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      008532 A4 FE            [ 1]  598 	and	a, #0xfe
      008534 C7 50 CD         [ 1]  599 	ld	0x50cd, a
                                    600 ;	stm8s_clk.c: 538: }
      008537 81               [ 4]  601 	ret
                                    602 ;	stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
                                    603 ;	-----------------------------------------
                                    604 ;	 function CLK_ClockSecuritySystemEnable
                                    605 ;	-----------------------------------------
      008538                        606 _CLK_ClockSecuritySystemEnable:
                                    607 ;	stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
      008538 72 10 50 C8      [ 1]  608 	bset	20680, #0
                                    609 ;	stm8s_clk.c: 551: }
      00853C 81               [ 4]  610 	ret
                                    611 ;	stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    612 ;	-----------------------------------------
                                    613 ;	 function CLK_GetSYSCLKSource
                                    614 ;	-----------------------------------------
      00853D                        615 _CLK_GetSYSCLKSource:
                                    616 ;	stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
      00853D C6 50 C3         [ 1]  617 	ld	a, 0x50c3
                                    618 ;	stm8s_clk.c: 562: }
      008540 81               [ 4]  619 	ret
                                    620 ;	stm8s_clk.c: 569: uint32_t CLK_GetClockFreq(void)
                                    621 ;	-----------------------------------------
                                    622 ;	 function CLK_GetClockFreq
                                    623 ;	-----------------------------------------
      008541                        624 _CLK_GetClockFreq:
      008541 52 05            [ 2]  625 	sub	sp, #5
                                    626 ;	stm8s_clk.c: 576: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      008543 C6 50 C3         [ 1]  627 	ld	a, 0x50c3
      008546 6B 01            [ 1]  628 	ld	(0x01, sp), a
                                    629 ;	stm8s_clk.c: 578: if (clocksource == CLK_SOURCE_HSI)
      008548 7B 01            [ 1]  630 	ld	a, (0x01, sp)
      00854A A1 E1            [ 1]  631 	cp	a, #0xe1
      00854C 26 26            [ 1]  632 	jrne	00105$
                                    633 ;	stm8s_clk.c: 580: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      00854E C6 50 C6         [ 1]  634 	ld	a, 0x50c6
      008551 A4 18            [ 1]  635 	and	a, #0x18
                                    636 ;	stm8s_clk.c: 581: tmp = (uint8_t)(tmp >> 3);
      008553 44               [ 1]  637 	srl	a
      008554 44               [ 1]  638 	srl	a
      008555 44               [ 1]  639 	srl	a
                                    640 ;	stm8s_clk.c: 582: presc = HSIDivFactor[tmp];
      008556 5F               [ 1]  641 	clrw	x
      008557 97               [ 1]  642 	ld	xl, a
      008558 1C 80 30         [ 2]  643 	addw	x, #_HSIDivFactor
      00855B F6               [ 1]  644 	ld	a, (x)
                                    645 ;	stm8s_clk.c: 583: clockfrequency = HSI_VALUE / presc;
      00855C 5F               [ 1]  646 	clrw	x
      00855D 97               [ 1]  647 	ld	xl, a
      00855E 90 5F            [ 1]  648 	clrw	y
      008560 89               [ 2]  649 	pushw	x
      008561 90 89            [ 2]  650 	pushw	y
      008563 4B 00            [ 1]  651 	push	#0x00
      008565 4B 24            [ 1]  652 	push	#0x24
      008567 4B F4            [ 1]  653 	push	#0xf4
      008569 4B 00            [ 1]  654 	push	#0x00
      00856B CD 94 83         [ 4]  655 	call	__divulong
      00856E 5B 08            [ 2]  656 	addw	sp, #8
      008570 1F 04            [ 2]  657 	ldw	(0x04, sp), x
      008572 20 1A            [ 2]  658 	jra	00106$
      008574                        659 00105$:
                                    660 ;	stm8s_clk.c: 585: else if ( clocksource == CLK_SOURCE_LSI)
      008574 7B 01            [ 1]  661 	ld	a, (0x01, sp)
      008576 A1 D2            [ 1]  662 	cp	a, #0xd2
      008578 26 0B            [ 1]  663 	jrne	00102$
                                    664 ;	stm8s_clk.c: 587: clockfrequency = LSI_VALUE;
      00857A AE F4 00         [ 2]  665 	ldw	x, #0xf400
      00857D 1F 04            [ 2]  666 	ldw	(0x04, sp), x
      00857F 90 AE 00 01      [ 2]  667 	ldw	y, #0x0001
      008583 20 09            [ 2]  668 	jra	00106$
      008585                        669 00102$:
                                    670 ;	stm8s_clk.c: 591: clockfrequency = HSE_VALUE;
      008585 AE 24 00         [ 2]  671 	ldw	x, #0x2400
      008588 1F 04            [ 2]  672 	ldw	(0x04, sp), x
      00858A 90 AE 00 F4      [ 2]  673 	ldw	y, #0x00f4
      00858E                        674 00106$:
                                    675 ;	stm8s_clk.c: 594: return((uint32_t)clockfrequency);
      00858E 1E 04            [ 2]  676 	ldw	x, (0x04, sp)
                                    677 ;	stm8s_clk.c: 595: }
      008590 5B 05            [ 2]  678 	addw	sp, #5
      008592 81               [ 4]  679 	ret
                                    680 ;	stm8s_clk.c: 604: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    681 ;	-----------------------------------------
                                    682 ;	 function CLK_AdjustHSICalibrationValue
                                    683 ;	-----------------------------------------
      008593                        684 _CLK_AdjustHSICalibrationValue:
                                    685 ;	stm8s_clk.c: 610: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      008593 C6 50 CC         [ 1]  686 	ld	a, 0x50cc
      008596 A4 F8            [ 1]  687 	and	a, #0xf8
      008598 1A 03            [ 1]  688 	or	a, (0x03, sp)
      00859A C7 50 CC         [ 1]  689 	ld	0x50cc, a
                                    690 ;	stm8s_clk.c: 611: }
      00859D 81               [ 4]  691 	ret
                                    692 ;	stm8s_clk.c: 622: void CLK_SYSCLKEmergencyClear(void)
                                    693 ;	-----------------------------------------
                                    694 ;	 function CLK_SYSCLKEmergencyClear
                                    695 ;	-----------------------------------------
      00859E                        696 _CLK_SYSCLKEmergencyClear:
                                    697 ;	stm8s_clk.c: 624: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      00859E 72 11 50 C5      [ 1]  698 	bres	20677, #0
                                    699 ;	stm8s_clk.c: 625: }
      0085A2 81               [ 4]  700 	ret
                                    701 ;	stm8s_clk.c: 634: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    702 ;	-----------------------------------------
                                    703 ;	 function CLK_GetFlagStatus
                                    704 ;	-----------------------------------------
      0085A3                        705 _CLK_GetFlagStatus:
      0085A3 88               [ 1]  706 	push	a
                                    707 ;	stm8s_clk.c: 644: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      0085A4 4F               [ 1]  708 	clr	a
      0085A5 97               [ 1]  709 	ld	xl, a
      0085A6 7B 04            [ 1]  710 	ld	a, (0x04, sp)
      0085A8 95               [ 1]  711 	ld	xh, a
                                    712 ;	stm8s_clk.c: 647: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      0085A9 A3 01 00         [ 2]  713 	cpw	x, #0x0100
      0085AC 26 05            [ 1]  714 	jrne	00111$
                                    715 ;	stm8s_clk.c: 649: tmpreg = CLK->ICKR;
      0085AE C6 50 C0         [ 1]  716 	ld	a, 0x50c0
      0085B1 20 21            [ 2]  717 	jra	00112$
      0085B3                        718 00111$:
                                    719 ;	stm8s_clk.c: 651: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      0085B3 A3 02 00         [ 2]  720 	cpw	x, #0x0200
      0085B6 26 05            [ 1]  721 	jrne	00108$
                                    722 ;	stm8s_clk.c: 653: tmpreg = CLK->ECKR;
      0085B8 C6 50 C1         [ 1]  723 	ld	a, 0x50c1
      0085BB 20 17            [ 2]  724 	jra	00112$
      0085BD                        725 00108$:
                                    726 ;	stm8s_clk.c: 655: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      0085BD A3 03 00         [ 2]  727 	cpw	x, #0x0300
      0085C0 26 05            [ 1]  728 	jrne	00105$
                                    729 ;	stm8s_clk.c: 657: tmpreg = CLK->SWCR;
      0085C2 C6 50 C5         [ 1]  730 	ld	a, 0x50c5
      0085C5 20 0D            [ 2]  731 	jra	00112$
      0085C7                        732 00105$:
                                    733 ;	stm8s_clk.c: 659: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      0085C7 A3 04 00         [ 2]  734 	cpw	x, #0x0400
      0085CA 26 05            [ 1]  735 	jrne	00102$
                                    736 ;	stm8s_clk.c: 661: tmpreg = CLK->CSSR;
      0085CC C6 50 C8         [ 1]  737 	ld	a, 0x50c8
      0085CF 20 03            [ 2]  738 	jra	00112$
      0085D1                        739 00102$:
                                    740 ;	stm8s_clk.c: 665: tmpreg = CLK->CCOR;
      0085D1 C6 50 C9         [ 1]  741 	ld	a, 0x50c9
      0085D4                        742 00112$:
                                    743 ;	stm8s_clk.c: 668: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      0085D4 88               [ 1]  744 	push	a
      0085D5 7B 06            [ 1]  745 	ld	a, (0x06, sp)
      0085D7 6B 02            [ 1]  746 	ld	(0x02, sp), a
      0085D9 84               [ 1]  747 	pop	a
      0085DA 14 01            [ 1]  748 	and	a, (0x01, sp)
      0085DC 27 03            [ 1]  749 	jreq	00114$
                                    750 ;	stm8s_clk.c: 670: bitstatus = SET;
      0085DE A6 01            [ 1]  751 	ld	a, #0x01
                                    752 ;	stm8s_clk.c: 674: bitstatus = RESET;
      0085E0 21                     753 	.byte 0x21
      0085E1                        754 00114$:
      0085E1 4F               [ 1]  755 	clr	a
      0085E2                        756 00115$:
                                    757 ;	stm8s_clk.c: 678: return((FlagStatus)bitstatus);
                                    758 ;	stm8s_clk.c: 679: }
      0085E2 5B 01            [ 2]  759 	addw	sp, #1
      0085E4 81               [ 4]  760 	ret
                                    761 ;	stm8s_clk.c: 687: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    762 ;	-----------------------------------------
                                    763 ;	 function CLK_GetITStatus
                                    764 ;	-----------------------------------------
      0085E5                        765 _CLK_GetITStatus:
                                    766 ;	stm8s_clk.c: 694: if (CLK_IT == CLK_IT_SWIF)
      0085E5 7B 03            [ 1]  767 	ld	a, (0x03, sp)
      0085E7 A1 1C            [ 1]  768 	cp	a, #0x1c
      0085E9 26 0D            [ 1]  769 	jrne	00108$
                                    770 ;	stm8s_clk.c: 697: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0085EB C6 50 C5         [ 1]  771 	ld	a, 0x50c5
      0085EE 14 03            [ 1]  772 	and	a, (0x03, sp)
                                    773 ;	stm8s_clk.c: 699: bitstatus = SET;
      0085F0 A0 0C            [ 1]  774 	sub	a, #0x0c
      0085F2 26 02            [ 1]  775 	jrne	00102$
      0085F4 4C               [ 1]  776 	inc	a
      0085F5 81               [ 4]  777 	ret
      0085F6                        778 00102$:
                                    779 ;	stm8s_clk.c: 703: bitstatus = RESET;
      0085F6 4F               [ 1]  780 	clr	a
      0085F7 81               [ 4]  781 	ret
      0085F8                        782 00108$:
                                    783 ;	stm8s_clk.c: 709: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0085F8 C6 50 C8         [ 1]  784 	ld	a, 0x50c8
      0085FB 14 03            [ 1]  785 	and	a, (0x03, sp)
                                    786 ;	stm8s_clk.c: 711: bitstatus = SET;
      0085FD A0 0C            [ 1]  787 	sub	a, #0x0c
      0085FF 26 02            [ 1]  788 	jrne	00105$
      008601 4C               [ 1]  789 	inc	a
      008602 81               [ 4]  790 	ret
      008603                        791 00105$:
                                    792 ;	stm8s_clk.c: 715: bitstatus = RESET;
      008603 4F               [ 1]  793 	clr	a
                                    794 ;	stm8s_clk.c: 720: return bitstatus;
                                    795 ;	stm8s_clk.c: 721: }
      008604 81               [ 4]  796 	ret
                                    797 ;	stm8s_clk.c: 729: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    798 ;	-----------------------------------------
                                    799 ;	 function CLK_ClearITPendingBit
                                    800 ;	-----------------------------------------
      008605                        801 _CLK_ClearITPendingBit:
                                    802 ;	stm8s_clk.c: 734: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      008605 7B 03            [ 1]  803 	ld	a, (0x03, sp)
      008607 A1 0C            [ 1]  804 	cp	a, #0x0c
      008609 26 05            [ 1]  805 	jrne	00102$
                                    806 ;	stm8s_clk.c: 737: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      00860B 72 17 50 C8      [ 1]  807 	bres	20680, #3
      00860F 81               [ 4]  808 	ret
      008610                        809 00102$:
                                    810 ;	stm8s_clk.c: 742: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      008610 72 17 50 C5      [ 1]  811 	bres	20677, #3
                                    812 ;	stm8s_clk.c: 745: }
      008614 81               [ 4]  813 	ret
                                    814 	.area CODE
                                    815 	.area CONST
      008030                        816 _HSIDivFactor:
      008030 01                     817 	.db #0x01	; 1
      008031 02                     818 	.db #0x02	; 2
      008032 04                     819 	.db #0x04	; 4
      008033 08                     820 	.db #0x08	; 8
      008034                        821 _CLKPrescTable:
      008034 01                     822 	.db #0x01	; 1
      008035 02                     823 	.db #0x02	; 2
      008036 04                     824 	.db #0x04	; 4
      008037 08                     825 	.db #0x08	; 8
      008038 0A                     826 	.db #0x0a	; 10
      008039 10                     827 	.db #0x10	; 16
      00803A 14                     828 	.db #0x14	; 20
      00803B 28                     829 	.db #0x28	; 40
                                    830 	.area INITIALIZER
                                    831 	.area CABS (ABS)
