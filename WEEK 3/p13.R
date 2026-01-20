# Function to get floating point input from the user
getfloatinpt <- function() {
  user_input <- readline(prompt = "Enter a floating point number: ")
  float_input <- as.numeric(user_input)
  return(float_input)
}

# Test the function with different sets of inputs
cat("Test Case 1: User input is '3.14'\n")
cat("User input as floating point number:", getfloatinpt(), "\n\n")

cat("Test Case 2: User input is '2.718'\n")
cat("User input as floating point number:", getfloatinpt(), "\n\n")

cat("Test Case 3: User input is '0.001'\n")
cat("User input as floating point number:", getfloatinpt(), "\n\n")
