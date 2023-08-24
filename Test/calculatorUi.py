import calculatorUtils

operand = 'start'

while (operand != 'exit'):

    operand = input("Do you want '+', '-', '*' or, '/' operator? To exit, type 'exit': ")

    if (operand != "exit"):
        if (operand == "+" or operand == "-" or operand == "*" or operand == "/"):

            number1Given = False
            number2Given = False

            while (not number1Given):
                try:
                    number1 = int(input("Give me number 1: ")) #int() important, otherwise variable is str
                    number1Given = True
                except Exception:
                    print("Unfortunately you didn't provide a number. Please try again!")

            while (not number2Given):
                try:
                    number2 = int(input("Give me number 2: "))
                    number2Given = True
                except Exception:
                    print("Unfortunately you didn't provide a number. Please try again!")

            match operand:
                case "+":
                    print(calculatorUtils.addition(number1, number2))
                case "-":
                    print(calculatorUtils.substraction(number1, number2))
                case "*":
                    print(calculatorUtils.multiplication(number1, number2))
                case "/":
                    print(calculatorUtils.division(number1, number2))
    else:
        print("Thank you for using this app!")
