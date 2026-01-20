# Function to calculate square of a number
calculate_square <- function(number) {
  return(number ^ 2)
}

# Test the function with different sets of inputs
square1 <- calculate_square(4)
square2 <- calculate_square(-3)
square3 <- calculate_square(0)
square4 <- calculate_square(5.7)

# Print the test results
cat("Square of 4:", square1, "\n")
cat("Square of -3:", square2, "\n")
cat("Square of 0:", square3, "\n")
cat("Square of 5.7:", square4, "\n")
