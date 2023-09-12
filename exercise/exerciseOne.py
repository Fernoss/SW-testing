import unittest
# Joonas Koskinen
# Tehtävä 1: Yksikkötestaus - Age (yksilötehtävä)

def determineAgeGroup(age):
    if age < int(18):
        return "You are a child / Olet lapsi"
    elif age < int(70):
        return "You are an adult / Olet aikuinen"
    else:
        return "You are a pensioner / Olet eläkeläinen"

# Unit tests
class TestAgeGroup(unittest.TestCase):
    
    # 1. test - result for child
    def testChild(self):
        # Arrange
        age = int(10)
        # Act
        result = determineAgeGroup(age)
        # Assert
        self.assertEqual(result, "You are a chil / Olet lapsi")
    # 2. test - result for adult
    def testAdult(self):
        age = int(35)
        result = determineAgeGroup(age)
        self.assertEqual(result, "You are a adult / Olet aikuinen")
    # 3. test - result for pensioner
    def testPensioner(self):
        age = int(75)
        result = determineAgeGroup(age)
        self.assertEqual(result, "You are a pensioner / Olet elkeläinen")

if __name__ == '__main__':
    unittest.main()
