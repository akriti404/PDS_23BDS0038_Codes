# Given vector of daily closing prices
closing_prices <- c(120, 122, 118, 121, 119, 117, 123, 125, 126, 124,
                    128, 130, 129, 131, 135, 134, 136, 137, 140, 138,
                    139, 141, 142, 144, 143, 145, 146, 148, 147, 149)

# 1. Calculate daily returns (percentage change)
daily_returns <- diff(closing_prices) / head(closing_prices, -1) * 100

# 2. Identify days with highest and lowest returns
highest_return <- max(daily_returns)
lowest_return <- min(daily_returns)

highest_day <- which(daily_returns == highest_return) + 1
lowest_day <- which(daily_returns == lowest_return) + 1

# 3. Calculate cumulative return over the month
cumulative_return <- ((tail(closing_prices, 1) - closing_prices[1]) / 
                        closing_prices[1]) * 100

# Print results
cat("Daily Returns (%):\n")
print(round(daily_returns, 2))

cat("\nHighest Daily Return:", round(highest_return, 2), "% on Day", highest_day, "\n")
cat("Lowest Daily Return:", round(lowest_return, 2), "% on Day", lowest_day, "\n")

cat("\nCumulative Return over the Month:", round(cumulative_return, 2), "%\n")
