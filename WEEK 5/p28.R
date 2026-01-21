# Initialize an empty to-do list
to_do_list <- list()

# Function to add tasks to the to-do list
add_task <- function(task) {
  to_do_list[[length(to_do_list) + 1]] <<- list(
    task = task,
    completed = FALSE
  )
}

# Function to mark tasks as completed
mark_completed <- function(task) {
  for (i in seq_along(to_do_list)) {
    if (to_do_list[[i]]$task == task) {
      to_do_list[[i]]$completed <<- TRUE
      break
    }
  }
}

# Function to view the to-do list
view_tasks <- function() {
  print(to_do_list)
}

# Example usage
add_task("Finish report")
add_task("Call client")
mark_completed("Finish report")
view_tasks()
