names <- c("Alice", "Bob", "Charlie", "David")

# 1. Convert to uppercase
upper_names <- toupper(names)

# 2. Count number of characters
name_lengths <- nchar(names)

# 3. Check if names contain the letter "a"
contains_a <- grepl("a", names, ignore.case = TRUE)

# Print results
cat("Uppercase names:", upper_names, "\n")
cat("Number of characters in each name:", name_lengths, "\n")
cat("Names containing the letter 'a':", names[contains_a], "\n")
