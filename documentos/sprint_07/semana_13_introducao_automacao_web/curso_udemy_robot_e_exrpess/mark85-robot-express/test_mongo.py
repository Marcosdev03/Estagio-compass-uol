from pymongo import MongoClient
import sys

try:
    print("Tentando conectar ao MongoDB...")
    client = MongoClient('mongodb+srv://qa:10874910@cluster0.bvytpwy.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0', 
                         serverSelectionTimeoutMS=5000)
    print("Verificando conexão...")
    client.server_info()  # Isso vai lançar uma exceção se não conseguir conectar
    print("Conexão com MongoDB bem-sucedida!")
    
    # Tenta acessar o banco de dados e coleções
    db = client['markdb']
    users = db['users']
    print(f"Número de usuários na coleção: {users.count_documents({})}")
    
except Exception as e:
    print(f"Erro ao conectar ao MongoDB: {e}")
    print(f"Tipo de erro: {type(e)}")
    sys.exit(1)