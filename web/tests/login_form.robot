*** Settings ***
Resource     base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Login com sucesso
# seletor css
            Go To                               ${url}login
            Login With                          stark   jarvis!
            Should See Logged User              Tony Stark

Senha inválida
            [tags]                              login_error
            Go To                               ${url}login
            Login With                          stark   jarvis
            Should Contain Alert                Senha é invalida!

Usuário não existe   
            [tags]                              login_user
            Go To                               ${url}login
            Login With                          regina  jarvis!
            Should Contain Alert                O usuário informado não está cadastrado!
            Sleep                               5              

*** Keywords ***
Login With
    [Arguments]     ${uname}    ${pass}
    Input Text                          css:input[name=username]    ${uname}
    Input Text                          css:input[name=password]    ${pass}
    Click Element                       class:btn-login
    
Should Contain Alert    
    [Arguments]     ${expect_message}
    ${message}=                         Get WebElement              id:flash
    Should Contain                      ${message.text}             ${expect_message}

Should See Logged User
    [Arguments]     ${full_name}
    Page Should Contain                 Olá, ${full_name}. Você acessou a área logada!