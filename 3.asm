/*
 * Exercise 3
 * Description: Divide a[0] by a[1], the integer part stored in a[2], the remaining part stored in a[3]
 * Author: Dat Tran (HE140517)
 */

.include "beta.uasm"

BR(main)

a:		
	LONG(19)					  // a[0]
	LONG(7)				  		// a[1]
	LONG(0)				  		// a[2]
	LONG(0)				  		// a[3]
		
main: 	
	LD(r31, a, r0)		  // r0 <-- Mem[r31 + a + 0]
	LD(r31, a + 4, r1)	// r1 <-- Mem[r31 + a + 4]
	
	DIV(r0, r1, r2)		  // r2 <-- r0 / r1
	ST(r2, a + 8, r31)	// r2 --> Mem[r31 + a + 8]
	
	MUL(r1, r2, r3)		  // r3 <-- r1 * r2
	SUB(r0, r3, r3)		  // r3 <-- r0 - r3
	ST(r3, a + 12, r31)	// r3 --> Mem[r31 + a + 12]
		
HALT()