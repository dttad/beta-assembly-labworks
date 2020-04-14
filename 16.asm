/*
 * Exercise 16
 * Description: Find the largest common divisor of a[0] and a[1] and store it to a[2].
 * Author: Dat Tran (HE140517)
 */

.include "beta.uasm"

BR(Begin)

initVar:
	a 	=   r0
	b 	=   r1
	check = r5

arr:
	LONG(50)								// a[0] = a
	LONG(20)								// a[1] = b
	result:	LONG(0)					// a[2] = c

Begin:
	LD(r31, arr, a)					// a <-- Mem[a + 0]
	LD(r31, arr + 4, b)			// b <-- Mem[a + 4]

Cmp1:
	CMPEQ(a, b, check)  		// if a = b then check = 1 else check = 0
	BEQ(check, Cmp2, r31)		// if check = 0 then go to Cmp2
	BR(SavetoMem)			   		// go to SavetoMem
		
Cmp2:
	CMPLT(a, b, check)			// if a < b then check = 1 then check = 0
	BNE(check, True2, r31)	// if check != 0 then go to True2
	BEQ(check, False2, r31) // if check = 0 then go to False2

True2:
	SUB(b, a, b)						// a <-- a + a0
	BR(Cmp1)								// go to Cmp1

False2:
	SUB(a, b, a)						// b <-- b + b0
	BR(Cmp1)								// go to Cmp1
		
SavetoMem:
	ST(b, arr + 8, r31)			// a --> Mem[arr + 8]

HALT()