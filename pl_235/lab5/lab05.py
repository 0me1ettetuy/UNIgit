def sine(x):
    res = 0
    plus = True
    for i in range (1, 101, 2):
        if plus:
            res += pow(x, i)/fact(int(i))
            plus = False
        else:
            res -= pow(x, i)/fact(int(i))
            plus = True
    print(res)

def fact(n):
    fact = 1
    for i in range(1, n + 1):
        fact *= i
    return  fact

def collatz():
    try:
        n = input("Please type a number greater than one or 'quit' to quit\n")
        if n == 'q' or n == 'Q' or n == "quit":
            return
        n = int(n)
        if n <= 1:
            print("you typed {}, which is not greater than one ".format(n))
            collatz()
        print("Giving collatz sequence for {}\n".format(n))
        i = 1
        while n != 1:
            if n % 2 == 0:
                n = n // 2
            else:
                n = 3*n + 1
            print("iteration {} results in {}".format(i, n))
            i += 1
        collatz()
    except ValueError:
        print("Input value should be an integer...")