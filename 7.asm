/*
 * Exercise 7
 * Description: Find the minimum value of a[0], a[1] and a[2], the result is stored in a[3]
 * Author: Dat Tran (HE140517)
 */

.include "beta.uasm"

BR(Begin)

a:
	LONG(0x888)							// a[0]
	LONG(0x999)							// a[1]
	LONG(0x728)							// a[2]
	min:	LONG(0x000)				// a[3]

Begin:
	LD(r31, a, r0)					// r0 <-- Mem[r31 + a]
	LD(r31, a + 4, r1)			// r1 <-- Mem[r31 + a + 4]
	LD(r31, a + 8, r2)			// r2 <-- Mem[r31 + a + 8]
	
	ADDC(r0, 0, r3)					// r3 <-- r0
		
Cmp31:
	CMPLT(r1, r3, r4)				// if r1 < r3 then r4 ← 1 else r4 ← 0
	BNE(r4, Swap31, r31)		// if r4 ≠ 0 branch to Swap31
	BR(Cmp32)								// if r4 = 0 branch to Cmp32

Swap31:
	ADDC(r1, 0, r3)					// r3 <-- r1

Cmp32:
	CMPLT(r2, r3, r4)				// if r2 < r3 then r4 ← 1 else r4 ← 0
	BNE(r4, Swap32, r31)		// if r4 ≠ 0 branch to Swap32
	BR(Store)								// if r4 = 0 branch to Store

Swap32:
	ADDC(r2, 0, r3)					// r3 <-- r2

Store:
	ST(r3, a + 12, r31)			// r3 --> Mem[r31 + a + 12]
		
HALT()