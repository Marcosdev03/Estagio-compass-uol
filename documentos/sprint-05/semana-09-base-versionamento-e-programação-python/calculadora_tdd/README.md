#  Projeto: Calculadora TDD

Este projeto é uma calculadora desenvolvida com Python utilizando a abordagem de **Test-Driven Development (TDD)**. Foi realizado como parte das atividades do estágio na Compass UOL.

---

## Tecnologias Utilizadas

- Python 3.12
- Pytest 8.3.5
- Conda (Ambiente virtual)
- VSCode (opcional)

---

## ⚙ Como configurar o ambiente

1. **Clone o repositório:**

```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
cd nome-da-pasta
```

2. **Crie e ative o ambiente Conda:**

```bash
conda create --name calculadora_tdd python=3.12
conda activate calculadora_tdd
```

3. **Instale as dependências:**

```bash
pip install -r requirements.txt
```

> Caso o arquivo `requirements.txt` não exista, use:

```bash
pip install pytest
```

---

## Executando os testes

Dentro da raiz do projeto, execute:

```bash
pytest
```

Todos os testes estão localizados na pasta `tests/`.

---

## Estrutura do projeto

```
calculadora_tdd/
├── calculadora.py
├── tests/
│   └── test_calculadora.py
├── pytest.ini
└── README.md
```

---

## 📄 Licença

Este projeto é apenas para fins educacionais.
