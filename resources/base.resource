*** Settings ***
Documentation     Keywords base para os testes do app Markx
Library           AppiumLibrary
Library           libs/mongo.py
Resource          screens/login.resource
Resource          screens/tasks.resource

*** Keywords ***
Abrir app
    Open Application    http://localhost:4723
    ...                 automationName=uiautomator2
    ...                 platformName=Android
    ...                 deviceName=Emulator
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true
    ...                 app=${EXECDIR}/apps/markx.apk

    Wait Until Page Contains    Endereço IP da Api    10
    Sleep    3

Fechar app
    Capture Page Screenshot
    Close Application