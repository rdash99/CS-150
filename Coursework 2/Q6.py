num1 = input()
num2 = int(input())

i = int(num1)
j = 0

while i > 0:
    j = j + 3
    if j > num2:
        print(j)
        i = i-1
    i = i-1
