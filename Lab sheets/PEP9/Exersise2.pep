BR   main

result: .WORD 0x0000
num1:.BLOCK  2
num2:.BLOCK  2
num3:.BLOCK  2

main:DECI num1,d ;get first number
LDWA num1,d
DECI num2,d ;get second number
ADDA num2,d ;add second number to first number
DECI num3,d ;get third number
SUBA num3,d ;subtract third number
STWA result,d
DECO result,d
STOP
.END