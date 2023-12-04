# Function to play the game
play_game <- function() {
  options <- c("scissor", "paper", "hammer")
  computer_choice <- sample(options, 1)
  
  cat("Enter your choice (scissor, paper, or hammer): ")
  user_choice <- readline()
  
  if (user_choice %in% options) {
    cat("Computer's choice: ", computer_choice, "\n")
    cat("Your choice: ", user_choice, "\n")
    
    if (user_choice == computer_choice) {
      cat("It's a tie!\n")
    } else if ((user_choice == "scissor" && computer_choice == "paper") ||
               (user_choice == "paper" && computer_choice == "hammer") ||
               (user_choice == "hammer" && computer_choice == "scissor")) {
      cat("You win!\n")
    } else {
      cat("Computer wins!\n")
    }
  } else {
    cat("Please enter a valid choice (scissor, paper, or hammer).\n")
    play_game()  # Play again if invalid input
  }
}

# Start the game
play_game()
