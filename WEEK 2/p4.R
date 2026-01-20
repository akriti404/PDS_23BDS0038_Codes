# Function to divide two numbers
div_numbers <- function(a, b) {
  return(a / b)
}

# Test the function with different sets of inputs
result1 <- div_numbers(10, 5)
result2 <- div_numbers(-7, 3)
result3 <- div_numbers(0, 5)
result4 <- div_numbers(3.5, 2.1)

# Print the test results
cat("Result of dividing 10 by 5:", result1, "\n")
cat("Result of dividing -7 by 3:", result2, "\n")
cat("Result of dividing 0 by 5:", result3, "\n")
cat("Result of dividing 3.5 by 2.1:", result4, "\n")
