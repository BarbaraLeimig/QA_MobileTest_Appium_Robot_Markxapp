*** Settings ***
Documentation        Elementos e ações da tela minhas tarefas
Library              AppiumLibrary
Library              ../libs/mongo.py
Resource             ../../config/config.robot

*** Variables ***
${create_button}     xpath=//*[@resource-id="createTask"]
${yes_button}    xpath=//android.widget.Button[@text="SIM"]

*** Keywords ***
Cadastrar nova tarefa
    [Arguments]                  ${task_name}
    Input Text                   xpath=//*[@resource-id="newTask"]    ${task_name}
    Click Element                ${create_button}
    Sleep    3

Deve exibir a tarefa
    [Arguments]                  ${task_name}
    Wait Until Element Is Visible
    ...                          xpath=//*[@resource-id="taskText"][@text="${task_name}"]
    ...                          3

Remover tarefa
    [Arguments]                         ${task_name}
    Click Element                       xpath=//*[@text="${task_name}"]/../..//*[@resource-id="removeTask"]
    Wait Until Element Is Visible       ${yes_button}   5
    Click Element                       ${yes_button}
    
Não deve exibir a tarefa
    [Arguments]                         ${task_name}
    Wait Until Page Does Not Contain    
    ...                                 xpath=//*[@text="${task_name}"]/../..//*[@resource-id="removeTask"]
    ...                                 5

Concluir tarefa   
    [Arguments]                        ${task_name}
    Click Element                      xpath=//*[@text="${task_name}"]/..

A task deve estar concluida
    [Arguments]                        ${task_name}
    Wait Until Element Is Visible       xpath=//*[@text="${task_name}"]/..//android.widget.ImageView