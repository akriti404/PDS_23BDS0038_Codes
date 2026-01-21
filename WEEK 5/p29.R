# Initialize an empty list to store customers and their purchases
customers <- list()

# Function to add a customer and their purchases
add_customer <- function(name, purchases) {
  customers[[name]] <<- purchases
}

# Function to remove a customer from the list
remove_customer <- function(name) {
  customers[[name]] <<- NULL
}

# Function to calculate total purchases for each customer
calculate_totals <- function() {
  return(sapply(customers, sum))
}

# Function to find customer with highest and lowest purchases
find_extremes <- function() {
  totals <- calculate_totals()
  highest <- names(which.max(totals))
  lowest <- names(which.min(totals))
  return(list(highest = highest, lowest = lowest))
}

# Sample Data
add_customer("Alice", c(200, 150, 300))
add_customer("Bob", c(100, 80, 150))
add_customer("Charlie", c(250, 300, 100))

# Calculate totals
total_purchases <- calculate_totals()

# Find highest and lowest purchasers
extremes <- find_extremes()

# Print results
cat("Total Purchases per Customer:\n")
print(total_purchases)

cat("\nCustomer with Highest Purchases:", extremes$highest, "\n")
cat("Customer with Lowest Purchases:", extremes$lowest, "\n")