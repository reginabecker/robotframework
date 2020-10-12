*** Settings ***
Resource     base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Selecionando por Id
    Go To                                   ${url}radios
    Select Radio Button                     movies      cap      
    # Verificando se a opção foi marcada
    Radio Button Should Be Set To           movies      cap      

Selecionando por Value    
    Go To                                   ${url}radios
    # Funciona por ID e por Value
    Select Radio Button                     movies      guardians      
    # Verificando se a opção foi marcada
    Radio Button Should Be Set To           movies      guardians      