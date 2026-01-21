sales <- c(12, 15, 10, 18, 20, 22, 25, 28, 30, 35, 40, 45)

# 1. Total sales for the year
total_sales <- sum(sales)

# 2. Average monthly sales
average_sales <- mean(sales)

# 3. Months with sales above 25,000
months_above_25k <- which(sales > 25)


# Print results
cat("Total sales for the year:", total_sales, "\n")
cat("Average monthly sales:", average_sales, "\n")
cat("Months with sales above 25,000:", months_above_25k, "\n")

