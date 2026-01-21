# Create a list of books and their borrowers
library_books <- list(
  "The Hobbit" = c("Alice", "Bob"),
  "1984" = c("Charlie", "Alice"),
  "Moby Dick" = c("Bob")
)

# 1. Add new books with their borrowers
library_books[["Harry Potter"]] <- c("Alice", "David", "Emma")

# 2. Remove a book from the system
library_books[["Moby Dick"]] <- NULL

# 3. Calculate the total number of borrowers for each book
borrower_count <- sapply(library_books, length)

cat("Total number of borrowers for each book:\n")
print(borrower_count)
cat("\n")

# 4. Find the book with the highest and lowest number of borrowers
highest_book <- names(which.max(borrower_count))
lowest_book <- names(which.min(borrower_count))

cat("Book with highest number of borrowers:", highest_book,
    "(", max(borrower_count), "borrowers )\n")
cat("Book with lowest number of borrowers:", lowest_book,
    "(", min(borrower_count), "borrowers )\n")
