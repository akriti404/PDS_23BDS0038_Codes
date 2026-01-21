# Create a list of teams and their scores
teams <- list(
  "Team A" = c(90, 85, 88),
  "Team B" = c(78, 82, 79),
  "Team C" = c(88, 92, 90)
)

# 1. Add new teams with their scores
teams[["Team D"]] <- c(85, 87, 89)

# 2. Remove a team from the list
teams[["Team B"]] <- NULL

# 3. Calculate the average score for each team
average_scores <- sapply(teams, mean)

cat("Average score for each team:\n")
print(average_scores)
cat("\n")

# 4. Rank teams based on their average scores
ranked_teams <- sort(average_scores, decreasing = TRUE)

cat("Team rankings based on average scores:\n")
print(ranked_teams)
