*** Settings ***
Documentation    Teste para login de usuário na API Serverest
Resource         ../../../resource/keywords/usuario_keys/US002_login_com_usuario_inexistente/keywords.robot
Resource         ../../../resource/keywords/usuario_keys/US001_cadastro_de_usuarios/keywords.robot
Resource         ../../../resource/common/utils.robot
Library          BuiltIn
Library          Collections
Library          String

*** Variables ***
${BASE_URL}      https://serverest.dev

*** Test Cases ***
CT01 - Login com Usuário Inexistente
    # Gerando dados aleatórios usando a keyword comum
    &{dados}=    Gerar Dados Aleatorios    inexistente
    ${email}=    Set Variable    ${dados.email}
    ${password}=    Set Variable    SenhaForte123

    ${response}=    Login de Usuário    ${email}    ${password}
    
    # Validações usando a keyword comum
    ${json}=    Validar Resposta Erro    ${response}    401    message    Email e/ou senha inválidos
    Log    Validação correta para usuário inexistente: ${json}