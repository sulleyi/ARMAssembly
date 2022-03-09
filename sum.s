		;		sum.s	Ian Sulley	7 March 2022
		;		Elementary program to add three numbers and store and print the sum.
		;		Register use:

num1		DCD		17             ; three initial integer values
num2		DCD		-35
num3		DCD		276
sum		FILL		4             ; allocate a word for the integer result
		
main                           ; main() {
		ADR		R0, num1
		LDR		R0, [R0]
		ADR		R1, num2          
		LDR		R1, [R1]
		ADR		R2, num3
		LDR		R2, [R2]
		
		ADD		R3, R0, R1      ; R3 = num1 + num2
		ADD		R3, R3, R2      ; R3 =  R3 + num3
		
		ADR		R4, sum    	; address of sum
		STR		R3, [R4]       ; sum   = accu
		END