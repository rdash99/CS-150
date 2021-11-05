STRO in1, d ;ask for the decimal value for a
DECI numa, d ;read and store the decimal value for a

STRO in2, d ;ask for the decimal value for b
DECI numb, d ;read and store the decimal value for b

STRO in3, d ;ask for the decimal value for c
DECI numc, d ;read and store the decimal value for c

STRO in4, d ;ask for the decimal value for n
DECI numn, d ;read and store the decimal value for n

LDWA 0x0001, i
STWA one, d

BR main ;branch past variables

in1: .ASCII "Enter a decimal value for a: \n\x00"
in2: .ASCII "Enter a decimal value for b: \n\x00"
in3: .ASCII "Enter a decimal value for c: \n\x00"
in4: .ASCII "Enter a decimal value for n: \n\x00"
numa: .BLOCK 2
numb: .BLOCK 2
numc: .BLOCK 2
numn: .BLOCK 2
count: .BLOCK 2
nsqrd: .BLOCK 2
total: .BLOCK 2
result1: .BLOCK 2
result2: .BLOCK 2
one: .BLOCK 2


main: LDWA numn, d
STWA count, d
BR sqrn


end: DECO nsqrd, d
STOP


sqrn: LDWA nsqrd, d
ADDA numn, d
STWA nsqrd, d

LDWA count, d ;load counter value
SUBA one, d ;subtract one
BREQ end ;branch if 0
STWA count, d ;update counter

BR sqrn

.END