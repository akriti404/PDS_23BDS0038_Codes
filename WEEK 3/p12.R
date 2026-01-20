# Function to get integer input from the user
getintinpt <- function() {
  user_input <- readline(prompt = "Enter an integer: ")
  integer_input <- as.integer(user_input)
  return(integer_input)
}

# Test the function with different sets of inputs
cat("Test Case 1: User input is '42'\n")
cat("User input as integer:", getintinpt(), "\n\n")

cat("Test Case 2: User input is '100'\n")
cat("User input as integer:", getintinpt(), "\n\n")

cat("Test Case 3: User input is '7'\n")
cat("User input as integer:", getintinpt(), "\n\n")
