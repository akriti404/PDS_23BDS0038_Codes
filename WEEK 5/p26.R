# Initialize an empty shopping list
shopping_list <- list()

# Function to add items to the shopping list
add_item <- function(item) {
  shopping_list <<- c(shopping_list, item)
}

# Function to remove items from the shopping list
remove_item <- function(item) {
  shopping_list <<- shopping_list[shopping_list != item]
}

# Function to view the shopping list
view_list <- function() {
  print(shopping_list)
}

# Example usage
add_item("Milk")
add_item("Bread")
remove_item("Milk")
view_list() 
