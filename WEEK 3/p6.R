# Function to calculate BMI
calculate_bmi <- function(height, weight) {
  bmi <- weight / (height^2)
  return(bmi)
}

# Test the function with different sets of inputs
bmi1 <- calculate_bmi(1.75, 70)
bmi2 <- calculate_bmi(1.60, 60)
bmi3 <- calculate_bmi(1.80, 85)
bmi4 <- calculate_bmi(1.65, 50)

# Print the test results
cat("BMI for height 1.75m and weight 70kg:", bmi1, "\n")
cat("BMI for height 1.60m and weight 60kg:", bmi2, "\n")
cat("BMI for height 1.80m and weight 85kg:", bmi3, "\n")
cat("BMI for height 1.65m and weight 50kg:", bmi4, "\n")
