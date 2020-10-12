*** Settings ***
Library     app.py

*** Test Cases ***
Deve retornar mensagem de boas vindas
    #Criar variável recebe resultado

    ${result}=          welcome     Fernando       
    Log To Console      ${result}
    Should Be Equal     ${result}   Olá Fernando, Bem vindo ao Curso Básico de Robot Framework!
