*** Settings ***
Library    SeleniumLibrary

***keywords***
Prepare Browser
    [Arguments]    ${URL}    ${Browser}    ${title}   ${username}  ${password} 
    Open Browser    ${URL}    ${Browser} 
    Maximize Browser Window  
    #Title Should Be    ${title}
    Click Element       locator=//*[@id="register-nav"]

    Input Text   id = reg-username    ${username}
    Input Text  id = reg-password  ${password}   
    Click Button  //*[@id="register-form"]/button

    Click Element       //*[@id="login-nav"]
    Input Text  id = login-username  ${username}
    Input Text  id = login-password  ${password}

    Click Button      //*[@id="login-form"]/button

Type In RegUsername 
    [Arguments]   ${username}
    Input Text  id = reg-username  ${username}
Type In RegPassword 
    [Arguments]   ${password}
    Input Text  id = reg-password  ${password}      
Type In Username 
    [Arguments]   ${username}
    Input Text  id = login-username  ${username}
Type In Password 
    [Arguments]   ${password}
    Input Text  id = login-password  ${password}

Message Should Be Visible
    [Arguments]    ${verify_message_element_test}     ${verify_message_test}  ${timeout}
    Wait Until Element Contains   ${verify_message_element_test}    ${verify_message_test}  ${timeout}
    Element Text Should Be   ${verify_message_element_test}    ${verify_message_test}

Error Message Should Be Visible  
    [Arguments]    ${verify_error_message_element_test}    ${verify_error_message_test}  ${timeout}
    Wait Until Element Contains    ${verify_error_message_element_test}  ${verify_error_message_test}   ${timeout}
    Element Text Should Be    ${verify_error_message_element_test}  ${verify_error_message_test} 


