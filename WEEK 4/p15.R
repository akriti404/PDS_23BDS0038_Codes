# Function to generate and print the Fibonacci sequence
generate_fibonacci <- function(n) {
  # Initialize the first two terms of the Fibonacci sequence
  fib_seq <- numeric(n)
  fib_seq[1] <- 0
  if (n > 1) {
    fib_seq[2] <- 1
  }
  
  # Generate the Fibonacci sequence
  for (i in 3:n) {
    fib_seq[i] <- fib_seq[i - 1] + fib_seq[i - 2]
  }
  
  # Print the Fibonacci sequence
  for (i in 1:n) {
    print(fib_seq[i])
  }
}

# Test the function
generate_fibonacci(5)   # Test with 5 terms
generate_fibonacci(10)  # Test with 10 terms
generate_fibonacci(20)  # Test with 20 terms  
