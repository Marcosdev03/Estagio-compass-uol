*** Settings ***
Library    RequestsLibrary
Documentation    Keywords para testes de atualização de usuário com email já usado

*** Variables ***
${BASE_URL}    https://serverest.dev

*** Keywords ***
Atualizar Usuário com Email de Outro
    [Documentation]    Tenta atualizar um usuário usando email já utilizado por outro usuário
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
