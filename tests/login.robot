*** Settings ***
Documentation       Testes de login
Resource            ../resources/base.resource
Test Setup          Abrir app
Test Teardown       Fechar app

*** Test Cases ***
Validar login com sucesso
    [Documentation]    Teste de login com sucesso
    [Tags]             login
    Fazer login