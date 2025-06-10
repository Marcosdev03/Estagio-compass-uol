"""Módulo que implementa a classe Calculadora com operações básicas."""

class Calculadora:
    """Classe responsável por realizar operações matemáticas básicas."""

    def somar(self, a, b):
        return a + b

    def subtrair(self, a, b):
        return a - b

    def multiplicar(self, a, b):
        return a * b

    def dividir(self, a, b):
        if b == 0:
            raise ValueError("Divisão por zero")
        return a / b
