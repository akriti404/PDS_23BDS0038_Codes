# Function to check whether a number is odd or even
check_odd_even <- function(number) {
  if (number %% 2 == 0) {
    return("The number is even.")
  } else {
    return("The number is odd.")
  }
}

# Test the function
print(check_odd_even(4))    # Test with a positive even number
print(check_odd_even(7))    # Test with a positive odd number
print(check_odd_even(0))    # Test with zero
print(check_odd_even(-10))  # Test with a negative even number
print(check_odd_even(-3))   # Test with a negative odd number  
