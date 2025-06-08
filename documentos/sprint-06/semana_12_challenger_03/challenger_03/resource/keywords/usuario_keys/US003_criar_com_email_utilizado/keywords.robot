*** Settings ***
Library    RequestsLibrary
Documentation    Keywords para testes de criação de usuário com email já cadastrado

*** Variables ***
${BASE_URL}    https://serverest.dev

*** Keywords ***
Criar Usuário Com Email Existente
    [Documentation]    Tenta criar um usuário com email já existente
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
