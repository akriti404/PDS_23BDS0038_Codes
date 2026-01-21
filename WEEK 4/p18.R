heights <- c(150, 160, 165, 155, 170, 175, 180)

# 1. Mean and median
mean_height <- mean(heights)
median_height <- median(heights)

# 2. Maximum and minimum heights
max_height <- max(heights)
min_height <- min(heights)

# 3. Number of students taller than 165 cm
taller_than_165 <- sum(heights > 165)

# 4. Sorted heights
sorted_heights <- sort(heights)

# Print results
cat("Mean height:", mean_height, "\n")
cat("Median height:", median_height, "\n")
cat("Maximum height:", max_height, "\n")
cat("Minimum height:", min_height, "\n")
cat("Number of students taller than 165 cm:", taller_than_165, "\n")
cat("Sorted heights:", sorted_heights, "\n") 

