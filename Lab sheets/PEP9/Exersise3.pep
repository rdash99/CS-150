DECI num1,d
BREQ iszero
LDWA num1,d
BR start

num1:.BLOCK 2
num2:.BLOCK 2

eqmsg:.ASCII "Equal to zero\x00"
lessmsg:.ASCII "Less than zero\x00"
endmsg:.ASCII "Greater than zero\x00"

;SUBA num2,d
start: BREQ iszero
BRLT lzero
BR end

iszero: STRO eqmsg,d
STOP

lzero: STRO lessmsg,d
STOP

end: STRO endmsg,d
STOP
.END