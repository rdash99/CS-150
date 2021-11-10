STRO in1, d ;ask for the decimal value for a
DECI numa, d ;read and store the decimal value for a

STRO in2, d ;ask for the decimal value for b
DECI numb, d ;read and store the decimal value for b

STRO in3, d ;ask for the decimal value for c
DECI numc, d ;read and store the decimal value for c

STRO in4, d ;ask for the decimal value for n
DECI numn, d ;read and store the decimal value for n

LDWA 0x0001, i ;load one into the accumlator
STWA one, d ;store it as a variable named one for use later

LDWA 0x0004, i
STWA numn2, d ;load four into the variable
STWA countn, d ;store the value into a counter

BR main ;branch past variables

in1: .ASCII "Enter a decimal value for a: \n\x00"
in2: .ASCII "Enter a decimal value for b: \n\x00"
in3: .ASCII "Enter a decimal value for c: \n\x00"
in4: .ASCII "Enter a decimal value for n: \n\x00"
out1: .ASCII "Term 1: \x00"
out2: .ASCII "Term 2: \x00"
out3: .ASCII "Term 3: \x00"
out4: .ASCII "Term 4: \x00"
outn: .ASCII "Term \x00"
colon: .ASCII ": \x00"
newline: .ASCII "\n\x00"
numa: .BLOCK 2
numb: .BLOCK 2
numc: .BLOCK 2
numn: .BLOCK 2
numn2: .BLOCK 2
count: .BLOCK 2
countn: .BLOCK 2
nsqrd: .BLOCK 2
total: .BLOCK 2
result1: .BLOCK 2
result2: .BLOCK 2
total1: .BLOCK 2
total2: .BLOCK 2
total3: .BLOCK 2
total4: .BLOCK 2
totaln: .BLOCK 2
one: .BLOCK 2


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





prep1: LDWA nsqrd, d ;load 
STWA count, d
BR calc1


calc1: LDWA result1, d ;load the result of the first calculation
ADDA numa, d
STWA result1, d

LDWA count, d ;load counter value
SUBA one, d ;subtract one
BREQ prep2 ;branch if 0
STWA count, d ;update counter

BR calc1





prep2: LDWA numn2, d
STWA count, d
BR calc2

calc2: LDWA result2, d
ADDA numb, d
STWA result2, d

LDWA count, d ;load counter value
SUBA one, d ;subtract one
BREQ calc3 ;branch if 0
STWA count, d ;update counter

BR calc2

calc3: LDWA result1, d
ADDA result2, d
STWA total, d
LDWA total, d
ADDA numc, d
STWA total, d


LDWA countn, d ;load counter value
BREQ out

BR check







check: LDWA countn, d ;load counter value
SUBA 0x0004, i
BREQ store4
ADDA 0x0004, i

SUBA 0x0003, i
BREQ store3
ADDA 0x0003, i

SUBA 0x0002, i
BREQ store2
ADDA 0x0002, i

SUBA 0x0001, i
BREQ store1




store1: LDWA total, d
STWA total1, d
BR iterate

store2: LDWA total, d
STWA total2, d
BR iterate

store3: LDWA total, d
STWA total3, d
BR iterate

store4: LDWA total, d
STWA total4, d
BR iterate




iterate: LDWA countn, d ;load counter value
SUBA 0x0001, i
STWA countn, d
BREQ last ;move to the last loop when the counter reaches 0
STWA numn2, d
BR reset

reset: LDWA 0x0000, i
STWA nsqrd, d
STWA total, d
STWA result1, d
STWA result2, d
BR main


last: LDWA numn, d
STWA numn2, d
BR reset




out: STRO out1, d
DECO total1, d
STRO newline, d

STRO out2, d
DECO total2, d
STRO newline, d

STRO out3, d
DECO total3, d
STRO newline, d

STRO out4, d
DECO total4, d
STRO newline, d

STRO newline, d
STRO outn, d
DECO numn, d
STRO colon, d
DECO total, d
STRO newline, d
STOP

.END