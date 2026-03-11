# 1) Install and load required package
if(!require(jsonlite)){
  install.packages("jsonlite")
  library(jsonlite)
}

# 2) Set working directory
setwd(getwd())
cat("Working directory:", getwd(), "\n")

# 3) Read existing JSON inventory file
inventory_file <- "inventory.json"

if(!file.exists(inventory_file)){
  stop("Error: inventory.json file not found in working directory.")
}

inventory_data <- fromJSON(inventory_file)

cat("\nCurrent Inventory:\n")
print(inventory_data)

# 4) Add a new product
new_product <- data.frame(
  product_id = "P105",
  name = "Mouse",
  category = "Accessories",
  price = 800,
  stock = 40,
  stringsAsFactors = FALSE
)

inventory_updated <- rbind(inventory_data, new_product)

cat("\nNew Product Added:\n")
print(new_product)

# 5) Write updated inventory to new JSON file
output_file <- "updated_inventory.json"

write_json(
  inventory_updated,
  path = output_file,
  pretty = TRUE,
  auto_unbox = TRUE
)

cat("\nUpdated inventory written to:", output_file, "\n")

# 6) Verify updated JSON file
if(file.exists(output_file)){
  
  verified_data <- fromJSON(output_file)
  
  cat("\nVerified Updated Inventory:\n")
  print(verified_data)
  
} else {
  cat("Error: Updated file not found.\n")
}