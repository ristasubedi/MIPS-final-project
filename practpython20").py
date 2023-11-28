userprompt = int(input("Enter num >= 25"))
while userprompt < 25:
    print("Illegeal number")
    userprompt = int(input("Enter num >= 25"))

def fibonacci_sequence(n):
    fib_sequence = [0, 1]
    
    while len(fib_sequence) < n:
        fib_sequence.append(fib_sequence[-1] + fib_sequence[-2])
    
    return fib_sequence
# print Fibonacci sequence
fib_sequence = fibonacci_sequence(userprompt + 1)
for num in fib_sequence:
    print(num)