# Function to add two numbers
add_numbers <- function(a, b) {
  return(a + b)
}

# Test the function with different sets of inputs
result1 <- add_numbers(5, 10)
result2 <- add_numbers(-3, 7)
result3 <- add_numbers(0, 0)
result4 <- add_numbers(3.5, 2.1)

# Print the test results
cat("Result of adding 5 and 10:", result1, "\n")
cat("Result of adding -3 and 7:", result2, "\n")
cat("Result of adding 0 and 0:", result3, "\n")
cat("Result of adding 3.5 and 2.1:", result4, "\n")
