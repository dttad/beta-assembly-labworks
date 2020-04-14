/*
 * Exercise 13
 * Description: Calculate the sum s = 1 + 2 + ... + a[0] and store it to register r0.
 * Author: Dat Tran (HE140517)
 */
 
.include "beta.uasm"

BR(Begin)

a:
	LONG(234)							// a[0]	<-- 234

Begin:
	LD(r31, a, r0)				// r0 <-- Mem[a]
	ADDC(r31, 1, r1)			// r1 <-- 1
	ADDC(r31, 0, r2)			// r2 <-- 0
		
Cmp:
	CMPLE(r1, r0, r3)			// if r1 <= r0 then r3 = 1 else r3 = 0
	BNE(r3, AddSum, r31)	// if r3 = 1 then go to AddSum
	BR(SavetoReg)					// if r3 != 1 then go to SavetoReg
	
AddSum:
	ADD(r2, r1, r2)				// r2 <-- r2 + r1
	ADDC(r1, 1, r1)				// r1 <-- r1 + 1
	BR(Cmp)								// go to Cmp
	
SavetoReg:
		ADDC(r2, 0, r0)			// r0 <-- r2

HALT()