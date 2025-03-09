*** Settings *** 

Metadata    Author    Quratulain    
Library        SeleniumLibrary
Library        String
Library        Collections
Documentation  Total price should be display for all bookings in cart
Resource       keywords_Quratulain.robot
Variables      variables_q.py
Test Setup      Prepare Browser     ${URL}   ${Browser}  ${title}  ${username}  ${password} 

*** Variables ***

${URL}    file://${EXECDIR}/website/jurap.html
${Browser}  Chrome

*** Test Cases ***

Total Price Display
    [Tags]    Quratulain
    [Documentation]   Scenario: In the shopping cart, the total price for all entrance and safari booking tickets will be displayed and the total amount should be calculated correctly.

    ...               Gherkin syntax:  Given that the user booked tickets for the entrance and safari trip and added all tickets into the cart.
    ...                                When the user opens the cart,
    ...                                Then the user will able to see the total amount of tickets displayed in the cart,
    ...                                And the amount should be calculated correctly according to his booking and requirements.

    ...                Acceptance Criteria: The user should successfully log in to the Jurasstina -Kally Park.
    ...                                     The user should successfully buy tickets from the website.
    ...                                     The user should successfully add all his booked tickets into the cart.
    ...                                     The User should be able to review his selected tickets at the end .
    ...                                     The User should be able to review the total price according to his selected booking.
    ...                                     The total price should calculated accurately.
    
    Prepare Browser       ${URL}  ${Browser}  ${title}  ${username}  ${password}
    Sleep     60s
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
    
    # Optionally, we can verify the value after setting #
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
    
    # Verify that the total amount matches the expected total( $500)
    Should Be Equal As Strings  ${total_text}  ${Expected_Total_Amount}
    [Teardown]  Close Browser





