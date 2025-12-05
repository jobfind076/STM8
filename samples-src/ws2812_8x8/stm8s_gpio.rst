                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_gpio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_DeInit
                                     12 	.globl _GPIO_Init
                                     13 	.globl _GPIO_Write
                                     14 	.globl _GPIO_WriteHigh
                                     15 	.globl _GPIO_WriteLow
                                     16 	.globl _GPIO_WriteReverse
                                     17 	.globl _GPIO_ReadOutputData
                                     18 	.globl _GPIO_ReadInputData
                                     19 	.globl _GPIO_ReadInputPin
                                     20 	.globl _GPIO_ExternalPullUpConfig
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DATA
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area INITIALIZED
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
                                     43 ; global & static initialisations
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area GSINIT
                                     49 ;--------------------------------------------------------
                                     50 ; Home
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area HOME
                                     54 ;--------------------------------------------------------
                                     55 ; code
                                     56 ;--------------------------------------------------------
                                     57 	.area CODE
                                     58 ;	stm8s_gpio.c: 53: void GPIO_DeInit(GPIO_TypeDef* GPIOx)
                                     59 ;	-----------------------------------------
                                     60 ;	 function GPIO_DeInit
                                     61 ;	-----------------------------------------
      008209                         62 _GPIO_DeInit:
                                     63 ;	stm8s_gpio.c: 55: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      008209 16 03            [ 2]   64 	ldw	y, (0x03, sp)
      00820B 90 7F            [ 1]   65 	clr	(y)
                                     66 ;	stm8s_gpio.c: 56: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      00820D 93               [ 1]   67 	ldw	x, y
      00820E 5C               [ 1]   68 	incw	x
      00820F 5C               [ 1]   69 	incw	x
      008210 7F               [ 1]   70 	clr	(x)
                                     71 ;	stm8s_gpio.c: 57: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      008211 93               [ 1]   72 	ldw	x, y
      008212 6F 03            [ 1]   73 	clr	(0x0003, x)
                                     74 ;	stm8s_gpio.c: 58: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      008214 93               [ 1]   75 	ldw	x, y
      008215 6F 04            [ 1]   76 	clr	(0x0004, x)
                                     77 ;	stm8s_gpio.c: 59: }
      008217 81               [ 4]   78 	ret
                                     79 ;	stm8s_gpio.c: 71: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     80 ;	-----------------------------------------
                                     81 ;	 function GPIO_Init
                                     82 ;	-----------------------------------------
      008218                         83 _GPIO_Init:
      008218 52 05            [ 2]   84 	sub	sp, #5
                                     85 ;	stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      00821A 16 08            [ 2]   86 	ldw	y, (0x08, sp)
      00821C 93               [ 1]   87 	ldw	x, y
      00821D 1C 00 04         [ 2]   88 	addw	x, #0x0004
      008220 1F 03            [ 2]   89 	ldw	(0x03, sp), x
      008222 F6               [ 1]   90 	ld	a, (x)
      008223 88               [ 1]   91 	push	a
      008224 7B 0B            [ 1]   92 	ld	a, (0x0b, sp)
      008226 43               [ 1]   93 	cpl	a
      008227 6B 06            [ 1]   94 	ld	(0x06, sp), a
      008229 84               [ 1]   95 	pop	a
      00822A 14 05            [ 1]   96 	and	a, (0x05, sp)
      00822C 1E 03            [ 2]   97 	ldw	x, (0x03, sp)
      00822E F7               [ 1]   98 	ld	(x), a
                                     99 ;	stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      00822F 93               [ 1]  100 	ldw	x, y
      008230 5C               [ 1]  101 	incw	x
      008231 5C               [ 1]  102 	incw	x
      008232 1F 01            [ 2]  103 	ldw	(0x01, sp), x
                                    104 ;	stm8s_gpio.c: 87: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      008234 0D 0B            [ 1]  105 	tnz	(0x0b, sp)
      008236 2A 1E            [ 1]  106 	jrpl	00105$
                                    107 ;	stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      008238 90 F6            [ 1]  108 	ld	a, (y)
                                    109 ;	stm8s_gpio.c: 89: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      00823A 88               [ 1]  110 	push	a
      00823B 7B 0C            [ 1]  111 	ld	a, (0x0c, sp)
      00823D A5 10            [ 1]  112 	bcp	a, #0x10
      00823F 84               [ 1]  113 	pop	a
      008240 27 06            [ 1]  114 	jreq	00102$
                                    115 ;	stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      008242 1A 0A            [ 1]  116 	or	a, (0x0a, sp)
      008244 90 F7            [ 1]  117 	ld	(y), a
      008246 20 04            [ 2]  118 	jra	00103$
      008248                        119 00102$:
                                    120 ;	stm8s_gpio.c: 95: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      008248 14 05            [ 1]  121 	and	a, (0x05, sp)
      00824A 90 F7            [ 1]  122 	ld	(y), a
      00824C                        123 00103$:
                                    124 ;	stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      00824C 1E 01            [ 2]  125 	ldw	x, (0x01, sp)
      00824E F6               [ 1]  126 	ld	a, (x)
      00824F 1A 0A            [ 1]  127 	or	a, (0x0a, sp)
      008251 1E 01            [ 2]  128 	ldw	x, (0x01, sp)
      008253 F7               [ 1]  129 	ld	(x), a
      008254 20 08            [ 2]  130 	jra	00106$
      008256                        131 00105$:
                                    132 ;	stm8s_gpio.c: 103: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      008256 1E 01            [ 2]  133 	ldw	x, (0x01, sp)
      008258 F6               [ 1]  134 	ld	a, (x)
      008259 14 05            [ 1]  135 	and	a, (0x05, sp)
      00825B 1E 01            [ 2]  136 	ldw	x, (0x01, sp)
      00825D F7               [ 1]  137 	ld	(x), a
      00825E                        138 00106$:
                                    139 ;	stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      00825E 93               [ 1]  140 	ldw	x, y
      00825F 1C 00 03         [ 2]  141 	addw	x, #0x0003
      008262 F6               [ 1]  142 	ld	a, (x)
                                    143 ;	stm8s_gpio.c: 110: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      008263 88               [ 1]  144 	push	a
      008264 7B 0C            [ 1]  145 	ld	a, (0x0c, sp)
      008266 A5 40            [ 1]  146 	bcp	a, #0x40
      008268 84               [ 1]  147 	pop	a
      008269 27 05            [ 1]  148 	jreq	00108$
                                    149 ;	stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      00826B 1A 0A            [ 1]  150 	or	a, (0x0a, sp)
      00826D F7               [ 1]  151 	ld	(x), a
      00826E 20 03            [ 2]  152 	jra	00109$
      008270                        153 00108$:
                                    154 ;	stm8s_gpio.c: 116: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008270 14 05            [ 1]  155 	and	a, (0x05, sp)
      008272 F7               [ 1]  156 	ld	(x), a
      008273                        157 00109$:
                                    158 ;	stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008273 1E 03            [ 2]  159 	ldw	x, (0x03, sp)
      008275 F6               [ 1]  160 	ld	a, (x)
                                    161 ;	stm8s_gpio.c: 123: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      008276 88               [ 1]  162 	push	a
      008277 7B 0C            [ 1]  163 	ld	a, (0x0c, sp)
      008279 A5 20            [ 1]  164 	bcp	a, #0x20
      00827B 84               [ 1]  165 	pop	a
      00827C 27 07            [ 1]  166 	jreq	00111$
                                    167 ;	stm8s_gpio.c: 125: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      00827E 1A 0A            [ 1]  168 	or	a, (0x0a, sp)
      008280 1E 03            [ 2]  169 	ldw	x, (0x03, sp)
      008282 F7               [ 1]  170 	ld	(x), a
      008283 20 05            [ 2]  171 	jra	00113$
      008285                        172 00111$:
                                    173 ;	stm8s_gpio.c: 129: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008285 14 05            [ 1]  174 	and	a, (0x05, sp)
      008287 1E 03            [ 2]  175 	ldw	x, (0x03, sp)
      008289 F7               [ 1]  176 	ld	(x), a
      00828A                        177 00113$:
                                    178 ;	stm8s_gpio.c: 131: }
      00828A 5B 05            [ 2]  179 	addw	sp, #5
      00828C 81               [ 4]  180 	ret
                                    181 ;	stm8s_gpio.c: 141: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    182 ;	-----------------------------------------
                                    183 ;	 function GPIO_Write
                                    184 ;	-----------------------------------------
      00828D                        185 _GPIO_Write:
                                    186 ;	stm8s_gpio.c: 143: GPIOx->ODR = PortVal;
      00828D 1E 03            [ 2]  187 	ldw	x, (0x03, sp)
      00828F 7B 05            [ 1]  188 	ld	a, (0x05, sp)
      008291 F7               [ 1]  189 	ld	(x), a
                                    190 ;	stm8s_gpio.c: 144: }
      008292 81               [ 4]  191 	ret
                                    192 ;	stm8s_gpio.c: 154: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    193 ;	-----------------------------------------
                                    194 ;	 function GPIO_WriteHigh
                                    195 ;	-----------------------------------------
      008293                        196 _GPIO_WriteHigh:
                                    197 ;	stm8s_gpio.c: 156: GPIOx->ODR |= (uint8_t)PortPins;
      008293 1E 03            [ 2]  198 	ldw	x, (0x03, sp)
      008295 F6               [ 1]  199 	ld	a, (x)
      008296 1A 05            [ 1]  200 	or	a, (0x05, sp)
      008298 F7               [ 1]  201 	ld	(x), a
                                    202 ;	stm8s_gpio.c: 157: }
      008299 81               [ 4]  203 	ret
                                    204 ;	stm8s_gpio.c: 167: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    205 ;	-----------------------------------------
                                    206 ;	 function GPIO_WriteLow
                                    207 ;	-----------------------------------------
      00829A                        208 _GPIO_WriteLow:
      00829A 88               [ 1]  209 	push	a
                                    210 ;	stm8s_gpio.c: 169: GPIOx->ODR &= (uint8_t)(~PortPins);
      00829B 1E 04            [ 2]  211 	ldw	x, (0x04, sp)
      00829D F6               [ 1]  212 	ld	a, (x)
      00829E 6B 01            [ 1]  213 	ld	(0x01, sp), a
      0082A0 7B 06            [ 1]  214 	ld	a, (0x06, sp)
      0082A2 43               [ 1]  215 	cpl	a
      0082A3 14 01            [ 1]  216 	and	a, (0x01, sp)
      0082A5 F7               [ 1]  217 	ld	(x), a
                                    218 ;	stm8s_gpio.c: 170: }
      0082A6 84               [ 1]  219 	pop	a
      0082A7 81               [ 4]  220 	ret
                                    221 ;	stm8s_gpio.c: 180: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    222 ;	-----------------------------------------
                                    223 ;	 function GPIO_WriteReverse
                                    224 ;	-----------------------------------------
      0082A8                        225 _GPIO_WriteReverse:
                                    226 ;	stm8s_gpio.c: 182: GPIOx->ODR ^= (uint8_t)PortPins;
      0082A8 1E 03            [ 2]  227 	ldw	x, (0x03, sp)
      0082AA F6               [ 1]  228 	ld	a, (x)
      0082AB 18 05            [ 1]  229 	xor	a, (0x05, sp)
      0082AD F7               [ 1]  230 	ld	(x), a
                                    231 ;	stm8s_gpio.c: 183: }
      0082AE 81               [ 4]  232 	ret
                                    233 ;	stm8s_gpio.c: 191: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    234 ;	-----------------------------------------
                                    235 ;	 function GPIO_ReadOutputData
                                    236 ;	-----------------------------------------
      0082AF                        237 _GPIO_ReadOutputData:
                                    238 ;	stm8s_gpio.c: 193: return ((uint8_t)GPIOx->ODR);
      0082AF 1E 03            [ 2]  239 	ldw	x, (0x03, sp)
      0082B1 F6               [ 1]  240 	ld	a, (x)
                                    241 ;	stm8s_gpio.c: 194: }
      0082B2 81               [ 4]  242 	ret
                                    243 ;	stm8s_gpio.c: 202: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    244 ;	-----------------------------------------
                                    245 ;	 function GPIO_ReadInputData
                                    246 ;	-----------------------------------------
      0082B3                        247 _GPIO_ReadInputData:
                                    248 ;	stm8s_gpio.c: 204: return ((uint8_t)GPIOx->IDR);
      0082B3 1E 03            [ 2]  249 	ldw	x, (0x03, sp)
      0082B5 E6 01            [ 1]  250 	ld	a, (0x1, x)
                                    251 ;	stm8s_gpio.c: 205: }
      0082B7 81               [ 4]  252 	ret
                                    253 ;	stm8s_gpio.c: 213: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    254 ;	-----------------------------------------
                                    255 ;	 function GPIO_ReadInputPin
                                    256 ;	-----------------------------------------
      0082B8                        257 _GPIO_ReadInputPin:
                                    258 ;	stm8s_gpio.c: 215: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      0082B8 1E 03            [ 2]  259 	ldw	x, (0x03, sp)
      0082BA E6 01            [ 1]  260 	ld	a, (0x1, x)
      0082BC 14 05            [ 1]  261 	and	a, (0x05, sp)
                                    262 ;	stm8s_gpio.c: 216: }
      0082BE 81               [ 4]  263 	ret
                                    264 ;	stm8s_gpio.c: 225: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    265 ;	-----------------------------------------
                                    266 ;	 function GPIO_ExternalPullUpConfig
                                    267 ;	-----------------------------------------
      0082BF                        268 _GPIO_ExternalPullUpConfig:
      0082BF 88               [ 1]  269 	push	a
                                    270 ;	stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0082C0 1E 04            [ 2]  271 	ldw	x, (0x04, sp)
      0082C2 1C 00 03         [ 2]  272 	addw	x, #0x0003
      0082C5 F6               [ 1]  273 	ld	a, (x)
                                    274 ;	stm8s_gpio.c: 231: if (NewState != DISABLE) /* External Pull-Up Set*/
      0082C6 0D 07            [ 1]  275 	tnz	(0x07, sp)
      0082C8 27 05            [ 1]  276 	jreq	00102$
                                    277 ;	stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0082CA 1A 06            [ 1]  278 	or	a, (0x06, sp)
      0082CC F7               [ 1]  279 	ld	(x), a
      0082CD 20 0A            [ 2]  280 	jra	00104$
      0082CF                        281 00102$:
                                    282 ;	stm8s_gpio.c: 236: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      0082CF 88               [ 1]  283 	push	a
      0082D0 7B 07            [ 1]  284 	ld	a, (0x07, sp)
      0082D2 43               [ 1]  285 	cpl	a
      0082D3 6B 02            [ 1]  286 	ld	(0x02, sp), a
      0082D5 84               [ 1]  287 	pop	a
      0082D6 14 01            [ 1]  288 	and	a, (0x01, sp)
      0082D8 F7               [ 1]  289 	ld	(x), a
      0082D9                        290 00104$:
                                    291 ;	stm8s_gpio.c: 238: }
      0082D9 84               [ 1]  292 	pop	a
      0082DA 81               [ 4]  293 	ret
                                    294 	.area CODE
                                    295 	.area CONST
                                    296 	.area INITIALIZER
                                    297 	.area CABS (ABS)
