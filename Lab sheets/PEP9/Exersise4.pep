DECI num1,d
LDWA num1,d
BREQ end1
STWA num2,d

DECI count,d
LDWA count,d
BREQ end2
SUBA 0x0001,i ;subtract 1 from the counter
STWA count,d

BR   main

num1: .BLOCK 2
num2: .BLOCK 2
count: .BLOCK 2

main: LDWA count,d
BREQ end1
SUBA 0x0001,i ;subtract 1 from the counter
STWA count,d
LDWA num1,d
ADDA num2,d
STWA num1,d

BREQ end1
BR main
STOP


end1: DECO num1,d
STOP

end2: DECO count,d
STOP
.END