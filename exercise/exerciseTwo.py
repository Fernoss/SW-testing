import unittest
# Joonas Koskinen
# Tehtävä 2: Yksikkötestaus - Erilaiset kolmiot (yksilötehtävä)

def kolmio(kylkiOne, kylkiTwo, kylkiThree):
    if kylkiOne == kylkiTwo == kylkiThree:
        return "Tasasivunen"
    elif kylkiOne == kylkiTwo or kylkiOne == kylkiThree or kylkiTwo == kylkiThree:
        return "Tasakylkinen"
    else:
        return "Epäsäännöllinen"


class TestTriangleClassification(unittest.TestCase):

    def testTasasivuinenKolmio(self):
        self.assertEqual(kolmio(5, 3, 5), "Tasasivunen")

    def testTasakylkinenKolmio(self):
        self.assertEqual(kolmio(1, 2, 3), "Tasakylkinen")

    def testEpäsäännöllinenKolmio(self):
        self.assertEqual(kolmio(7, 7, 12), "Epäsäännöllinen")

if __name__ == '__main__':
    unittest.main()
