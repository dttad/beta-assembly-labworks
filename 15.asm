/*
 * Exercise 15
 * Description: Find the largest number of array elements from a[0] to a[9] and store it to a[10].
 * Author: Dat Tran (HE140517)
 */
 
.include "beta.uasm"

BR(Begin)

initVar:
	i		  	   = 	 r0
	n		  	   =	 r1
	ea		     =	 r2
	temp	     =	 r3
	check	   	 =	 r4
	currentMax = 	 r5

a:
	a0:		LONG(25)											// a[0]
	a1:		LONG(452)											// a[1]
	a2:		LONG(12)											// a[2]
	a3:		LONG(56)											// a[3]
	a4:		LONG(942)											// a[4]
	a5:		LONG(213)											// a[5]
	a6:		LONG(21)											// a[6]
	a7:		LONG(14												// a[7]
	a8:		LONG(10)											// a[8]
	a9:		LONG(40)											// a[9]
	max:	LONG(0)												// a[10]

Begin:
	ADDC(r31, 10, n)										// 	  		  n <-- 10
	ADDC(r31, 0, i)											// 	   		  i <-- 0
	ADDC(r31, 0, currentMax)						// 	 currentMax <-- 0
		
Cmp:
	CMPLT(i, n, check)									// if i < n then check = 1 else check = 0
	BNE(check, Loop, r31)								// if check = 1 then go to Loop
	BR(SavetoMem)												// if check != 1 then go to SavetoMem
	
Loop:
	MULC(i, 4, ea)											// ea <-- i * 4
	LD(ea, a, temp)											// temp <-- Mem[a + ea]
	CMPLT(currentMax, temp, check)			// if currentMax < temp then check = 1 else check = 0
	BNE(check, ReplaceMax, r31)					// if check = 1 then go to ReplaceMax
	ADDC(i, 1, i)												// i <-- i + 1
	BR(Cmp)															// go to Cmp
		
ReplaceMax:
	ADDC(temp, 0, currentMax)						// currentMax <-- temp
	ADDC(i, 1, i)												// i <-- i + 1
	BR(Cmp)															// go to Cmp

SavetoMem:
	ST(currentMax, max, r31)						// currentMax --> Mem[max]

HALT()