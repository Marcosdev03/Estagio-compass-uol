*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://serverest.dev

*** Keywords ***
Login de Usuário
    [Arguments]    ${email}    ${password}
    ${body}=    Create Dictionary
    ...    email=${email}
    ...    password=${password}
    ${headers}=    Create Dictionary    Content-Type=application/json
    Create Session    serverest    ${BASE_URL}
    ${response}=    POST On Session    serverest    /login    json=${body}    headers=${headers}    expected_status=any
    [Return]    ${response}
