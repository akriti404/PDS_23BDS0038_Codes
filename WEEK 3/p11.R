# Function to get input from the user
gettxtinpt <- function() {
  user_input <- readline(prompt = "Enter your input: ")
  return(user_input)
}

# Test the function with different sets of inputs
cat("Test Case 1: User input is 'Hello, world!'\n")
cat("User input:", gettxtinpt(), "\n\n")

cat("Test Case 2: User input is '42'\n")
cat("User input:", gettxtinpt(), "\n\n")

cat("Test Case 3: User input is 'R programming'\n")
cat("User input:", gettxtinpt(), "\n\n")
