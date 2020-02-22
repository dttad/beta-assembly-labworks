/*
 * Exercise 5
 * Description: a[0] store the value of hours. Convert the number of hours to week and store in a[1] and store the remaining days in a[2] and the remaining hours in a[3]
 * Author: Dat Tran (HE140517)
 */

.include "beta.uasm"
BR(main)

a:		
		LONG(497)			   // a[0] hours
		LONG(0)				   // a[1] week x
		LONG(0)				   // a[2]	remain days x
		LONG(0)				   // a[3]	remain hours
main:	
		LD(r31, a, r0)		   // r0 <-- Mem[r31 + a + 0]
		
		DIVC(r0, 24, r1)	   // r1 <-- r0 / 24 (days)
		DIVC(r1, 7, r2)		   // r2 <-- r1 / 7  (weeks)
		ST(r2, a + 4, r31)	   // r2 --> Mem[r31 + a + 4]
		
		MULC(r2, 7, r3)		   // r3 <-- r2 * 7
		SUB(r1, r3, r4)		   // r4 <-- r1 - r3
		ST(r4, a + 8, r31)	   // r4 --> Mem[r31 + a + 8]
		
		MULC(r2, 7, r5) 	   // r5 <-- r2 * 24
		MULC(r5, 24, r5)	   // r5 <-- r5 * 7
		MULC(r4, 24, r6)	   // r6 <-- r4 * 24 (so gio cua ngay con lai)
		ADD(r5, r6, r7)		   // r7 <-- r5 + r6
		SUB(r0, r7, r7)		   // r7 <-- r0 - r7
		ST(r7, a + 12, r31)	   // r7 --> Mem[r31 + a + 12]
		
HALT()