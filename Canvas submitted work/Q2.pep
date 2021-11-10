STRO in1, d ;ask for the decimal value for a
DECI numa, d ;read and store the decimal value for a

STRO in2, d ;ask for the decimal value for b
DECI numb, d ;read and store the decimal value for b

STRO in3, d ;ask for the decimal value for c
DECI numc, d ;read and store the decimal value for c

STRO in4, d ;ask for the decimal value for n
DECI numn, d ;read and store the decimal value for n

LDWA 0x0001, i ;load one into the accumlator
STWA one, d ;store it as a vaiable named one for use later

LDWA 0x0004, i
STWA numn2, d ;load two into the
STWA countn, d ;store the

BR main ;branch past variables

in1: .ASCII "Enter a decimal value for a: \n\x00"
in2: .ASCII "Enter a decimal value for b: \n\x00"
in3: .ASCII "Enter a decimal value for c: \n\x00"
in4: .ASCII "Enter a decimal value for n: \n\x00"
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


main: LDWA numn2, d
STWA count, d
BR sqrn



sqrn: LDWA nsqrd, d
ADDA numn2, d
STWA nsqrd, d

LDWA count, d ;load counter value
SUBA one, d ;subtract one
BREQ prep1 ;branch if 0
STWA count, d ;update counter

BR sqrn





prep1: LDWA nsqrd, d
STWA count, d
BR calc1


calc1: LDWA result1, d
ADDA numa, d
STWA result1, d

LDWA count, d ;load counter value
SUBA one, d ;subtract one
BREQ prep2 ;branch if 0
STWA count, d ;update counter

BR calc1





prep2: LDWA numn, d
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
ADDA numc
STWA total, d


LDWA countn, d ;load counter value
BREQ out5 ;change

BR end







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






store4: LDWA total, d
STWA total4, d
BR iterate




iterate: LDWA countn, d ;load counter value
SUBA 0x0001, i
STWA countn, d
BREQ last
STWA numn2, d
BR main

last: LDWA numn, d
STWA numn2, d
BR main

end: DECO total, d
STOP

.END