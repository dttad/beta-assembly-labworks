/*
 * Exercise 6
 * Description: If a[1] > a[3], then interchange
 * Author: Dat Tran (HE140517)
 */
 
 .include "beta.uasm"
 BR(main)
 
a:
 		LONG(120)
		LONG(450)
		LONG(323)
		LONG(229)

main:
		LD(r31, a + 4, r0)		// r0 <-- Mem[r31 + a + 4]
		LD(r31, a + 12, r1)		// r1 <-- Mem[r31 + a + 12]
		
		CMPLT(r1, r0, r2)		// if r1 < r0 then r2 ← 1 else r2 ← 0
		BNE(r2, swap, r31)		// if R2 ≠ 0 branch to label: swap

swap:
		ADDC(r0, 0, r3)			// r3 <-- r0
		ADDC(r1, 0, r0)			// r0 <-- r1
		ADDC(r3, 0, r1)			// r1 <-- r3
		ST(r0, a + 4, r31)		// r0 --> Mem[r31 + a + 4]
		ST(r1, a + 12, r31)		// r1 --> Mem[r31 + a + 4]
		
HALT()