# Function to calculate the area of a rectangle
calculate_rect_area <- function(width, height) {
  return(width * height)
}

# Test the function with different sets of inputs
area1 <- calculate_rect_area(5, 10)
area2 <- calculate_rect_area(7, 3)
area3 <- calculate_rect_area(0, 8)
area4 <- calculate_rect_area(4.5, 6.2)

# Print the test results
cat("Area of rectangle with width 5 and height 10:", area1, "\n")
cat("Area of rectangle with width 7 and height 3:", area2, "\n")
cat("Area of rectangle with width 0 and height 8:", area3, "\n")
cat("Area of rectangle with width 4.5 and height 6.2:", area4, "\n")
