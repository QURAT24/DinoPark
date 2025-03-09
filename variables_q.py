#Author : Quratulain
import os 

# Directory
current_directory = os.getcwd().replace('\\', '/')


#URL = f"file://${EXECDIR}webpage-jurap/jurap.html"

Browser = "Chrome"
title = "Jura-Stina-Kalle Park"

# valid username and password for register and login
username = "username"
password =  "12345678"

#Time to appear till #
timeout =   "10s"
timeout_1 = "15s"

# Messages and their locators that appear in the test
verify_message_element_test = "id=login-message" 
verify_message_test = "Verifying credentials..." 
verify_error_message_element_test =  "id = login-message"     
verify_error_message_test = "Invalid username or password."

#Ticket type
Ticket_Type = "id: ticket-type"
Adult_Option  =  "Adult"   #xpath=//*[@id="ticket-type"]/option[1]
Child_Option =    "Child"

# Tickets category
Ticket_Category =  "id: ticket-category"
VIP_option   =  "VIP"

# Tickets quantity
Ticket_Quantity =  "id = ticket-quantity"

#Select date to safari
Select_Date =   "id: safari-date"
Date = "03-15-2025"
Safari_Type =  "id: safari-type"

#Select safari tour
Herbivore_Tour_With_Feeding =   "Herbivore Tour with Feeding"
Total_amount = "id:cart-total"

# Total amount of ticket
Expected_Total_Amount = "Total: $500"

#Alert display on screen to accept #
Expected_ALert_Text = "Item added to cart!"
Expected_ALert_Text_2 ='Checkout Summary: 2 VIP Adult Ticket(s) - $200 2 VIP Child Ticket(s) - $120 Herbivore Tour with Feeding on 2025-03-15 - $180 Total: $500'
Expected_ALert_Text_3 = "You have been logged out."
Expected_ALert_Text_4 = 'Checkout Summary: 3 VIP Adult Ticket(s) - $300 Total: $300'

