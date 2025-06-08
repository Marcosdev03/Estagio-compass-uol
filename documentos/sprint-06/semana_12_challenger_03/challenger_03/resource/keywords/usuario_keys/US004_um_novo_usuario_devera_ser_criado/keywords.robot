*** Settings ***
Library    RequestsLibrary
Documentation    Keywords para testes de atualização ou criação de usuário com PUT

*** Variables ***
${BASE_URL}    https://serverest.dev

*** Keywords ***
Atualizar ou Criar Usuário com PUT
    [Documentation]    Atualiza um usuário existente ou cria um novo se o ID não existir
    [Arguments]    ${id}    ${nome}    ${email}    ${password}    ${administrador}
    ${body}=    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=${password}
    ...    administrador=${administrador}
    ${headers}=    Create Dictionary    Content-Type=application/json
    Create Session    serverest    ${BASE_URL}
    ${response}=    PUT On Session    serverest    /usuarios/${id}    json=${body}    headers=${headers}    expected_status=any
    [Return]    ${response}
