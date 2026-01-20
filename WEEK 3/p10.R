# Function to create a full name
make_full_name <- function(first_name, last_name) {
  full_name <- paste(first_name, last_name)
  return(full_name)
}

# Test the function with different sets of inputs
name1 <- make_full_name("John", "Doe")
name2 <- make_full_name("Alice", "Smith")
name3 <- make_full_name("Rahul", "Sharma")
name4 <- make_full_name("Emily", "Blunt")

# Print the test results
cat("Full name for John and Doe:", name1, "\n")
cat("Full name for Alice and Smith:", name2, "\n")
cat("Full name for Rahul and Sharma:", name3, "\n")
cat("Full name for Emily and Blunt:", name4, "\n")
