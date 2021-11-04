STRO  msg, d ;print input message
DECI num, d ;get the input number
LDWA num, d ;load the input number from memory
BREQ end ;if zero is input then branch to the end
BRLT loop2 ;if the input is negative then branch to the second loop
BR loop ;if the input is positive then branch to the first loop

msg: .ASCII "Enter a decimal number: "
newline: .ASCII "\n\x00"
num: .BLOCK 2


loop: DECO num, d ;print the number
STRO newline, d ;print the newline
SUBA 0x0001, i ;subtract 1 from the number
STWA num, d ;store the number
BREQ end ;if the accumlator is zero then branch to the end
BR loop ;branch back to the beginning of the loop

loop2: DECO num, d ;print the number
STRO newline, d ;print the newline
ADDA 0x0001, i ;add 1 to the number
STWA num, d ;store the number
BREQ end ;if the accumlator is zero then branch to the end
BR loop2 ;branch back to the beginning of the loop

end: DECO num, d ;print out zero
STOP ;end

.END