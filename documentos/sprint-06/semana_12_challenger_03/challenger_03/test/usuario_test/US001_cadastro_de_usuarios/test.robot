*** Settings ***
Documentation    Teste para criar um usuário novo na API Serverest
Resource         ../../../resource/keywords/usuario_keys/US001_cadastro_de_usuarios/keywords.robot
Resource         ../../../resource/common/utils.robot
Library          BuiltIn
Library          Collections
Library          String

*** Variables ***
${BASE_URL}      https://serverest.dev

*** Test Cases ***
CT01 - Criação de Usuário com todos os campos
    # Gerando dados únicos para o teste usando a keyword comum
    &{dados}=    Gerar Dados Aleatorios
    
    ${response}=    Criar Usuário    ${dados.nome}    ${dados.email}    ${dados.password}    ${dados.administrador}
    
    # Validações do status e da resposta usando a keyword comum
    ${json}=    Validar Resposta Sucesso    ${response}    201    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${json}    _id
    Should Not Be Empty    ${json}[_id]
    Log    Usuário criado com sucesso: ${json}

CT02 - Tentativa de Criação de Usuário sem Nome
    # Gerando dados únicos para o teste
    &{dados}=    Gerar Dados Aleatorios    teste

    ${response}=    Criar Usuário Sem Nome    ${dados.email}    ${dados.password}    ${dados.administrador}
    
    # Validações usando a keyword comum
    ${json}=    Validar Resposta Erro    ${response}    400    nome    nome é obrigatório
    Log    Validação correta: ${json}

CT03 - Tentativa de Criação de Usuário sem E-mail
    # Gerando dados únicos para o teste
    &{dados}=    Gerar Dados Aleatorios

    ${response}=    Criar Usuário Sem Email    ${dados.nome}    ${dados.password}    ${dados.administrador}
    
    # Validações usando a keyword comum
    ${json}=    Validar Resposta Erro    ${response}    400    email    email é obrigatório
    Log    Validação correta: ${json}


CT04 - Tentativa de Criação de Usuário sem Senha
    # Gerando dados únicos para o teste
    &{dados}=    Gerar Dados Aleatorios

    ${response}=    Criar Usuário Sem Senha    ${dados.nome}    ${dados.email}    ${dados.administrador}
    
    # Validações usando a keyword comum
    ${json}=    Validar Resposta Erro    ${response}    400    password    password é obrigatório
    Log    Validação correta: ${json}