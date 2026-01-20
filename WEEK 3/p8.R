# Function to calculate area of a circle
calculate_circle_area <- function(radius) {
  return(pi * radius ^ 2)
}

# Test the function with different sets of inputs
area1 <- calculate_circle_area(3)
area2 <- calculate_circle_area(5.5)
area3 <- calculate_circle_area(0)
area4 <- calculate_circle_area(7.2)

# Print the test results
cat("Area of circle with radius 3:", area1, "\n")
cat("Area of circle with radius 5.5:", area2, "\n")
cat("Area of circle with radius 0:", area3, "\n")
cat("Area of circle with radius 7.2:", area4, "\n")
