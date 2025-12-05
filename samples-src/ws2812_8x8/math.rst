                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module math
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _fmod
                                     12 ;--------------------------------------------------------
                                     13 ; ram data
                                     14 ;--------------------------------------------------------
                                     15 	.area DATA
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area INITIALIZED
                                     20 ;--------------------------------------------------------
                                     21 ; absolute external ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DABS (ABS)
                                     24 
                                     25 ; default segment ordering for linker
                                     26 	.area HOME
                                     27 	.area GSINIT
                                     28 	.area GSFINAL
                                     29 	.area CONST
                                     30 	.area INITIALIZER
                                     31 	.area CODE
                                     32 
                                     33 ;--------------------------------------------------------
                                     34 ; global & static initialisations
                                     35 ;--------------------------------------------------------
                                     36 	.area HOME
                                     37 	.area GSINIT
                                     38 	.area GSFINAL
                                     39 	.area GSINIT
                                     40 ;--------------------------------------------------------
                                     41 ; Home
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
                                     44 	.area HOME
                                     45 ;--------------------------------------------------------
                                     46 ; code
                                     47 ;--------------------------------------------------------
                                     48 	.area CODE
                                     49 ;	math.c: 3: float fmod (float a, float b)
                                     50 ;	-----------------------------------------
                                     51 ;	 function fmod
                                     52 ;	-----------------------------------------
      008821                         53 _fmod:
      008821 52 08            [ 2]   54 	sub	sp, #8
                                     55 ;	math.c: 5: return (a - trunc(a / b) * b);
      008823 1E 0D            [ 2]   56 	ldw	x, (0x0d, sp)
      008825 89               [ 2]   57 	pushw	x
      008826 1E 0D            [ 2]   58 	ldw	x, (0x0d, sp)
      008828 89               [ 2]   59 	pushw	x
      008829 CD 94 DD         [ 4]   60 	call	___fs2uint
      00882C 5B 04            [ 2]   61 	addw	sp, #4
      00882E 89               [ 2]   62 	pushw	x
      00882F CD 94 FE         [ 4]   63 	call	___uint2fs
      008832 5B 02            [ 2]   64 	addw	sp, #2
      008834 1F 07            [ 2]   65 	ldw	(0x07, sp), x
      008836 1E 11            [ 2]   66 	ldw	x, (0x11, sp)
      008838 89               [ 2]   67 	pushw	x
      008839 1E 11            [ 2]   68 	ldw	x, (0x11, sp)
      00883B 89               [ 2]   69 	pushw	x
      00883C 1E 0B            [ 2]   70 	ldw	x, (0x0b, sp)
      00883E 89               [ 2]   71 	pushw	x
      00883F 90 89            [ 2]   72 	pushw	y
      008841 CD 97 56         [ 4]   73 	call	___fsdiv
      008844 5B 08            [ 2]   74 	addw	sp, #8
      008846 1F 03            [ 2]   75 	ldw	(0x03, sp), x
      008848 1E 11            [ 2]   76 	ldw	x, (0x11, sp)
      00884A 89               [ 2]   77 	pushw	x
      00884B 1E 11            [ 2]   78 	ldw	x, (0x11, sp)
      00884D 89               [ 2]   79 	pushw	x
      00884E 1E 07            [ 2]   80 	ldw	x, (0x07, sp)
      008850 89               [ 2]   81 	pushw	x
      008851 90 89            [ 2]   82 	pushw	y
      008853 CD 8E 15         [ 4]   83 	call	___fsmul
      008856 5B 08            [ 2]   84 	addw	sp, #8
      008858 89               [ 2]   85 	pushw	x
      008859 90 89            [ 2]   86 	pushw	y
      00885B 1E 11            [ 2]   87 	ldw	x, (0x11, sp)
      00885D 89               [ 2]   88 	pushw	x
      00885E 1E 11            [ 2]   89 	ldw	x, (0x11, sp)
      008860 89               [ 2]   90 	pushw	x
      008861 CD 8D F2         [ 4]   91 	call	___fssub
                                     92 ;	math.c: 6: }
      008864 5B 10            [ 2]   93 	addw	sp, #16
      008866 81               [ 4]   94 	ret
                                     95 	.area CODE
                                     96 	.area CONST
                                     97 	.area INITIALIZER
                                     98 	.area CABS (ABS)
