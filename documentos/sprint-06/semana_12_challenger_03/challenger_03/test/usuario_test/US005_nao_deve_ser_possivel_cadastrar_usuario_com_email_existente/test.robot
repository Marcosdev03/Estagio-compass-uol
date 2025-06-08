*** Settings ***
Documentation    US005-CT01 - Atualização de usuário com e-mail já usado por outro usuário
Resource         ../../../resource/keywords/usuario_keys/US005_nao_deve_ser_possivel_cadastrar_usuario_com_email_existente/keywords.robot
Resource         ../../../resource/common/utils.robot
Library          BuiltIn
Library          Collections
Library          String

*** Test Cases ***
US005-CT01 - Atualização de Usuário com E-mail Já Usado por Outro
    [Documentation]    Garante que a API retorna 400 quando o e-mail já está em uso por outro usuário.
    
    # Primeiro criamos dois usuários para garantir que temos IDs válidos e emails diferentes
    ${random_string1}=    Generate Random String    8    [LOWER]
    ${timestamp1}=    Evaluate    int(time.time())    modules=time
    ${nome1}=    Set Variable    Usuario1_${random_string1}_${timestamp1}
    ${email1}=    Set Variable    usuario1_${random_string1}_${timestamp1}@empresa.com
    ${password1}=    Set Variable    SenhaForte123
    ${administrador1}=    Set Variable    true
    
    ${body1}=    Create Dictionary
    ...    nome=${nome1}
    ...    email=${email1}
    ...    password=${password1}
    ...    administrador=${administrador1}
    ${headers}=    Create Dictionary    Content-Type=application/json
    Create Session    serverest    https://serverest.dev
    ${create_response1}=    POST On Session    serverest    /usuarios    json=${body1}    headers=${headers}    expected_status=any
    ${json1}=    Set Variable    ${create_response1.json()}
    ${id1}=    Set Variable    ${json1}[_id]
    
    # Criando segundo usuário
    ${random_string2}=    Generate Random String    8    [LOWER]
    ${timestamp2}=    Evaluate    int(time.time())    modules=time
    ${nome2}=    Set Variable    Usuario2_${random_string2}_${timestamp2}
    ${email2}=    Set Variable    usuario2_${random_string2}_${timestamp2}@empresa.com
    ${password2}=    Set Variable    SenhaForte123
    ${administrador2}=    Set Variable    false
    
    ${body2}=    Create Dictionary
    ...    nome=${nome2}
    ...    email=${email2}
    ...    password=${password2}
    ...    administrador=${administrador2}
    ${create_response2}=    POST On Session    serverest    /usuarios    json=${body2}    headers=${headers}    expected_status=any
    ${json2}=    Set Variable    ${create_response2.json()}
    ${id2}=    Set Variable    ${json2}[_id]
    
    # Agora tentamos atualizar o usuário 2 com o email do usuário 1
    ${response}=    Atualizar Usuário com Email de Outro    ${id2}    ${nome2}    ${email1}    ${password2}    ${administrador2}
    
    # Validações da resposta de erro
    ${json}=    Validar Resposta Erro    ${response}    400    message    Este email já está sendo usado
    Log    Resposta da tentativa de atualização: ${json}
