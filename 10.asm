/*
 * Exercise 10
 * Description: Sort a[0], a[1] and a[2] in ascending order.
 * Author: Dat Tran (HE140517)
 */
 
.include "beta.uasm"

BR(Begin)

arr:
				a0:		LONG(8)						// a[0]
				a1:		LONG(6)						// a[1]
				a2: 	LONG(9)						// a[2]

Begin:
				LD(r31, a0, r0)						// r0 <-- Mem[a0]
				LD(r31, a1, r1)						// r1 <-- Mem[a1]
				LD(r31, a2, r2)						// r2 <-- Mem[a2]

Cmp01:
				CMPLT(r0, r1, r3)					// if r0 < r1 then r3 = 1 else r3 = 0
				BNE(r3, Swap10, r31)				// if r3 != 0 then go to Swap10
				BR(Cmp02)

Swap10:
				ADDC(r0, 0, r4)						// r4 <-- r0
				ADDC(r1, 0, r0)						// r0 <-- r1
				ADDC(r4, 0, r1)						// r1 <-- r4
				
Cmp02:
				CMPLT(r0, r2, r3)					// if r0 < r2 then r3 = 1 else r3 = 0
				BNE(r3, Swap20, r31)				// if r3 != 0 then go to Swap20
				BR(Cmp12)
				
Swap20:
				ADDC(r0, 0, r4)						// r4 <-- r0
				ADDC(r2, 0, r0)						// r0 <-- r2
				ADDC(r4, 0, r2)						// r2 <-- r4

Cmp12:
				CMPLT(r1, r2, r3)					// if r1 < r2 then r3 = 1 else r3 = 0
				BNE(r3, Swap21, r31)				// if r3 != 0 then go to Swap21
				BR(SaveMem)

Swap21:
				ADDC(r1, 0, r4)						// r4 <-- r1
				ADDC(r2, 0, r1)						// r1 <-- r2
				ADDC(r4, 0, r2)						// r2 <-- r4
				
SaveMem:
				ST(r0, a0, r31)						// r0 --> Mem[a0]
				ST(r1, a1, r31)						// r1 --> Mem[a1]
				ST(r2, a2, r31)						// r2 --> Mem[a2]
				
HALT()