# convert from decimal to a base R
decimal = float(input("Enter a decimal number: "))
base = int(input("Enter a base number: "))
output = []

# convert decimal to a base R
while decimal > 0:
    output.append(int(decimal % base))
    decimal = decimal // base

# print output
output.reverse()
for i in output:
    print(i, end="")
