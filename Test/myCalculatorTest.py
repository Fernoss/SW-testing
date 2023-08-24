import unittest
import calculatorUtils

class MyCalculatorTest(unittest.TestCase):
    def test_CalculateSumOfIntegers_A_and_B_AssingValueToInteger_C(self):
        ### Arrange
        a = int(4)
        b = int(7)

        ### Act
        result = calculatorUtils.addition(a,b)

        ### Assert
        self.assertEqual(result, 11)
    
    def test_CalculateSubOfIntegers_A_and_B_AssingValueToInteger_C(self):
        ### Arrange
        a = int(10)
        b = int(5)

        ### Act
        result = calculatorUtils.substraction(a,b)

        ### Assert
        self.assertEqual(result, 5)

    def test_CalculateProOfIntegers_A_and_B_AssingValueToInteger_C(self):
        ### Arrange
        a = int(3)
        b = int(3)

        ### Act
        result = calculatorUtils.multiplication(a,b)

        ### Assert
        self.assertEqual(result, 9)

    def test_CalculateQuotinentOfIntegers_A_and_B_AssingValueToInteger_C(self):
        ### Arrange
        a = int(10)
        b = int(5)

        ### Act
        result = calculatorUtils.division(a,b)

        ### Assert
        self.assertEqual(result, 2)

if (__name__ == "__main__"): ### __name__ = dunder methods -> check python magic and dunder
    unittest.main()