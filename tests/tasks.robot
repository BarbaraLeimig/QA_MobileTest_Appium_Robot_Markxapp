*** Settings ***
Documentation         Suite de testes de cadastro de tarefas
Resource              ../resources/base.resource
Test Setup            Abrir app
Test Teardown         Fechar app

*** Test Cases ***
Validar cadastrar uma nova tarefas
    [Tags]    cadastro
    ${task}    Set Variable    Estudar xpath

    Remover tarefa do banco de dados    ${task}
    Fazer login
    Cadastrar nova tarefa               ${task}
    Deve exibir a tarefa                ${task}

Validar remover tarefa
    [Tags]    remover
    ${task}    Set Variable    Comprar refrigerante

    Remover tarefa do banco de dados    ${task}
    Fazer login
    Cadastrar nova tarefa               ${task}
    Deve exibir a tarefa                ${task}
    Remover tarefa                      ${task}
    Não deve exibir a tarefa            ${task}

Validar concluir tarefa
    [Tags]    check
    ${task}    Set Variable    Estudar Robot

    Remover tarefa do banco de dados    ${task}
    Fazer login
    Cadastrar nova tarefa               ${task}
    Deve exibir a tarefa                ${task}
    Concluir tarefa                     ${task}
    A task deve estar concluida         ${task}