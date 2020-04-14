/*
 * Exercise 14
 * Description: Calculate the total number of array elements from a[0] to a[9] and store it to a[10].
 * Author: Dat Tran (HE140517)
 */
 
.include "beta.uasm"

BR(Begin)

initVar:
	i			=	r0
	n			=	r1
	ea		=	r2
	temp	=	r3
	s			=	r4
	check	=	r10


a:
	LONG(25)							// a[0]
	LONG(0)								// a[1]
	LONG(12)							// a[2]
	LONG(56)							// a[3]
	LONG(912)							// a[4]
	LONG(213)							// a[5]
	LONG(21)							// a[6]
	LONG(14)							// a[7]
	LONG(10)							// a[8]
	LONG(40)							// a[9]
	sum:	LONG(0)					// a[10]


Begin:
	ADDC(r31, 10, n)				//  n <-- 10
	ADDC(r31, 0, s)					//  s <-- 0
	ADDC(r31, 0, i)					// 	i <-- 0
		
Cmp:
	CMPLT(i, n, check)			// if i < n then check = 1 else check = 0
	BNE(check, Loop, r31)		// if check = 1 then go to Loop
	BR(SavetoMem)						// if check != 1 then go to SavetoMem
	
Loop:
		MULC(i, 4, ea)				// ea <-- i * 4
		LD(ea, a, temp)				// temp <-- Mem[a + ea]
		ADD(s, temp, s)				// s <-- s + temp
		ADDC(i, 1, i)					// i <-- i + 1
		BR(Cmp)								// go to Cmp
		
SavetoMem:
		ST(s, sum, r31)				// check --> Mem[a + 4]

HALT()