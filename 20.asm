/*
 * Exercise 20
 * Description: Determine if a[0] is a square number or not. If yes, write 1 to a[1], otherwise write 0. 
 * Author: Dat Tran (HE140517)
 */
 
.include "beta.uasm"

BR(Begin)

initVar:
	n		=	r0
	i		=	r1
	t		=	r2
	check	=	r3
	status	= 	r10

a:
	LONG(25)										// a[0] - a
	LONG(0)											// a[1] - a + 4

Begin:
	LD(r31, a, n)								// 	   n <-- Mem[a + 0]
	ADDC(r31, 0, check)					// check <-- 0
	ADDC(r31, 0, i)							// 	   i <-- 0

Cmp1:
	CMPLE(i, n, status)					// if i <= n then status = 1, else status = 0
	BNE(status, Cmp2, r31)			// if status != 0 then go to Cmp2
	BR(SavetoMem)								// if status = 0 then go to SavetoMem

Cmp2:
	MUL(i, i, t) 								// t <-- i*i
	CMPEQ(t, n, status)					// if t = n then status = 1 else status = 0
	BNE(status, True2, r31)			// if status != 0 branch to False2
	BR(False2)									// go to True2 if status = 0

True2:
	ADDC(r31, 1, check)					// check <-- 1
	BR(SavetoMem)								// go to SavetoMem

False2:
	ADDC(i, 1, i)								// i <-- i + 1
	BR(Cmp1)										// go to Cmp1
		
SavetoMem:
	ST(check, a + 4, r31)				// check --> Mem[a + 4]

HALT()