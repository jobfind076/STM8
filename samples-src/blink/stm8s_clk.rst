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
      008157                         77 _CLK_DeInit:
                                     78 ;	stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008157 35 01 50 C0      [ 1]   79 	mov	0x50c0+0, #0x01
                                     80 ;	stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      00815B 35 00 50 C1      [ 1]   81 	mov	0x50c1+0, #0x00
                                     82 ;	stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      00815F 35 E1 50 C4      [ 1]   83 	mov	0x50c4+0, #0xe1
                                     84 ;	stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      008163 35 00 50 C5      [ 1]   85 	mov	0x50c5+0, #0x00
                                     86 ;	stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008167 35 18 50 C6      [ 1]   87 	mov	0x50c6+0, #0x18
                                     88 ;	stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      00816B 35 FF 50 C7      [ 1]   89 	mov	0x50c7+0, #0xff
                                     90 ;	stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      00816F 35 FF 50 CA      [ 1]   91 	mov	0x50ca+0, #0xff
                                     92 ;	stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      008173 35 00 50 C8      [ 1]   93 	mov	0x50c8+0, #0x00
                                     94 ;	stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008177 35 00 50 C9      [ 1]   95 	mov	0x50c9+0, #0x00
                                     96 ;	stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      00817B                         97 00101$:
      00817B C6 50 C9         [ 1]   98 	ld	a, 0x50c9
      00817E 44               [ 1]   99 	srl	a
      00817F 25 FA            [ 1]  100 	jrc	00101$
                                    101 ;	stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008181 35 00 50 C9      [ 1]  102 	mov	0x50c9+0, #0x00
                                    103 ;	stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008185 35 00 50 CC      [ 1]  104 	mov	0x50cc+0, #0x00
                                    105 ;	stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      008189 35 00 50 CD      [ 1]  106 	mov	0x50cd+0, #0x00
                                    107 ;	stm8s_clk.c: 88: }
      00818D 81               [ 4]  108 	ret
                                    109 ;	stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    110 ;	-----------------------------------------
                                    111 ;	 function CLK_FastHaltWakeUpCmd
                                    112 ;	-----------------------------------------
      00818E                        113 _CLK_FastHaltWakeUpCmd:
                                    114 ;	stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      00818E C6 50 C0         [ 1]  115 	ld	a, 0x50c0
                                    116 ;	stm8s_clk.c: 104: if (NewState != DISABLE)
      008191 0D 03            [ 1]  117 	tnz	(0x03, sp)
      008193 27 06            [ 1]  118 	jreq	00102$
                                    119 ;	stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      008195 AA 04            [ 1]  120 	or	a, #0x04
      008197 C7 50 C0         [ 1]  121 	ld	0x50c0, a
      00819A 81               [ 4]  122 	ret
      00819B                        123 00102$:
                                    124 ;	stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      00819B A4 FB            [ 1]  125 	and	a, #0xfb
      00819D C7 50 C0         [ 1]  126 	ld	0x50c0, a
                                    127 ;	stm8s_clk.c: 114: }
      0081A0 81               [ 4]  128 	ret
                                    129 ;	stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
                                    130 ;	-----------------------------------------
                                    131 ;	 function CLK_HSECmd
                                    132 ;	-----------------------------------------
      0081A1                        133 _CLK_HSECmd:
                                    134 ;	stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      0081A1 C6 50 C1         [ 1]  135 	ld	a, 0x50c1
                                    136 ;	stm8s_clk.c: 126: if (NewState != DISABLE)
      0081A4 0D 03            [ 1]  137 	tnz	(0x03, sp)
      0081A6 27 06            [ 1]  138 	jreq	00102$
                                    139 ;	stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      0081A8 AA 01            [ 1]  140 	or	a, #0x01
      0081AA C7 50 C1         [ 1]  141 	ld	0x50c1, a
      0081AD 81               [ 4]  142 	ret
      0081AE                        143 00102$:
                                    144 ;	stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0081AE A4 FE            [ 1]  145 	and	a, #0xfe
      0081B0 C7 50 C1         [ 1]  146 	ld	0x50c1, a
                                    147 ;	stm8s_clk.c: 136: }
      0081B3 81               [ 4]  148 	ret
                                    149 ;	stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
                                    150 ;	-----------------------------------------
                                    151 ;	 function CLK_HSICmd
                                    152 ;	-----------------------------------------
      0081B4                        153 _CLK_HSICmd:
                                    154 ;	stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      0081B4 C6 50 C0         [ 1]  155 	ld	a, 0x50c0
                                    156 ;	stm8s_clk.c: 148: if (NewState != DISABLE)
      0081B7 0D 03            [ 1]  157 	tnz	(0x03, sp)
      0081B9 27 06            [ 1]  158 	jreq	00102$
                                    159 ;	stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      0081BB AA 01            [ 1]  160 	or	a, #0x01
      0081BD C7 50 C0         [ 1]  161 	ld	0x50c0, a
      0081C0 81               [ 4]  162 	ret
      0081C1                        163 00102$:
                                    164 ;	stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0081C1 A4 FE            [ 1]  165 	and	a, #0xfe
      0081C3 C7 50 C0         [ 1]  166 	ld	0x50c0, a
                                    167 ;	stm8s_clk.c: 158: }
      0081C6 81               [ 4]  168 	ret
                                    169 ;	stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
                                    170 ;	-----------------------------------------
                                    171 ;	 function CLK_LSICmd
                                    172 ;	-----------------------------------------
      0081C7                        173 _CLK_LSICmd:
                                    174 ;	stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0081C7 C6 50 C0         [ 1]  175 	ld	a, 0x50c0
                                    176 ;	stm8s_clk.c: 171: if (NewState != DISABLE)
      0081CA 0D 03            [ 1]  177 	tnz	(0x03, sp)
      0081CC 27 06            [ 1]  178 	jreq	00102$
                                    179 ;	stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0081CE AA 08            [ 1]  180 	or	a, #0x08
      0081D0 C7 50 C0         [ 1]  181 	ld	0x50c0, a
      0081D3 81               [ 4]  182 	ret
      0081D4                        183 00102$:
                                    184 ;	stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0081D4 A4 F7            [ 1]  185 	and	a, #0xf7
      0081D6 C7 50 C0         [ 1]  186 	ld	0x50c0, a
                                    187 ;	stm8s_clk.c: 181: }
      0081D9 81               [ 4]  188 	ret
                                    189 ;	stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
                                    190 ;	-----------------------------------------
                                    191 ;	 function CLK_CCOCmd
                                    192 ;	-----------------------------------------
      0081DA                        193 _CLK_CCOCmd:
                                    194 ;	stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      0081DA C6 50 C9         [ 1]  195 	ld	a, 0x50c9
                                    196 ;	stm8s_clk.c: 194: if (NewState != DISABLE)
      0081DD 0D 03            [ 1]  197 	tnz	(0x03, sp)
      0081DF 27 06            [ 1]  198 	jreq	00102$
                                    199 ;	stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      0081E1 AA 01            [ 1]  200 	or	a, #0x01
      0081E3 C7 50 C9         [ 1]  201 	ld	0x50c9, a
      0081E6 81               [ 4]  202 	ret
      0081E7                        203 00102$:
                                    204 ;	stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      0081E7 A4 FE            [ 1]  205 	and	a, #0xfe
      0081E9 C7 50 C9         [ 1]  206 	ld	0x50c9, a
                                    207 ;	stm8s_clk.c: 204: }
      0081EC 81               [ 4]  208 	ret
                                    209 ;	stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    210 ;	-----------------------------------------
                                    211 ;	 function CLK_ClockSwitchCmd
                                    212 ;	-----------------------------------------
      0081ED                        213 _CLK_ClockSwitchCmd:
                                    214 ;	stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      0081ED C6 50 C5         [ 1]  215 	ld	a, 0x50c5
                                    216 ;	stm8s_clk.c: 218: if (NewState != DISABLE )
      0081F0 0D 03            [ 1]  217 	tnz	(0x03, sp)
      0081F2 27 06            [ 1]  218 	jreq	00102$
                                    219 ;	stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      0081F4 AA 02            [ 1]  220 	or	a, #0x02
      0081F6 C7 50 C5         [ 1]  221 	ld	0x50c5, a
      0081F9 81               [ 4]  222 	ret
      0081FA                        223 00102$:
                                    224 ;	stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      0081FA A4 FD            [ 1]  225 	and	a, #0xfd
      0081FC C7 50 C5         [ 1]  226 	ld	0x50c5, a
                                    227 ;	stm8s_clk.c: 228: }
      0081FF 81               [ 4]  228 	ret
                                    229 ;	stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    232 ;	-----------------------------------------
      008200                        233 _CLK_SlowActiveHaltWakeUpCmd:
                                    234 ;	stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      008200 C6 50 C0         [ 1]  235 	ld	a, 0x50c0
                                    236 ;	stm8s_clk.c: 243: if (NewState != DISABLE)
      008203 0D 03            [ 1]  237 	tnz	(0x03, sp)
      008205 27 06            [ 1]  238 	jreq	00102$
                                    239 ;	stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      008207 AA 20            [ 1]  240 	or	a, #0x20
      008209 C7 50 C0         [ 1]  241 	ld	0x50c0, a
      00820C 81               [ 4]  242 	ret
      00820D                        243 00102$:
                                    244 ;	stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      00820D A4 DF            [ 1]  245 	and	a, #0xdf
      00820F C7 50 C0         [ 1]  246 	ld	0x50c0, a
                                    247 ;	stm8s_clk.c: 253: }
      008212 81               [ 4]  248 	ret
                                    249 ;	stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    250 ;	-----------------------------------------
                                    251 ;	 function CLK_PeripheralClockConfig
                                    252 ;	-----------------------------------------
      008213                        253 _CLK_PeripheralClockConfig:
      008213 89               [ 2]  254 	pushw	x
                                    255 ;	stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008214 7B 05            [ 1]  256 	ld	a, (0x05, sp)
      008216 A4 0F            [ 1]  257 	and	a, #0x0f
      008218 88               [ 1]  258 	push	a
      008219 A6 01            [ 1]  259 	ld	a, #0x01
      00821B 6B 03            [ 1]  260 	ld	(0x03, sp), a
      00821D 84               [ 1]  261 	pop	a
      00821E 4D               [ 1]  262 	tnz	a
      00821F 27 05            [ 1]  263 	jreq	00128$
      008221                        264 00127$:
      008221 08 02            [ 1]  265 	sll	(0x02, sp)
      008223 4A               [ 1]  266 	dec	a
      008224 26 FB            [ 1]  267 	jrne	00127$
      008226                        268 00128$:
                                    269 ;	stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008226 7B 02            [ 1]  270 	ld	a, (0x02, sp)
      008228 43               [ 1]  271 	cpl	a
      008229 6B 01            [ 1]  272 	ld	(0x01, sp), a
                                    273 ;	stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      00822B 7B 05            [ 1]  274 	ld	a, (0x05, sp)
      00822D A5 10            [ 1]  275 	bcp	a, #0x10
      00822F 26 15            [ 1]  276 	jrne	00108$
                                    277 ;	stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008231 C6 50 C7         [ 1]  278 	ld	a, 0x50c7
                                    279 ;	stm8s_clk.c: 271: if (NewState != DISABLE)
      008234 0D 06            [ 1]  280 	tnz	(0x06, sp)
      008236 27 07            [ 1]  281 	jreq	00102$
                                    282 ;	stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008238 1A 02            [ 1]  283 	or	a, (0x02, sp)
      00823A C7 50 C7         [ 1]  284 	ld	0x50c7, a
      00823D 20 1A            [ 2]  285 	jra	00110$
      00823F                        286 00102$:
                                    287 ;	stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00823F 14 01            [ 1]  288 	and	a, (0x01, sp)
      008241 C7 50 C7         [ 1]  289 	ld	0x50c7, a
      008244 20 13            [ 2]  290 	jra	00110$
      008246                        291 00108$:
                                    292 ;	stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008246 C6 50 CA         [ 1]  293 	ld	a, 0x50ca
                                    294 ;	stm8s_clk.c: 284: if (NewState != DISABLE)
      008249 0D 06            [ 1]  295 	tnz	(0x06, sp)
      00824B 27 07            [ 1]  296 	jreq	00105$
                                    297 ;	stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00824D 1A 02            [ 1]  298 	or	a, (0x02, sp)
      00824F C7 50 CA         [ 1]  299 	ld	0x50ca, a
      008252 20 05            [ 2]  300 	jra	00110$
      008254                        301 00105$:
                                    302 ;	stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008254 14 01            [ 1]  303 	and	a, (0x01, sp)
      008256 C7 50 CA         [ 1]  304 	ld	0x50ca, a
      008259                        305 00110$:
                                    306 ;	stm8s_clk.c: 295: }
      008259 85               [ 2]  307 	popw	x
      00825A 81               [ 4]  308 	ret
                                    309 ;	stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    310 ;	-----------------------------------------
                                    311 ;	 function CLK_ClockSwitchConfig
                                    312 ;	-----------------------------------------
      00825B                        313 _CLK_ClockSwitchConfig:
                                    314 ;	stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      00825B C6 50 C3         [ 1]  315 	ld	a, 0x50c3
      00825E 90 97            [ 1]  316 	ld	yl, a
                                    317 ;	stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      008260 C6 50 C5         [ 1]  318 	ld	a, 0x50c5
                                    319 ;	stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      008263 88               [ 1]  320 	push	a
      008264 7B 04            [ 1]  321 	ld	a, (0x04, sp)
      008266 4A               [ 1]  322 	dec	a
      008267 84               [ 1]  323 	pop	a
      008268 26 38            [ 1]  324 	jrne	00122$
                                    325 ;	stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      00826A AA 02            [ 1]  326 	or	a, #0x02
      00826C C7 50 C5         [ 1]  327 	ld	0x50c5, a
      00826F C6 50 C5         [ 1]  328 	ld	a, 0x50c5
                                    329 ;	stm8s_clk.c: 331: if (ITState != DISABLE)
      008272 0D 05            [ 1]  330 	tnz	(0x05, sp)
      008274 27 07            [ 1]  331 	jreq	00102$
                                    332 ;	stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
      008276 AA 04            [ 1]  333 	or	a, #0x04
      008278 C7 50 C5         [ 1]  334 	ld	0x50c5, a
      00827B 20 05            [ 2]  335 	jra	00103$
      00827D                        336 00102$:
                                    337 ;	stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      00827D A4 FB            [ 1]  338 	and	a, #0xfb
      00827F C7 50 C5         [ 1]  339 	ld	0x50c5, a
      008282                        340 00103$:
                                    341 ;	stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
      008282 AE 50 C4         [ 2]  342 	ldw	x, #0x50c4
      008285 7B 04            [ 1]  343 	ld	a, (0x04, sp)
      008287 F7               [ 1]  344 	ld	(x), a
                                    345 ;	stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      008288 5F               [ 1]  346 	clrw	x
      008289 5A               [ 2]  347 	decw	x
      00828A                        348 00105$:
      00828A C6 50 C5         [ 1]  349 	ld	a, 0x50c5
      00828D 44               [ 1]  350 	srl	a
      00828E 24 06            [ 1]  351 	jrnc	00107$
      008290 5D               [ 2]  352 	tnzw	x
      008291 27 03            [ 1]  353 	jreq	00107$
                                    354 ;	stm8s_clk.c: 346: DownCounter--;
      008293 5A               [ 2]  355 	decw	x
      008294 20 F4            [ 2]  356 	jra	00105$
      008296                        357 00107$:
                                    358 ;	stm8s_clk.c: 349: if(DownCounter != 0)
      008296 5D               [ 2]  359 	tnzw	x
      008297 27 05            [ 1]  360 	jreq	00109$
                                    361 ;	stm8s_clk.c: 351: Swif = SUCCESS;
      008299 A6 01            [ 1]  362 	ld	a, #0x01
      00829B 97               [ 1]  363 	ld	xl, a
      00829C 20 37            [ 2]  364 	jra	00123$
      00829E                        365 00109$:
                                    366 ;	stm8s_clk.c: 355: Swif = ERROR;
      00829E 4F               [ 1]  367 	clr	a
      00829F 97               [ 1]  368 	ld	xl, a
      0082A0 20 33            [ 2]  369 	jra	00123$
      0082A2                        370 00122$:
                                    371 ;	stm8s_clk.c: 361: if (ITState != DISABLE)
      0082A2 0D 05            [ 1]  372 	tnz	(0x05, sp)
      0082A4 27 07            [ 1]  373 	jreq	00112$
                                    374 ;	stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
      0082A6 AA 04            [ 1]  375 	or	a, #0x04
      0082A8 C7 50 C5         [ 1]  376 	ld	0x50c5, a
      0082AB 20 05            [ 2]  377 	jra	00113$
      0082AD                        378 00112$:
                                    379 ;	stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0082AD A4 FB            [ 1]  380 	and	a, #0xfb
      0082AF C7 50 C5         [ 1]  381 	ld	0x50c5, a
      0082B2                        382 00113$:
                                    383 ;	stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
      0082B2 AE 50 C4         [ 2]  384 	ldw	x, #0x50c4
      0082B5 7B 04            [ 1]  385 	ld	a, (0x04, sp)
      0082B7 F7               [ 1]  386 	ld	(x), a
                                    387 ;	stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      0082B8 5F               [ 1]  388 	clrw	x
      0082B9 5A               [ 2]  389 	decw	x
      0082BA                        390 00115$:
      0082BA C6 50 C5         [ 1]  391 	ld	a, 0x50c5
      0082BD A5 08            [ 1]  392 	bcp	a, #0x08
      0082BF 27 06            [ 1]  393 	jreq	00117$
      0082C1 5D               [ 2]  394 	tnzw	x
      0082C2 27 03            [ 1]  395 	jreq	00117$
                                    396 ;	stm8s_clk.c: 376: DownCounter--;
      0082C4 5A               [ 2]  397 	decw	x
      0082C5 20 F3            [ 2]  398 	jra	00115$
      0082C7                        399 00117$:
                                    400 ;	stm8s_clk.c: 379: if(DownCounter != 0)
      0082C7 5D               [ 2]  401 	tnzw	x
      0082C8 27 09            [ 1]  402 	jreq	00119$
                                    403 ;	stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
      0082CA 72 12 50 C5      [ 1]  404 	bset	20677, #1
                                    405 ;	stm8s_clk.c: 383: Swif = SUCCESS;
      0082CE A6 01            [ 1]  406 	ld	a, #0x01
      0082D0 97               [ 1]  407 	ld	xl, a
      0082D1 20 02            [ 2]  408 	jra	00123$
      0082D3                        409 00119$:
                                    410 ;	stm8s_clk.c: 387: Swif = ERROR;
      0082D3 4F               [ 1]  411 	clr	a
      0082D4 97               [ 1]  412 	ld	xl, a
      0082D5                        413 00123$:
                                    414 ;	stm8s_clk.c: 390: if(Swif != ERROR)
      0082D5 9F               [ 1]  415 	ld	a, xl
      0082D6 4D               [ 1]  416 	tnz	a
      0082D7 27 2E            [ 1]  417 	jreq	00136$
                                    418 ;	stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      0082D9 0D 06            [ 1]  419 	tnz	(0x06, sp)
      0082DB 26 0C            [ 1]  420 	jrne	00132$
      0082DD 90 9F            [ 1]  421 	ld	a, yl
      0082DF A1 E1            [ 1]  422 	cp	a, #0xe1
      0082E1 26 06            [ 1]  423 	jrne	00132$
                                    424 ;	stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0082E3 72 11 50 C0      [ 1]  425 	bres	20672, #0
      0082E7 20 1E            [ 2]  426 	jra	00136$
      0082E9                        427 00132$:
                                    428 ;	stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      0082E9 0D 06            [ 1]  429 	tnz	(0x06, sp)
      0082EB 26 0C            [ 1]  430 	jrne	00128$
      0082ED 90 9F            [ 1]  431 	ld	a, yl
      0082EF A1 D2            [ 1]  432 	cp	a, #0xd2
      0082F1 26 06            [ 1]  433 	jrne	00128$
                                    434 ;	stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0082F3 72 17 50 C0      [ 1]  435 	bres	20672, #3
      0082F7 20 0E            [ 2]  436 	jra	00136$
      0082F9                        437 00128$:
                                    438 ;	stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      0082F9 0D 06            [ 1]  439 	tnz	(0x06, sp)
      0082FB 26 0A            [ 1]  440 	jrne	00136$
      0082FD 90 9F            [ 1]  441 	ld	a, yl
      0082FF A1 B4            [ 1]  442 	cp	a, #0xb4
      008301 26 04            [ 1]  443 	jrne	00136$
                                    444 ;	stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008303 72 11 50 C1      [ 1]  445 	bres	20673, #0
      008307                        446 00136$:
                                    447 ;	stm8s_clk.c: 406: return(Swif);
      008307 9F               [ 1]  448 	ld	a, xl
                                    449 ;	stm8s_clk.c: 407: }
      008308 81               [ 4]  450 	ret
                                    451 ;	stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    452 ;	-----------------------------------------
                                    453 ;	 function CLK_HSIPrescalerConfig
                                    454 ;	-----------------------------------------
      008309                        455 _CLK_HSIPrescalerConfig:
                                    456 ;	stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008309 C6 50 C6         [ 1]  457 	ld	a, 0x50c6
      00830C A4 E7            [ 1]  458 	and	a, #0xe7
      00830E C7 50 C6         [ 1]  459 	ld	0x50c6, a
                                    460 ;	stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      008311 C6 50 C6         [ 1]  461 	ld	a, 0x50c6
      008314 1A 03            [ 1]  462 	or	a, (0x03, sp)
      008316 C7 50 C6         [ 1]  463 	ld	0x50c6, a
                                    464 ;	stm8s_clk.c: 425: }
      008319 81               [ 4]  465 	ret
                                    466 ;	stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    467 ;	-----------------------------------------
                                    468 ;	 function CLK_CCOConfig
                                    469 ;	-----------------------------------------
      00831A                        470 _CLK_CCOConfig:
                                    471 ;	stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      00831A C6 50 C9         [ 1]  472 	ld	a, 0x50c9
      00831D A4 E1            [ 1]  473 	and	a, #0xe1
      00831F C7 50 C9         [ 1]  474 	ld	0x50c9, a
                                    475 ;	stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
      008322 C6 50 C9         [ 1]  476 	ld	a, 0x50c9
      008325 1A 03            [ 1]  477 	or	a, (0x03, sp)
      008327 C7 50 C9         [ 1]  478 	ld	0x50c9, a
                                    479 ;	stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
      00832A 72 10 50 C9      [ 1]  480 	bset	20681, #0
                                    481 ;	stm8s_clk.c: 449: }
      00832E 81               [ 4]  482 	ret
                                    483 ;	stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    484 ;	-----------------------------------------
                                    485 ;	 function CLK_ITConfig
                                    486 ;	-----------------------------------------
      00832F                        487 _CLK_ITConfig:
      00832F 88               [ 1]  488 	push	a
                                    489 ;	stm8s_clk.c: 467: switch (CLK_IT)
      008330 7B 04            [ 1]  490 	ld	a, (0x04, sp)
      008332 A0 0C            [ 1]  491 	sub	a, #0x0c
      008334 26 04            [ 1]  492 	jrne	00140$
      008336 4C               [ 1]  493 	inc	a
      008337 6B 01            [ 1]  494 	ld	(0x01, sp), a
      008339 C1                     495 	.byte 0xc1
      00833A                        496 00140$:
      00833A 0F 01            [ 1]  497 	clr	(0x01, sp)
      00833C                        498 00141$:
      00833C 7B 04            [ 1]  499 	ld	a, (0x04, sp)
      00833E A0 1C            [ 1]  500 	sub	a, #0x1c
      008340 26 02            [ 1]  501 	jrne	00143$
      008342 4C               [ 1]  502 	inc	a
      008343 21                     503 	.byte 0x21
      008344                        504 00143$:
      008344 4F               [ 1]  505 	clr	a
      008345                        506 00144$:
                                    507 ;	stm8s_clk.c: 465: if (NewState != DISABLE)
      008345 0D 05            [ 1]  508 	tnz	(0x05, sp)
      008347 27 13            [ 1]  509 	jreq	00110$
                                    510 ;	stm8s_clk.c: 467: switch (CLK_IT)
      008349 0D 01            [ 1]  511 	tnz	(0x01, sp)
      00834B 26 09            [ 1]  512 	jrne	00102$
      00834D 4D               [ 1]  513 	tnz	a
      00834E 27 1D            [ 1]  514 	jreq	00112$
                                    515 ;	stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
      008350 72 14 50 C5      [ 1]  516 	bset	20677, #2
                                    517 ;	stm8s_clk.c: 471: break;
      008354 20 17            [ 2]  518 	jra	00112$
                                    519 ;	stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      008356                        520 00102$:
                                    521 ;	stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
      008356 72 14 50 C8      [ 1]  522 	bset	20680, #2
                                    523 ;	stm8s_clk.c: 474: break;
      00835A 20 11            [ 2]  524 	jra	00112$
                                    525 ;	stm8s_clk.c: 477: }
      00835C                        526 00110$:
                                    527 ;	stm8s_clk.c: 481: switch (CLK_IT)
      00835C 0D 01            [ 1]  528 	tnz	(0x01, sp)
      00835E 26 09            [ 1]  529 	jrne	00106$
      008360 4D               [ 1]  530 	tnz	a
      008361 27 0A            [ 1]  531 	jreq	00112$
                                    532 ;	stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      008363 72 15 50 C5      [ 1]  533 	bres	20677, #2
                                    534 ;	stm8s_clk.c: 485: break;
      008367 20 04            [ 2]  535 	jra	00112$
                                    536 ;	stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      008369                        537 00106$:
                                    538 ;	stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      008369 72 15 50 C8      [ 1]  539 	bres	20680, #2
                                    540 ;	stm8s_clk.c: 491: }
      00836D                        541 00112$:
                                    542 ;	stm8s_clk.c: 493: }
      00836D 84               [ 1]  543 	pop	a
      00836E 81               [ 4]  544 	ret
                                    545 ;	stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    546 ;	-----------------------------------------
                                    547 ;	 function CLK_SYSCLKConfig
                                    548 ;	-----------------------------------------
      00836F                        549 _CLK_SYSCLKConfig:
      00836F 89               [ 2]  550 	pushw	x
                                    551 ;	stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008370 C6 50 C6         [ 1]  552 	ld	a, 0x50c6
                                    553 ;	stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      008373 0D 05            [ 1]  554 	tnz	(0x05, sp)
      008375 2B 15            [ 1]  555 	jrmi	00102$
                                    556 ;	stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008377 A4 E7            [ 1]  557 	and	a, #0xe7
      008379 C7 50 C6         [ 1]  558 	ld	0x50c6, a
                                    559 ;	stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      00837C C6 50 C6         [ 1]  560 	ld	a, 0x50c6
      00837F 6B 02            [ 1]  561 	ld	(0x02, sp), a
      008381 7B 05            [ 1]  562 	ld	a, (0x05, sp)
      008383 A4 18            [ 1]  563 	and	a, #0x18
      008385 1A 02            [ 1]  564 	or	a, (0x02, sp)
      008387 C7 50 C6         [ 1]  565 	ld	0x50c6, a
      00838A 20 13            [ 2]  566 	jra	00104$
      00838C                        567 00102$:
                                    568 ;	stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      00838C A4 F8            [ 1]  569 	and	a, #0xf8
      00838E C7 50 C6         [ 1]  570 	ld	0x50c6, a
                                    571 ;	stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      008391 C6 50 C6         [ 1]  572 	ld	a, 0x50c6
      008394 6B 01            [ 1]  573 	ld	(0x01, sp), a
      008396 7B 05            [ 1]  574 	ld	a, (0x05, sp)
      008398 A4 07            [ 1]  575 	and	a, #0x07
      00839A 1A 01            [ 1]  576 	or	a, (0x01, sp)
      00839C C7 50 C6         [ 1]  577 	ld	0x50c6, a
      00839F                        578 00104$:
                                    579 ;	stm8s_clk.c: 515: }
      00839F 85               [ 2]  580 	popw	x
      0083A0 81               [ 4]  581 	ret
                                    582 ;	stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    583 ;	-----------------------------------------
                                    584 ;	 function CLK_SWIMConfig
                                    585 ;	-----------------------------------------
      0083A1                        586 _CLK_SWIMConfig:
                                    587 ;	stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      0083A1 C6 50 CD         [ 1]  588 	ld	a, 0x50cd
                                    589 ;	stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      0083A4 0D 03            [ 1]  590 	tnz	(0x03, sp)
      0083A6 27 06            [ 1]  591 	jreq	00102$
                                    592 ;	stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      0083A8 AA 01            [ 1]  593 	or	a, #0x01
      0083AA C7 50 CD         [ 1]  594 	ld	0x50cd, a
      0083AD 81               [ 4]  595 	ret
      0083AE                        596 00102$:
                                    597 ;	stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      0083AE A4 FE            [ 1]  598 	and	a, #0xfe
      0083B0 C7 50 CD         [ 1]  599 	ld	0x50cd, a
                                    600 ;	stm8s_clk.c: 538: }
      0083B3 81               [ 4]  601 	ret
                                    602 ;	stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
                                    603 ;	-----------------------------------------
                                    604 ;	 function CLK_ClockSecuritySystemEnable
                                    605 ;	-----------------------------------------
      0083B4                        606 _CLK_ClockSecuritySystemEnable:
                                    607 ;	stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
      0083B4 72 10 50 C8      [ 1]  608 	bset	20680, #0
                                    609 ;	stm8s_clk.c: 551: }
      0083B8 81               [ 4]  610 	ret
                                    611 ;	stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    612 ;	-----------------------------------------
                                    613 ;	 function CLK_GetSYSCLKSource
                                    614 ;	-----------------------------------------
      0083B9                        615 _CLK_GetSYSCLKSource:
                                    616 ;	stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
      0083B9 C6 50 C3         [ 1]  617 	ld	a, 0x50c3
                                    618 ;	stm8s_clk.c: 562: }
      0083BC 81               [ 4]  619 	ret
                                    620 ;	stm8s_clk.c: 569: uint32_t CLK_GetClockFreq(void)
                                    621 ;	-----------------------------------------
                                    622 ;	 function CLK_GetClockFreq
                                    623 ;	-----------------------------------------
      0083BD                        624 _CLK_GetClockFreq:
      0083BD 52 05            [ 2]  625 	sub	sp, #5
                                    626 ;	stm8s_clk.c: 576: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      0083BF C6 50 C3         [ 1]  627 	ld	a, 0x50c3
      0083C2 6B 01            [ 1]  628 	ld	(0x01, sp), a
                                    629 ;	stm8s_clk.c: 578: if (clocksource == CLK_SOURCE_HSI)
      0083C4 7B 01            [ 1]  630 	ld	a, (0x01, sp)
      0083C6 A1 E1            [ 1]  631 	cp	a, #0xe1
      0083C8 26 26            [ 1]  632 	jrne	00105$
                                    633 ;	stm8s_clk.c: 580: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      0083CA C6 50 C6         [ 1]  634 	ld	a, 0x50c6
      0083CD A4 18            [ 1]  635 	and	a, #0x18
                                    636 ;	stm8s_clk.c: 581: tmp = (uint8_t)(tmp >> 3);
      0083CF 44               [ 1]  637 	srl	a
      0083D0 44               [ 1]  638 	srl	a
      0083D1 44               [ 1]  639 	srl	a
                                    640 ;	stm8s_clk.c: 582: presc = HSIDivFactor[tmp];
      0083D2 5F               [ 1]  641 	clrw	x
      0083D3 97               [ 1]  642 	ld	xl, a
      0083D4 1C 80 24         [ 2]  643 	addw	x, #_HSIDivFactor
      0083D7 F6               [ 1]  644 	ld	a, (x)
                                    645 ;	stm8s_clk.c: 583: clockfrequency = HSI_VALUE / presc;
      0083D8 5F               [ 1]  646 	clrw	x
      0083D9 97               [ 1]  647 	ld	xl, a
      0083DA 90 5F            [ 1]  648 	clrw	y
      0083DC 89               [ 2]  649 	pushw	x
      0083DD 90 89            [ 2]  650 	pushw	y
      0083DF 4B 00            [ 1]  651 	push	#0x00
      0083E1 4B 24            [ 1]  652 	push	#0x24
      0083E3 4B F4            [ 1]  653 	push	#0xf4
      0083E5 4B 00            [ 1]  654 	push	#0x00
      0083E7 CD 85 05         [ 4]  655 	call	__divulong
      0083EA 5B 08            [ 2]  656 	addw	sp, #8
      0083EC 1F 04            [ 2]  657 	ldw	(0x04, sp), x
      0083EE 20 1A            [ 2]  658 	jra	00106$
      0083F0                        659 00105$:
                                    660 ;	stm8s_clk.c: 585: else if ( clocksource == CLK_SOURCE_LSI)
      0083F0 7B 01            [ 1]  661 	ld	a, (0x01, sp)
      0083F2 A1 D2            [ 1]  662 	cp	a, #0xd2
      0083F4 26 0B            [ 1]  663 	jrne	00102$
                                    664 ;	stm8s_clk.c: 587: clockfrequency = LSI_VALUE;
      0083F6 AE F4 00         [ 2]  665 	ldw	x, #0xf400
      0083F9 1F 04            [ 2]  666 	ldw	(0x04, sp), x
      0083FB 90 AE 00 01      [ 2]  667 	ldw	y, #0x0001
      0083FF 20 09            [ 2]  668 	jra	00106$
      008401                        669 00102$:
                                    670 ;	stm8s_clk.c: 591: clockfrequency = HSE_VALUE;
      008401 AE 24 00         [ 2]  671 	ldw	x, #0x2400
      008404 1F 04            [ 2]  672 	ldw	(0x04, sp), x
      008406 90 AE 00 F4      [ 2]  673 	ldw	y, #0x00f4
      00840A                        674 00106$:
                                    675 ;	stm8s_clk.c: 594: return((uint32_t)clockfrequency);
      00840A 1E 04            [ 2]  676 	ldw	x, (0x04, sp)
                                    677 ;	stm8s_clk.c: 595: }
      00840C 5B 05            [ 2]  678 	addw	sp, #5
      00840E 81               [ 4]  679 	ret
                                    680 ;	stm8s_clk.c: 604: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    681 ;	-----------------------------------------
                                    682 ;	 function CLK_AdjustHSICalibrationValue
                                    683 ;	-----------------------------------------
      00840F                        684 _CLK_AdjustHSICalibrationValue:
                                    685 ;	stm8s_clk.c: 610: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      00840F C6 50 CC         [ 1]  686 	ld	a, 0x50cc
      008412 A4 F8            [ 1]  687 	and	a, #0xf8
      008414 1A 03            [ 1]  688 	or	a, (0x03, sp)
      008416 C7 50 CC         [ 1]  689 	ld	0x50cc, a
                                    690 ;	stm8s_clk.c: 611: }
      008419 81               [ 4]  691 	ret
                                    692 ;	stm8s_clk.c: 622: void CLK_SYSCLKEmergencyClear(void)
                                    693 ;	-----------------------------------------
                                    694 ;	 function CLK_SYSCLKEmergencyClear
                                    695 ;	-----------------------------------------
      00841A                        696 _CLK_SYSCLKEmergencyClear:
                                    697 ;	stm8s_clk.c: 624: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      00841A 72 11 50 C5      [ 1]  698 	bres	20677, #0
                                    699 ;	stm8s_clk.c: 625: }
      00841E 81               [ 4]  700 	ret
                                    701 ;	stm8s_clk.c: 634: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    702 ;	-----------------------------------------
                                    703 ;	 function CLK_GetFlagStatus
                                    704 ;	-----------------------------------------
      00841F                        705 _CLK_GetFlagStatus:
      00841F 88               [ 1]  706 	push	a
                                    707 ;	stm8s_clk.c: 644: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      008420 4F               [ 1]  708 	clr	a
      008421 97               [ 1]  709 	ld	xl, a
      008422 7B 04            [ 1]  710 	ld	a, (0x04, sp)
      008424 95               [ 1]  711 	ld	xh, a
                                    712 ;	stm8s_clk.c: 647: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      008425 A3 01 00         [ 2]  713 	cpw	x, #0x0100
      008428 26 05            [ 1]  714 	jrne	00111$
                                    715 ;	stm8s_clk.c: 649: tmpreg = CLK->ICKR;
      00842A C6 50 C0         [ 1]  716 	ld	a, 0x50c0
      00842D 20 21            [ 2]  717 	jra	00112$
      00842F                        718 00111$:
                                    719 ;	stm8s_clk.c: 651: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      00842F A3 02 00         [ 2]  720 	cpw	x, #0x0200
      008432 26 05            [ 1]  721 	jrne	00108$
                                    722 ;	stm8s_clk.c: 653: tmpreg = CLK->ECKR;
      008434 C6 50 C1         [ 1]  723 	ld	a, 0x50c1
      008437 20 17            [ 2]  724 	jra	00112$
      008439                        725 00108$:
                                    726 ;	stm8s_clk.c: 655: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      008439 A3 03 00         [ 2]  727 	cpw	x, #0x0300
      00843C 26 05            [ 1]  728 	jrne	00105$
                                    729 ;	stm8s_clk.c: 657: tmpreg = CLK->SWCR;
      00843E C6 50 C5         [ 1]  730 	ld	a, 0x50c5
      008441 20 0D            [ 2]  731 	jra	00112$
      008443                        732 00105$:
                                    733 ;	stm8s_clk.c: 659: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      008443 A3 04 00         [ 2]  734 	cpw	x, #0x0400
      008446 26 05            [ 1]  735 	jrne	00102$
                                    736 ;	stm8s_clk.c: 661: tmpreg = CLK->CSSR;
      008448 C6 50 C8         [ 1]  737 	ld	a, 0x50c8
      00844B 20 03            [ 2]  738 	jra	00112$
      00844D                        739 00102$:
                                    740 ;	stm8s_clk.c: 665: tmpreg = CLK->CCOR;
      00844D C6 50 C9         [ 1]  741 	ld	a, 0x50c9
      008450                        742 00112$:
                                    743 ;	stm8s_clk.c: 668: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      008450 88               [ 1]  744 	push	a
      008451 7B 06            [ 1]  745 	ld	a, (0x06, sp)
      008453 6B 02            [ 1]  746 	ld	(0x02, sp), a
      008455 84               [ 1]  747 	pop	a
      008456 14 01            [ 1]  748 	and	a, (0x01, sp)
      008458 27 03            [ 1]  749 	jreq	00114$
                                    750 ;	stm8s_clk.c: 670: bitstatus = SET;
      00845A A6 01            [ 1]  751 	ld	a, #0x01
                                    752 ;	stm8s_clk.c: 674: bitstatus = RESET;
      00845C 21                     753 	.byte 0x21
      00845D                        754 00114$:
      00845D 4F               [ 1]  755 	clr	a
      00845E                        756 00115$:
                                    757 ;	stm8s_clk.c: 678: return((FlagStatus)bitstatus);
                                    758 ;	stm8s_clk.c: 679: }
      00845E 5B 01            [ 2]  759 	addw	sp, #1
      008460 81               [ 4]  760 	ret
                                    761 ;	stm8s_clk.c: 687: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    762 ;	-----------------------------------------
                                    763 ;	 function CLK_GetITStatus
                                    764 ;	-----------------------------------------
      008461                        765 _CLK_GetITStatus:
                                    766 ;	stm8s_clk.c: 694: if (CLK_IT == CLK_IT_SWIF)
      008461 7B 03            [ 1]  767 	ld	a, (0x03, sp)
      008463 A1 1C            [ 1]  768 	cp	a, #0x1c
      008465 26 0D            [ 1]  769 	jrne	00108$
                                    770 ;	stm8s_clk.c: 697: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008467 C6 50 C5         [ 1]  771 	ld	a, 0x50c5
      00846A 14 03            [ 1]  772 	and	a, (0x03, sp)
                                    773 ;	stm8s_clk.c: 699: bitstatus = SET;
      00846C A0 0C            [ 1]  774 	sub	a, #0x0c
      00846E 26 02            [ 1]  775 	jrne	00102$
      008470 4C               [ 1]  776 	inc	a
      008471 81               [ 4]  777 	ret
      008472                        778 00102$:
                                    779 ;	stm8s_clk.c: 703: bitstatus = RESET;
      008472 4F               [ 1]  780 	clr	a
      008473 81               [ 4]  781 	ret
      008474                        782 00108$:
                                    783 ;	stm8s_clk.c: 709: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008474 C6 50 C8         [ 1]  784 	ld	a, 0x50c8
      008477 14 03            [ 1]  785 	and	a, (0x03, sp)
                                    786 ;	stm8s_clk.c: 711: bitstatus = SET;
      008479 A0 0C            [ 1]  787 	sub	a, #0x0c
      00847B 26 02            [ 1]  788 	jrne	00105$
      00847D 4C               [ 1]  789 	inc	a
      00847E 81               [ 4]  790 	ret
      00847F                        791 00105$:
                                    792 ;	stm8s_clk.c: 715: bitstatus = RESET;
      00847F 4F               [ 1]  793 	clr	a
                                    794 ;	stm8s_clk.c: 720: return bitstatus;
                                    795 ;	stm8s_clk.c: 721: }
      008480 81               [ 4]  796 	ret
                                    797 ;	stm8s_clk.c: 729: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    798 ;	-----------------------------------------
                                    799 ;	 function CLK_ClearITPendingBit
                                    800 ;	-----------------------------------------
      008481                        801 _CLK_ClearITPendingBit:
                                    802 ;	stm8s_clk.c: 734: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      008481 7B 03            [ 1]  803 	ld	a, (0x03, sp)
      008483 A1 0C            [ 1]  804 	cp	a, #0x0c
      008485 26 05            [ 1]  805 	jrne	00102$
                                    806 ;	stm8s_clk.c: 737: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      008487 72 17 50 C8      [ 1]  807 	bres	20680, #3
      00848B 81               [ 4]  808 	ret
      00848C                        809 00102$:
                                    810 ;	stm8s_clk.c: 742: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      00848C 72 17 50 C5      [ 1]  811 	bres	20677, #3
                                    812 ;	stm8s_clk.c: 745: }
      008490 81               [ 4]  813 	ret
                                    814 	.area CODE
                                    815 	.area CONST
      008024                        816 _HSIDivFactor:
      008024 01                     817 	.db #0x01	; 1
      008025 02                     818 	.db #0x02	; 2
      008026 04                     819 	.db #0x04	; 4
      008027 08                     820 	.db #0x08	; 8
      008028                        821 _CLKPrescTable:
      008028 01                     822 	.db #0x01	; 1
      008029 02                     823 	.db #0x02	; 2
      00802A 04                     824 	.db #0x04	; 4
      00802B 08                     825 	.db #0x08	; 8
      00802C 0A                     826 	.db #0x0a	; 10
      00802D 10                     827 	.db #0x10	; 16
      00802E 14                     828 	.db #0x14	; 20
      00802F 28                     829 	.db #0x28	; 40
                                    830 	.area INITIALIZER
                                    831 	.area CABS (ABS)
