temps_celsius <- c(0, 20, 25, 30, 35, 40)

# 1. Convert to Fahrenheit
temps_fahrenheit <- temps_celsius * 9/5 + 32

# 2. Identify temperatures above 90°F
above_90 <- temps_fahrenheit > 90

# Print results
cat("Temperatures in Fahrenheit:", temps_fahrenheit, "\n")
cat("Temperatures above 90°F:", temps_fahrenheit[above_90], "\n") 
