STRO in1, d ;ask for the decimal value for a
DECI numa, d ;read and store the decimal value for a

STRO in2, d ;ask for the decimal value for b
DECI numb, d ;read and store the decimal value for b

STRO in3, d ;ask for the decimal value for c
DECI numc, d ;read and store the decimal value for c

STRO in4, d ;ask for the decimal value for n
DECI numn, d ;read and store the decimal value for n

STRO newline, d ;create a newline character

LDWA 0x0001, i ;load one into the accumlator
STWA one, d ;store it as a variable named one for use later

LDWA 0x0004, i ;load four into the accumlator
STWA numn2, d ;load four into the variable
STWA countn, d ;store the value into a counter

BR main ;branch past variables

in1: .ASCII "Enter a decimal value for a: \n\x00" ;string to print
in2: .ASCII "Enter a decimal value for b: \n\x00" ;string to print
in3: .ASCII "Enter a decimal value for c: \n\x00" ;string to print
in4: .ASCII "Enter a decimal value for n: \n\x00" ;string to print
out1: .ASCII "Term 1: \x00" ;string to print
out2: .ASCII "Term 2: \x00" ;string to print
out3: .ASCII "Term 3: \x00" ;string to print
out4: .ASCII "Term 4: \x00" ;string to print
outn: .ASCII "Term \x00" ;string to print
colon: .ASCII ": \x00" ;string to print
newline: .ASCII "\n\x00" ;string to print
numa: .BLOCK 2 ;variable for a
numb: .BLOCK 2 ;variable for b
numc: .BLOCK 2 ;variable for c
numn: .BLOCK 2 ;variable for the inputted n
numn2: .BLOCK 2 ;variable for the current value of n
count: .BLOCK 2 ;variable for the counter
countn: .BLOCK 2 ;variable for the counter for n
nsqrd: .BLOCK 2 ;variable for the square of n
total: .BLOCK 2 ;variable for the total
result1: .BLOCK 2 ;variable for the first result
result2: .BLOCK 2 ;variable for the second result
total1: .BLOCK 2 ;variable for the first total
total2: .BLOCK 2 ;variable for the second total
total3: .BLOCK 2 ;variable for the third total
total4: .BLOCK 2 ;variable for the fourth total
totaln: .BLOCK 2 ;variable for the total for n = input n
one: .BLOCK 2 ;variable containing 1


main: LDWA numn2, d ;load the current value of n
STWA count, d ;store into the counter
BR sqrn ;branch to the square n function/loop



sqrn: LDWA nsqrd, d ;load the running total
ADDA numn2, d ;add the current value of n to the running total
STWA nsqrd, d ;store the running total

LDWA count, d ;load counter value
SUBA one, d ;subtract one
BREQ prep1 ;branch if 0 -> update the variables for the next portion of the calculation
STWA count, d ;update counter

BR sqrn ;loop





prep1: LDWA nsqrd, d ;load n squared result
STWA count, d ;store into the counter
BR calc1 ;branch


calc1: LDWA result1, d ;load the running total
ADDA numa, d ;add the value of a into the running total
STWA result1, d

LDWA count, d ;load counter value
SUBA one, d ;subtract one
BREQ prep2 ;branch if 0
STWA count, d ;update counter

BR calc1 ;loop





prep2: LDWA numn2, d ;load the current value of n
STWA count, d ;store into the counter
BR calc2 ;branch to the second calculation

calc2: LDWA result2, d ;load the running total
ADDA numb, d ;add the value of b into the running total
STWA result2, d ;store the running total

LDWA count, d ;load counter value
SUBA one, d ;subtract one
BREQ calc3 ;branch if 0
STWA count, d ;update counter

BR calc2 ;loop

calc3: LDWA result1, d ;load the first result
ADDA result2, d ;add the second result into the first result
STWA total, d ;store the total
LDWA total, d ;load the total
ADDA numc, d ;add the value of c into the total
STWA total, d ;store the total


LDWA countn, d ;load the counter value
BREQ out ;branch if 0 to outputs

BR check ;branch to the check function







check: LDWA countn, d ;load counter value
SUBA 0x0004, i ;subtract 4 from the counter
BREQ store4 ;branch if 0
ADDA 0x0004, i ;add 4 to the counter

SUBA 0x0003, i ;subtract 3 from the counter
BREQ store3 ;branch if 0
ADDA 0x0003, i ;add 3 to the counter

SUBA 0x0002, i ;subtract 2 from the counter
BREQ store2 ;branch if 0
ADDA 0x0002, i ;add 2 to the counter

SUBA 0x0001, i ;subtract 1 from the counter
BREQ store1 ;branch if 0




store1: LDWA total, d ;load the total
STWA total1, d ;store the total into the first total variable
BR iterate ;branch to the iteration function

store2: LDWA total, d ;load the total
STWA total2, d ;store the total into the second total variable
BR iterate ;branch to the iteration function

store3: LDWA total, d ;load the total
STWA total3, d ;store the total into the third total variable
BR iterate ;branch to the iteration function

store4: LDWA total, d ;load the total
STWA total4, d ;store the total into the fourth total variable
BR iterate ;branch to the iteration function




iterate: LDWA countn, d ;load counter value
SUBA 0x0001, i ;subtract 1 from the counter
STWA countn, d ;store the counter
BREQ last ;move to the last loop when the counter reaches 0
STWA numn2, d ;store the current value of n into the variable
BR reset ;branch to the reset function

reset: LDWA 0x0000, i ;load zero into the accumulator
STWA nsqrd, d ;store the value into n squared
STWA total, d ;store the value into the total
STWA result1, d ;store the value into the first result
STWA result2, d ;store the value into the second result
BR main ;branch to the main function


last: LDWA numn, d ;load the value of n into the variable
STWA numn2, d ;store the value into the variable used in the calculation
BR reset ;branch to the reset function




out: STRO out1, d ;output the first term
DECO total1, d ;output the first total
STRO newline, d ;output a newline

STRO out2, d ;output the second term
DECO total2, d ;output the second total
STRO newline, d ;output a newline

STRO out3, d ;output the third term
DECO total3, d ;output the third total
STRO newline, d ;output a newline

STRO out4, d ;output the fourth term
DECO total4, d ;output the fourth total
STRO newline, d ;output a newline

STRO newline, d ;output a newline
STRO outn, d ;output the nth term
DECO numn, d ;output the n value
STRO colon, d ;output a colon
DECO total, d ;output the nth total
STOP ;stop the program

.END