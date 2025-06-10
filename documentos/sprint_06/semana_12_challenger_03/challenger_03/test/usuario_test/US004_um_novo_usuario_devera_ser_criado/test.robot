*** Settings ***
Documentation    CT001 - PUT com ID inexistente deve criar novo usuário
Resource         ../../../resource/keywords/usuario_keys/US004_um_novo_usuario_devera_ser_criado/keywords.robot
Resource         ../../../resource/common/utils.robot
Library          BuiltIn
Library          Collections
Library          String

*** Test Cases ***
CT001 - PUT com ID inexistente cria novo usuário
    # Gerando dados aleatórios para o teste
    ${random_string}=    Generate Random String    8    [LOWER]
    ${timestamp}=    Evaluate    int(time.time())    modules=time
    ${id}=    Set Variable    999999
    ${nome}=    Set Variable    Usuario_${random_string}_${timestamp}
    ${email}=    Set Variable    usuario_${random_string}_${timestamp}@empresa.com
    ${password}=    Set Variable    SenhaForte123
    ${administrador}=    Set Variable    true

    ${response}=    Atualizar ou Criar Usuário com PUT    ${id}    ${nome}    ${email}    ${password}    ${administrador}
    
    # Validações usando a keyword comum
    ${json}=    Validar Resposta Sucesso    ${response}    201    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${json}    _id
    Should Not Be Empty    ${json}[_id]
    Log    Usuário criado com sucesso via PUT: ${json}
