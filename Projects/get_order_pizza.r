# Function to take pizza order
order_pizza <- function() {
  cat("Welcome to PizzaBot! Let's take your order.\n")
  
  cat("What size of pizza would you like? (Small, Medium, Large): ")
  size <- readline()
  
  cat("What toppings would you like on your pizza? (Comma-separated list): ")
  toppings <- strsplit(readline(), ",")[[1]]
  
  cat("Would you like any extra cheese? (Yes/No): ")
  extra_cheese <- readline()
  
  cat("Great! So, you want a ", size, " pizza with ", paste(toppings, collapse = ", "), " and extra cheese: ", extra_cheese, "\n")


# Start the pizza order chatbot
order_pizza()
