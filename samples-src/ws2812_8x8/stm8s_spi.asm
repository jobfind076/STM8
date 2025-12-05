;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module stm8s_spi
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SPI_DeInit
	.globl _SPI_Init
	.globl _SPI_Cmd
	.globl _SPI_ITConfig
	.globl _SPI_SendData
	.globl _SPI_ReceiveData
	.globl _SPI_NSSInternalSoftwareCmd
	.globl _SPI_TransmitCRC
	.globl _SPI_CalculateCRCCmd
	.globl _SPI_GetCRC
	.globl _SPI_ResetCRC
	.globl _SPI_GetCRCPolynomial
	.globl _SPI_BiDirectionalLineConfig
	.globl _SPI_GetFlagStatus
	.globl _SPI_ClearFlag
	.globl _SPI_GetITStatus
	.globl _SPI_ClearITPendingBit
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	stm8s_spi.c: 50: void SPI_DeInit(void)
;	-----------------------------------------
;	 function SPI_DeInit
;	-----------------------------------------
_SPI_DeInit:
;	stm8s_spi.c: 52: SPI->CR1    = SPI_CR1_RESET_VALUE;
	mov	0x5200+0, #0x00
;	stm8s_spi.c: 53: SPI->CR2    = SPI_CR2_RESET_VALUE;
	mov	0x5201+0, #0x00
;	stm8s_spi.c: 54: SPI->ICR    = SPI_ICR_RESET_VALUE;
	mov	0x5202+0, #0x00
;	stm8s_spi.c: 55: SPI->SR     = SPI_SR_RESET_VALUE;
	mov	0x5203+0, #0x02
;	stm8s_spi.c: 56: SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
	mov	0x5205+0, #0x07
;	stm8s_spi.c: 57: }
	ret
;	stm8s_spi.c: 78: void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
;	-----------------------------------------
;	 function SPI_Init
;	-----------------------------------------
_SPI_Init:
	push	a
;	stm8s_spi.c: 91: SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
	ld	a, (0x04, sp)
	or	a, (0x05, sp)
	ld	(0x01, sp), a
;	stm8s_spi.c: 92: (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
	ld	a, (0x07, sp)
	or	a, (0x08, sp)
	or	a, (0x01, sp)
	ld	0x5200, a
;	stm8s_spi.c: 95: SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
	ld	a, (0x09, sp)
	or	a, (0x0a, sp)
	ld	0x5201, a
;	stm8s_spi.c: 99: SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
	ld	a, 0x5201
;	stm8s_spi.c: 97: if (Mode == SPI_MODE_MASTER)
	push	a
	ld	a, (0x07, sp)
	cp	a, #0x04
	pop	a
	jrne	00102$
;	stm8s_spi.c: 99: SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
	or	a, #0x01
	ld	0x5201, a
	jra	00103$
00102$:
;	stm8s_spi.c: 103: SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
	and	a, #0xfe
	ld	0x5201, a
00103$:
;	stm8s_spi.c: 107: SPI->CR1 |= (uint8_t)(Mode);
	ld	a, 0x5200
	or	a, (0x06, sp)
	ld	0x5200, a
;	stm8s_spi.c: 110: SPI->CRCPR = (uint8_t)CRCPolynomial;
	ldw	x, #0x5205
	ld	a, (0x0b, sp)
	ld	(x), a
;	stm8s_spi.c: 111: }
	pop	a
	ret
;	stm8s_spi.c: 119: void SPI_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function SPI_Cmd
;	-----------------------------------------
_SPI_Cmd:
;	stm8s_spi.c: 126: SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
	ld	a, 0x5200
;	stm8s_spi.c: 124: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	stm8s_spi.c: 126: SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
	or	a, #0x40
	ld	0x5200, a
	ret
00102$:
;	stm8s_spi.c: 130: SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
	and	a, #0xbf
	ld	0x5200, a
;	stm8s_spi.c: 132: }
	ret
;	stm8s_spi.c: 141: void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function SPI_ITConfig
;	-----------------------------------------
_SPI_ITConfig:
	push	a
;	stm8s_spi.c: 149: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
	ld	a, (0x04, sp)
	and	a, #0x0f
	ld	xl, a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00112$
00111$:
	sll	(1, sp)
	dec	a
	jrne	00111$
00112$:
	pop	a
;	stm8s_spi.c: 153: SPI->ICR |= itpos; /* Enable interrupt*/
	ldw	x, #0x5202
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
;	stm8s_spi.c: 151: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	stm8s_spi.c: 153: SPI->ICR |= itpos; /* Enable interrupt*/
	or	a, (0x01, sp)
	ld	0x5202, a
	jra	00104$
00102$:
;	stm8s_spi.c: 157: SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
	cpl	a
	and	a, (0x01, sp)
	ld	0x5202, a
00104$:
;	stm8s_spi.c: 159: }
	pop	a
	ret
;	stm8s_spi.c: 166: void SPI_SendData(uint8_t Data)
;	-----------------------------------------
;	 function SPI_SendData
;	-----------------------------------------
_SPI_SendData:
;	stm8s_spi.c: 168: SPI->DR = Data; /* Write in the DR register the data to be sent*/
	ldw	x, #0x5204
	ld	a, (0x03, sp)
	ld	(x), a
;	stm8s_spi.c: 169: }
	ret
;	stm8s_spi.c: 176: uint8_t SPI_ReceiveData(void)
;	-----------------------------------------
;	 function SPI_ReceiveData
;	-----------------------------------------
_SPI_ReceiveData:
;	stm8s_spi.c: 178: return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
	ld	a, 0x5204
;	stm8s_spi.c: 179: }
	ret
;	stm8s_spi.c: 187: void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function SPI_NSSInternalSoftwareCmd
;	-----------------------------------------
_SPI_NSSInternalSoftwareCmd:
;	stm8s_spi.c: 194: SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
	ld	a, 0x5201
;	stm8s_spi.c: 192: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	stm8s_spi.c: 194: SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
	or	a, #0x01
	ld	0x5201, a
	ret
00102$:
;	stm8s_spi.c: 198: SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
	and	a, #0xfe
	ld	0x5201, a
;	stm8s_spi.c: 200: }
	ret
;	stm8s_spi.c: 207: void SPI_TransmitCRC(void)
;	-----------------------------------------
;	 function SPI_TransmitCRC
;	-----------------------------------------
_SPI_TransmitCRC:
;	stm8s_spi.c: 209: SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
	bset	20993, #4
;	stm8s_spi.c: 210: }
	ret
;	stm8s_spi.c: 218: void SPI_CalculateCRCCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function SPI_CalculateCRCCmd
;	-----------------------------------------
_SPI_CalculateCRCCmd:
;	stm8s_spi.c: 225: SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
	ld	a, 0x5201
;	stm8s_spi.c: 223: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	stm8s_spi.c: 225: SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
	or	a, #0x20
	ld	0x5201, a
	ret
00102$:
;	stm8s_spi.c: 229: SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
	and	a, #0xdf
	ld	0x5201, a
;	stm8s_spi.c: 231: }
	ret
;	stm8s_spi.c: 238: uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
;	-----------------------------------------
;	 function SPI_GetCRC
;	-----------------------------------------
_SPI_GetCRC:
;	stm8s_spi.c: 245: if (SPI_CRC != SPI_CRC_RX)
	tnz	(0x03, sp)
	jreq	00102$
;	stm8s_spi.c: 247: crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
	ld	a, 0x5207
	ret
00102$:
;	stm8s_spi.c: 251: crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
	ld	a, 0x5206
;	stm8s_spi.c: 255: return crcreg;
;	stm8s_spi.c: 256: }
	ret
;	stm8s_spi.c: 263: void SPI_ResetCRC(void)
;	-----------------------------------------
;	 function SPI_ResetCRC
;	-----------------------------------------
_SPI_ResetCRC:
;	stm8s_spi.c: 267: SPI_CalculateCRCCmd(ENABLE);
	push	#0x01
	call	_SPI_CalculateCRCCmd
	pop	a
;	stm8s_spi.c: 270: SPI_Cmd(ENABLE);
	push	#0x01
	call	_SPI_Cmd
	pop	a
;	stm8s_spi.c: 271: }
	ret
;	stm8s_spi.c: 278: uint8_t SPI_GetCRCPolynomial(void)
;	-----------------------------------------
;	 function SPI_GetCRCPolynomial
;	-----------------------------------------
_SPI_GetCRCPolynomial:
;	stm8s_spi.c: 280: return SPI->CRCPR; /* Return the CRC polynomial register */
	ld	a, 0x5205
;	stm8s_spi.c: 281: }
	ret
;	stm8s_spi.c: 288: void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
;	-----------------------------------------
;	 function SPI_BiDirectionalLineConfig
;	-----------------------------------------
_SPI_BiDirectionalLineConfig:
;	stm8s_spi.c: 295: SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
	ld	a, 0x5201
;	stm8s_spi.c: 293: if (SPI_Direction != SPI_DIRECTION_RX)
	tnz	(0x03, sp)
	jreq	00102$
;	stm8s_spi.c: 295: SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
	or	a, #0x40
	ld	0x5201, a
	ret
00102$:
;	stm8s_spi.c: 299: SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
	and	a, #0xbf
	ld	0x5201, a
;	stm8s_spi.c: 301: }
	ret
;	stm8s_spi.c: 311: FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
;	-----------------------------------------
;	 function SPI_GetFlagStatus
;	-----------------------------------------
_SPI_GetFlagStatus:
;	stm8s_spi.c: 318: if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
	ld	a, 0x5203
	and	a, (0x03, sp)
	jreq	00102$
;	stm8s_spi.c: 320: status = SET; /* SPI_FLAG is set */
	ld	a, #0x01
	ret
00102$:
;	stm8s_spi.c: 324: status = RESET; /* SPI_FLAG is reset*/
	clr	a
;	stm8s_spi.c: 328: return status;
;	stm8s_spi.c: 329: }
	ret
;	stm8s_spi.c: 346: void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
;	-----------------------------------------
;	 function SPI_ClearFlag
;	-----------------------------------------
_SPI_ClearFlag:
;	stm8s_spi.c: 350: SPI->SR = (uint8_t)(~SPI_FLAG);
	ld	a, (0x03, sp)
	cpl	a
	ld	0x5203, a
;	stm8s_spi.c: 351: }
	ret
;	stm8s_spi.c: 366: ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
;	-----------------------------------------
;	 function SPI_GetITStatus
;	-----------------------------------------
_SPI_GetITStatus:
	pushw	x
;	stm8s_spi.c: 375: itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
	ld	a, (0x05, sp)
	and	a, #0x0f
	push	a
	ld	a, #0x01
	ld	(0x03, sp), a
	pop	a
	tnz	a
	jreq	00118$
00117$:
	sll	(0x02, sp)
	dec	a
	jrne	00117$
00118$:
;	stm8s_spi.c: 378: itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
	ld	a, (0x05, sp)
	swap	a
	and	a, #0x0f
;	stm8s_spi.c: 380: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	tnz	a
	jreq	00120$
00119$:
	sll	(0x01, sp)
	dec	a
	jrne	00119$
00120$:
;	stm8s_spi.c: 382: enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
	ld	a, 0x5203
	and	a, (0x01, sp)
	ld	xl, a
;	stm8s_spi.c: 384: if (((SPI->ICR & itpos) != RESET) && enablestatus)
	ld	a, 0x5202
	and	a, (0x02, sp)
	jreq	00102$
	ld	a, xl
	tnz	a
	jreq	00102$
;	stm8s_spi.c: 387: pendingbitstatus = SET;
	ld	a, #0x01
;	stm8s_spi.c: 392: pendingbitstatus = RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	stm8s_spi.c: 395: return  pendingbitstatus;
;	stm8s_spi.c: 396: }
	popw	x
	ret
;	stm8s_spi.c: 412: void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
;	-----------------------------------------
;	 function SPI_ClearITPendingBit
;	-----------------------------------------
_SPI_ClearITPendingBit:
;	stm8s_spi.c: 420: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
	ld	a, (0x03, sp)
	and	a, #0xf0
	swap	a
	and	a, #0x0f
	ld	xl, a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00104$
00103$:
	sll	(1, sp)
	dec	a
	jrne	00103$
00104$:
	pop	a
;	stm8s_spi.c: 422: SPI->SR = (uint8_t)(~itpos);
	cpl	a
	ld	0x5203, a
;	stm8s_spi.c: 424: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
