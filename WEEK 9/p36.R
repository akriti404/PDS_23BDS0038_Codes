# Step 1: Install and Load the necessary packages and data
install.packages("dplyr")     # Install dplyr package
library(dplyr)                # Load dplyr package

# Load starwars dataset which is a built-in dataset in the dplyr package
data("starwars", package = "dplyr")

# View the original dataset
View(starwars)


# Step 2: Select Columns
# Extract relevant columns such as name, species, height, mass, and homeworld
selected_columns <- starwars %>%
  select(name, species, height, mass, homeworld)


# Step 3: Store the selected columns in a new dataframe (starwars_data)
starwars_data<-selected_columns

# Step 4: Display the resulting dataset
View(starwars_data)