order_pizza <- function() {
  ## Bot: Greeting and name capture
  print("Hi!")
  u_name <- readline("What's your name? ")
  print(paste0("Welcome to our online restaurant, ", u_name))
  
  ## Bot: Define menu items and their prices in a named vector
  menus <- c(haiwaian = 20, cheese = 25, coke = 5) 
  
  ## User: Display menu options to the customer
  print("Our menu: Hawaiian = $20, Cheese = $25, Coke = $5")
  
  # Initialize total bill variable starting at zero
  bill = 0
  
  ## Bot: Start order loop to summarize total order and cost
  while(TRUE){
    # Capture the specific item and quantity from the user
    ord <- readline("Which menu item would you like? : ")
    
    # Convert quantity input from string to numeric for calculation
    qty <- as.numeric(readline("How many? : "))
    
    # Logic to match input with menu prices and update the bill
    if(ord == "haiwaian"){
      bill = bill + (menus[1] * qty)
    } else if (ord == "cheese"){
      bill = bill + (menus[2] * qty)
    } else if (ord == "coke"){
      bill = bill + (menus[3] * qty)
    } else {
      # Error handling for invalid menu selections
      print("Your input is not valid")
    }
    
    # Check if the customer wants to continue ordering
    end <- readline("Would you like to order anything else? (Y/N): ")
    if(end == "N" ){
      # Final summary and exit loop
      print(paste0("Your total bill is $", bill, ". Goodbye!"))
      break
    }
  }
}
