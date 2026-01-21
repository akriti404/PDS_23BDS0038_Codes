numbers <- c(5, 3, 8, 3, 9, 5, 2, 8)

# 1. Find unique elements
unique_numbers <- unique(numbers)

# 2. Identify duplicated elements
duplicates <- numbers[duplicated(numbers)]

# 3. Remove duplicates, keeping only the first occurrence
no_duplicates <- numbers[!duplicated(numbers)]

# Print results
cat("Unique elements:", unique_numbers, "\n")
cat("Duplicated elements:", duplicates, "\n")
cat("Vector without duplicates:", no_duplicates, "\n") 