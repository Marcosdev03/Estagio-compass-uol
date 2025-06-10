*** Settings ***
Library    RequestsLibrary
Documentation    Keywords para testes de cadastro de usuários

*** Variables ***
${BASE_URL}    https://serverest.dev

*** Keywords ***
Criar Usuário
    [Documentation]    Cria um novo usuário na API
    [Arguments]    ${nome}    ${email}    ${password}    ${administrador}
    ${body}=    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=${password}
    ...    administrador=${administrador}
    ${headers}=    Create Dictionary    Content-Type=application/json
    Create Session    serverest    ${BASE_URL}
    ${response}=    POST On Session    serverest    /usuarios    json=${body}    headers=${headers}    expected_status=any
    [Return]    ${response}

Criar Usuário Sem Nome
    [Documentation]    Tenta criar um usuário sem fornecer o nome
    [Arguments]    ${email}    ${password}    ${administrador}
    ${body}=    Create Dictionary
    ...    email=${email}
    ...    password=${password}
    ...    administrador=${administrador}
    ${headers}=    Create Dictionary    Content-Type=application/json
    Create Session    serverest    ${BASE_URL}
    ${response}=    POST On Session    serverest    /usuarios    json=${body}    headers=${headers}    expected_status=any
    [Return]    ${response}
    
Criar Usuário Sem Email
    [Documentation]    Tenta criar um usuário sem fornecer o email
    [Arguments]    ${nome}    ${password}    ${administrador}
    ${body}=    Create Dictionary
    ...    nome=${nome}
    ...    password=${password}
    ...    administrador=${administrador}
    ${headers}=    Create Dictionary    Content-Type=application/json
    Create Session    serverest    ${BASE_URL}
    ${response}=    POST On Session    serverest    /usuarios    json=${body}    headers=${headers}    expected_status=any
    [Return]    ${response}


Criar Usuário Sem Senha
    [Documentation]    Tenta criar um usuário sem fornecer a senha
    [Arguments]    ${nome}    ${email}    ${administrador}
    ${body}=    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    administrador=${administrador}
    ${headers}=    Create Dictionary    Content-Type=application/json
    Create Session    serverest    ${BASE_URL}
    ${response}=    POST On Session    serverest    /usuarios    json=${body}    headers=${headers}    expected_status=any
    [Return]    ${response}