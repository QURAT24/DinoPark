*** Settings ***
Library        SeleniumLibrary
Library        String
Library        Collections
Documentation    Testing Jurasstina-Kalle Park page 
Resource       keywords_Quratulain.robot 
Variables      variables_q.py
Test Setup      Prepare Browser     ${URL}   ${Browser}  ${title}  ${username}  ${password} 


*** Variables ***
#${URL}    file://${EXECDIR}/website/jurap.html
${URL}   file:///C:/Users/QuratulainQureshi/Lab1-RobotFramework/website/jurap.html
${Browser}  Chrome

*** Test Cases ***
Proceed To Checkout
    [Documentation]
...       Scenario: Display the selected booked tickets and the total price amount before checkout.

...      Gherkin syntax :
    ...                  Given that the user booked his tickets and safari tour online according to his requirements.
    ...                  When the user booked all tickets and proceeded to pay,
    ...                  Then the information about all his bookings  and total amount of price should be displayed before checkout.
    ...     Acceptance criteria:
    ...                 - The User should be able to review his selected tickets at the end.
    ...                 - The User should be able to review the total price according to his selected booking.
    ...                 - The total price should calculated accurately.
    ...                 - After the checkout information, the user should be able to proceed to checkout
    
    Prepare Browser       ${URL}  ${Browser}  ${title}  ${username}  ${password}
    Sleep  5s
    #Message Should Be Visible    ${verify_message_element_test}   ${verify_message_test}   ${timeout}
    
    # Reload Page #
    #Sleep     2s

    Click Element       //*[@id="tickets-nav"]

    # Select ticket type #
    Wait Until Element Is Visible  ${Ticket_Type}  ${timeout}
    Select From List By Value  ${Ticket_Type}  ${Adult_Option}  

    # Select ticket category #
    Select From List By Value  ${Ticket_Category}  ${VIP_option}  

    # Select ticket quantity #
    Input Text   ${Ticket_Quantity}  2  # Set the ticket quantity to 2
    
    # Optionally, we can verify the value after setting #
    ${quantity} =  Get Value  ${Ticket_Quantity}
    Should Be Equal As Strings  ${quantity}  2

    # Add items to cart # 
    Click Button    //*[@id="ticket-form"]/button
    # WAIT and verify the alert is present #
    Alert Should Be Present     ${Expected_ALert_Text}   ACCEPT  ${timeout}

    #Reload Page
    Sleep     2s

    Wait Until Element Is Visible  ${Ticket_Type}  ${timeout}
    Select From List By Value  ${Ticket_Type}  ${Child_Option}  

    # Select ticket category #
    Select From List By Value  ${Ticket_Category}  ${VIP_option}  

    # Select ticket quantity #
    Input Text   ${Ticket_Quantity}  2  # Set the ticket quantity to 2
    
    # we can verify the value after setting #
    ${quantity} =  Get Value  ${Ticket_Quantity}
    Should Be Equal As Strings  ${quantity}  2

    # Add items to cart # 
    Click Button    //*[@id="ticket-form"]/button
    # WAIT and verify the alert is present #
    Alert Should Be Present     ${Expected_ALert_Text}   ACCEPT  ${timeout}

    #Reload Page
    Sleep     2s


    Click Element    id: safari-nav       # xpath: //*[@id="safari-nav"]

    #Select weekend Date#
    Input Text  ${Select_Date}  ${Date}

    # Select Safari Type #
    Wait Until Element Is Visible  ${Safari_Type}  ${timeout}
    Select From List By Value  ${Safari_Type}  ${Herbivore_Tour_With_Feeding} 
    # Add to cart #
    Click Button     //*[@id="safari-form"]/button
    # WAIT and verify the alert is present #
    Alert Should Be Present     ${Expected_ALert_Text}   ACCEPT  ${timeout}

    Sleep   2s


    # Open  and review Cart Items #
    Click Element   cart-nav
    Page Should Contain Element    cart-section
    Page Should Contain Element    cart-details 
    Page Should Contain Element    cart-total

    Wait Until Element Is Visible  ${Total_amount}   timeout=10
    
    # Get the text of the element that shows the total amount
    ${total_text}=  Get Text  ${Total_amount}
    #Trim any leading or trailing spaces (if any)
    ${total_text}=  Strip String  ${total_text}
    
    # Verify that the total text matches the expected total (e.g., "$500")
    Should Be Equal As Strings  ${total_text}  ${Expected_Total_Amount}
    
    Click Button       checkout-button

    Alert Should Be Present     ${Expected_ALert_Text_2}   ACCEPT  ${timeout_1}

    #To Logout
    Click Element   logout-nav
    #Click Button     logout-link
    Alert Should Be Present     ${Expected_ALert_Text_3}   ACCEPT  ${timeout_1}


    [Teardown]  Close Browser



