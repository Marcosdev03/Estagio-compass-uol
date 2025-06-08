*** Settings ***
Library    String
Library    Collections
Library    BuiltIn

*** Keywords ***
Gerar Dados Aleatorios
    [Documentation]    Gera dados aleatórios para testes
    [Arguments]    ${prefixo}=usuario
    ${random_string}=    Generate Random String    8    [LOWER]
    ${timestamp}=    Evaluate    int(time.time())    modules=time
    ${nome}=    Set Variable    ${prefixo}_${random_string}_${timestamp}
    ${email}=    Set Variable    ${prefixo}_${random_string}_${timestamp}@empresa.com
    ${password}=    Set Variable    SenhaForte123
    ${administrador}=    Set Variable    true
    &{dados}=    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=${password}
    ...    administrador=${administrador}
    [Return]    ${dados}

Validar Resposta Sucesso
    [Documentation]    Valida uma resposta de sucesso
    [Arguments]    ${response}    ${status_code}=200    ${mensagem}=Operação realizada com sucesso
    Should Be Equal As Strings    ${response.status_code}    ${status_code}
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    message
    Should Be Equal As Strings    ${json}[message]    ${mensagem}
    [Return]    ${json}

Validar Resposta Erro
    [Documentation]    Valida uma resposta de erro
    [Arguments]    ${response}    ${status_code}    ${campo_erro}    ${mensagem_erro}
    Should Be Equal As Strings    ${response.status_code}    ${status_code}
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    ${campo_erro}
    Should Be Equal As Strings    ${json}[${campo_erro}]    ${mensagem_erro}
    [Return]    ${json}