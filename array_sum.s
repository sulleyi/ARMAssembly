		;		Sum an array with a subroutine.
		;		Ian Sulley 02 08 2022
		
array	DCD		-123, 548, 923, 431, 560, -348, 961
length	DCD		7
		
main		ADR		R0, array        		; a0 points into array
		ADR		R1, length       		; a1 is the length of the array in words
		LSL		R1, R1, #2			; R1 = R1*4   <-- len(arr) in bytes
		ADD		R2, R0, R1			; R2 = &endarray
		ADD		SP, SP, #-4    		; push
		STR		LR, [SP]       		; ret addr on stack
		BL		arrsum
		LDR		LR, [SP]       		; pop
		ADD		SP, SP, #4     		; ret addr
		END
		
		;		array-summation subroutine
		;		register use:
		;		R7; accumulator
		;		$a0: parameter: array addr; used as pointer to current element
		;		$a1: parameter: size of arr 	$v0: accumulator and return value
		;		$t2: temporary copy of current array element
arrsum
		
		MOV		R7, #0         		; R7 accumulates sum
		MOV		R3, #0				; initialize count = 0
		B		test               		; check test
sum		LDR		R2, [R0]       		; get next array element
		ADD		R7, R7, R2    			; add it in
		ADD		R0, R0, #4      		; point to next word
		ADD		R3, R3, #1     		; count++
test		SUB		R4, R3, R1
		BLT		sum    				; while t3 < len(arr) do
		MOV		PC, LR

