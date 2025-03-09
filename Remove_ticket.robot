*** Settings ***
Library        SeleniumLibrary
Library        String
Library        Collections
Documentation    Testing Jurasstina-Kalle Park page 
#Resource       keywords_Quratulain.robot 
#Variables      variables_q.py
Test Setup      Prepare Browser     ${URL}   ${Browser}  ${title}  ${username}  ${password} 


*** Variables ***
${URL}    file://${EXECDIR}/website/jurap.html

*** Test Cases ***

Remove Or Cancel Ticket(s)   
    [Documentation]   Scenario:         The user should be able to cancel or remove the ticket from the cart after booking it.

...                  Gherkin syntax:     Given that the user has booked failed ticket(s) and added to the cart.
...                                      When the user opens and reviews his booked tickets in the cart
...                                      And he mistakenly booked the wrong ticket(s) according to his requirements,
...                                      Then the user should be able to remove the unwanted ticket (s) from the cart,
...                                      And the cart should upgrade his booking after removing his unwanted ticket(s).

...                  Acceptance criteria: The user should to able to log in and book tickets according to his requirements.
...                                       The user should be able to add his book tickets to the cart.
...                                       The user should be able to remove and cancel unwanted ticket(s) according to his requirements.
    
    Prepare Browser       ${URL}  ${Browser}  ${title}  ${username}  ${password}
    #Reload Page #
    Sleep     2s

    Click Element       //*[@id="tickets-nav"]

    # Select ticket type #
    Wait Until Element Is Visible  ${Ticket_Type}  ${timeout}
    Select From List By Value  ${Ticket_Type}  ${Adult_Option}  
    Select From List By Value  ${Ticket_Category}  ${VIP_option}  

    # Select ticket quantity #
    Input Text   ${Ticket_Quantity}  3  # Set the ticket quantity to 3

    # Add items to cart # 
    Click Button    //*[@id="ticket-form"]/button
    # WAIT and verify the alert is present #
    Alert Should Be Present     ${Expected_ALert_Text}   ACCEPT  ${timeout}

    Sleep   2s

    Wait Until Element Is Visible  ${Ticket_Type}  ${timeout}
    Select From List By Value  ${Ticket_Type}  ${Adult_Option}  
    Select From List By Value  ${Ticket_Category}  ${VIP_option}  

    # Select ticket quantity #
    Input Text   ${Ticket_Quantity}  4  # Set the ticket quantity to 3

    # Add items to cart # 
    Click Button    //*[@id="ticket-form"]/button
    # WAIT and verify the alert is present #
    Alert Should Be Present     ${Expected_ALert_Text}   ACCEPT  ${timeout}

    Sleep  2s

    # Open  and review Cart Items #
    Click Element   cart-nav
    Page Should Contain Element    cart-section
    Page Should Contain Element    cart-details 
    
    Click Button    //*[@id="cart-details"]/ul/li[2]/button  # To remove  the second index item from the cart
    Click Button       checkout-button                        # to proceed to checkout
    Alert Should Be Present     ${Expected_ALert_Text_4}   ACCEPT  ${timeout_1}

    [Teardown]  Close Browser



***keywords***
Prepare Browser
    [Arguments]    ${URL}    ${Browser}    ${title}   ${username}  ${password} 
    Open Browser    ${URL}    ${Browser} 
    Maximize Browser Window  
    Title Should Be    ${title}
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
