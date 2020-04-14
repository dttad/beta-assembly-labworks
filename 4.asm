/*
 * Exercise 4
 * Description: a[0] store the value of minutes. Convert the number of minutes to hour and store in a[1] and store the remaining one in a[2]
 * Author: Dat Tran (HE140517)
 */

.include "beta.uasm"

BR(main)

a:		
	LONG(250)				    // a[0]
	LONG(0)				  	  // a[1]
	LONG(0)				  		// a[2]

main:	
	LD(r31, a, r0)		  // r0 <-- Mem[r31 + a + 0]
	
	DIVC(r0, 60, r1)	 	// r1 <-- r0 / 60
	ST(r1, a + 4, r31)	// r1 --> Mem[r31 + a + 4]
	
	MULC(r1, 60, r2)	  // r2 <-- r1 * 60
	SUB(r0, r2, r2)	  	// r2 <-- r0 - r2
	ST(r2, a + 8, r31)	// r2 --> Mem[r31 + a + 8]

HALT()