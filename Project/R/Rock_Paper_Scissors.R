play_pyc <- function() {
  # Define the available choices for the game
  hands <- c("kon", "gungai", "kradad")
  
  # Start an infinite loop to keep the game running until the user quits
  while(TRUE) {
    # Prompt the user to input their choice
    user_hand <- readline("Choose your hand (kon, gungai, kradad or 'exit'): ")
    
    # Check if the user wants to terminate the game
    if(user_hand == "exit"){
      print("Goodbye")
      break # Exit the while loop
    }
    
    # Randomly select a hand for the computer from the 'hands' vector
    comp_hand <- sample(hands, 1)
    
    # Logic to determine the game outcome
    if(user_hand == comp_hand){
      # Outcome if both hands are the same
      print("Draw")
    } else if (user_hand == "kon" & comp_hand == "kradad"){
      print("You lose")
    } else if (user_hand == "kon" & comp_hand == "gungai"){
      print("You win")
    } else if (user_hand == "gungai" & comp_hand == "kon"){
      print("You lose")
    } else if (user_hand == "gungai" & comp_hand == "kradad"){
      print("You win")
    } else if (user_hand == "kradad" & comp_hand == "gungai"){
      print("You lose")
    } else if (user_hand == "kradad" & comp_hand == "kon"){
      print("You win")
    } else {
      # Handle cases where the user inputs an invalid string
      print("Invalid input: please enter only kon, gungai, or kradad")
    }
  }
}
