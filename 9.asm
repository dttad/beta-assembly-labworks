/*
 * Exercise 9
 * Description: Check if a[0], a[1] and a[2] are the lengths of the triangle. If it is true, store 1 to a[3], otherwise store 0.
 * Author: Dat Tran (HE140517)
 */
 
.include "beta.uasm"

BR(Begin)

arr:
				a:		LONG(8)					// a[0]
				b:		LONG(6)					// a[1]
				c: 		LONG(5)					// a[2]
				result:	LONG(0)					// a[3]

Begin:
				LD(r31, a, r0)					// r0 <-- Mem[r31 + a]
				LD(r31, b, r1)					// r1 <-- Mem[r31 + a + 4]
				LD(r31, c, r2)					// r2 <-- Mem[r31 + a + 8]
				LD(r31, result, r3)				// r3 <-- Mem[r31 + a + 12]
				
CmpAB:
				ADD(r0, r1, r4)					// r4 <-- r0 + r1	
				CMPLT(r4, r2, r5) 				// if r4 < r2 then r5 = 1 else r5 = 0
				BNE(r5, isNotTriangle, r31)		// if r5 = 1 then go to isNotTriangle
				BEQ(r5, CmpBC, r31)				// if r5 = 0 then go to CmpBC

CmpBC:
				ADD(r1, r2, r4)					// r4 <-- r1 + r2
				CMPLT(r4, r0, r5)				// if r4 < r0 then r5 = 1 else r5 = 0
				BNE(r5, isNotTriangle, r31)		// if r5 = 1 then go to isNotTriangle
				BEQ(r5, CmpAC, r31)				// if r5 = 0 then go to CmpAC
				
CmpAC:
				ADD(r0, r2, r4)					// r4 <-- r0 + r2
				CMPLT(r4, r1, r5)				// if r4 < r1 then r5 = 1 else r5 = 0
				BNE(r5, isNotTriangle, r31)		// if r5 - 1 then go to isNotTriangle
				BEQ(r5, isTriangle, r31)		// if r5 = 0 then go to isTriangle

isNotTriangle:
				ST(r3, a + 12, r31)				// r3 --> Mem[r31 + a + 12]
				
isTriangle:
				ADDC(r3, 1, r3)					// r3 <-- r3 + 1
				ST(r3, a + 12, r31)				// r3 --> Mem[r31 + a + 12]

HALT()