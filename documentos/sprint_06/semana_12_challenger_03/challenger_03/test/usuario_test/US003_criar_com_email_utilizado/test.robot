*** Settings ***
Documentation    CT01 - Tentativa de criar usuário com e-mail já cadastrado
Resource         ../../../resource/keywords/usuario_keys/US003_criar_com_email_utilizado/keywords.robot
Library          BuiltIn
Library          Collections
Library          String

*** Test Cases ***
CT01 - Criar Usuário com E-mail Já Cadastrado
    # Primeiro criamos um usuário para garantir que o email existe
    ${random_string}=    Generate Random String    8    [LOWER]
    ${timestamp}=    Evaluate    int(time.time())    modules=time
    ${nome}=    Set Variable    Usuario_${random_string}_${timestamp}
    ${email}=    Set Variable    usuario_${random_string}_${timestamp}@empresa.com
    ${password}=    Set Variable    SenhaForte123
    ${administrador}=    Set Variable    true
    
    # Criando o primeiro usuário
    ${body1}=    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=${password}
    ...    administrador=${administrador}
    ${headers}=    Create Dictionary    Content-Type=application/json
    Create Session    serverest    https://serverest.dev
    ${create_response}=    POST On Session    serverest    /usuarios    json=${body1}    headers=${headers}    expected_status=any
    
    # Tentando criar outro usuário com o mesmo email
    ${nome2}=    Set Variable    ${nome}_duplicado
    ${response}=    Criar Usuário Com Email Existente    ${nome2}    ${email}    ${password}    ${administrador}
    
    # Validando a resposta de erro
    Should Be Equal As Strings    ${response.status_code}    400
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    message
    Should Be Equal As Strings    ${json}[message]    Este email já está sendo usado
    Log    Tentativa de criação de usuário duplicado: ${json}
