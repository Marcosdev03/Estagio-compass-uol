from src.calculadora import Calculadora

def test_soma():
    calc = Calculadora()
    assert calc.somar(2, 3) == 5

def test_subtracao():
    calc = Calculadora()
    assert calc.subtrair(5, 2) == 3

def test_multiplicacao():
    calc = Calculadora()
    assert calc.multiplicar(3, 4) == 12

def test_divisao():
    calc = Calculadora()
    assert calc.dividir(10, 2) == 5
