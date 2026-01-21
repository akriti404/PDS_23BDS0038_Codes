# Initialize an empty list for student grades
student_grades <- list()

# Function to add student grades
add_grade <- function(student, grade) {
  student_grades[[student]] <<- grade
}

# Function to remove student grades
remove_grade <- function(student) {
  student_grades[[student]] <<- NULL
}

# Function to calculate average grade
average_grade <- function() {
  grades <- unlist(student_grades)
  if (length(grades) == 0) {
    return(NA)
  }
  mean(grades)
}

# Example usage
add_grade("Alice", 85)
add_grade("Bob", 90)
remove_grade("Alice")

print(average_grade())
