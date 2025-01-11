*** Settings ***
Documentation        Elementos e ações da tela de Login
Library              AppiumLibrary
Resource             ../../config/config.robot

*** Keywords ***
Fazer login
    Input Text                      xpath=//*[@resource-id="apiIp"]    ${API_IP}
    Click Element                   xpath=//*[@resource-id="signInButton"]
    Wait Until Page Contains        Minhas tarefas    5
