/*
 * Exercise 17
 * Description: Find the smallest common multiple of a[0] and a[1] and store it to a[2].
 * Author: Dat Tran (HE140517)
 */

.include "beta.uasm"

BR(Begin)

initVar:
	a 	=   r0
	b 	=   r1
	a0 	=   r3
	b0 	=   r4
	check = r5
		
arr:
	LONG(6)							            // a[0] = a
	LONG(10)	            					// a[1] = b
	resultSCM:	LONG(0)		          // a[2] = c

Begin:
	LD(r31, arr, a)		          	  // a <-- Mem[a + 0]
	LD(r31, arr + 4, b)         		// b <-- Mem[a + 4]
	ADDC(a, 0, a0)		           	  // a0 <-- a
	ADDC(b, 0, b0)		            	// b0 <-- b

Cmp1:
	CMPEQ(a, b, check)	            // if a = b then check = 1 else check = 0
	BEQ(check, Cmp2, r31)       		// if check = 0 then go to Cmp2
	BR(SavetoMem)
		
Cmp2:
	CMPLT(a, b, check)	            // if a < b then check = 1 then check = 0
	BNE(check, True2, r31)	        // if check != 0 then go to True2
	BEQ(check, False2, r31)         // if check = 0 then go to False2

True2:
	ADD(a, a0, a)	                  // a <-- a + a0
	BR(Cmp1)                        // go to Cmp1

False2:
	ADD(b, b0, b)	               	  // b <-- b + b0
	BR(Cmp2)                        // go to Cmp2
		
SavetoMem:
	ST(a, arr + 8, r31)             // b --> Mem[arr + 8]

HALT()