# Step 1: Install and Load the necessary packages and data
install.packages("dplyr")
library(dplyr)

# Load starwars dataset which is a built-in dataset in the dplyr package
data("starwars", package = "dplyr")

# View the original dataset
View(starwars)


# Step 2: Select Columns
# Extract relevant columns such as name, species, height, mass, homeworld, and gender
selected_data <- starwars %>%
  select(name, species, height, mass, homeworld, gender)

View(selected_data)


# Step 3: Filter Species with More Than Two Characters
# Count the number of characters in each species and keep species with more than 2 characters
species_filtered <- selected_data %>%
  group_by(species) %>%
  filter(n() > 2)

View(species_filtered)


# Step 4: Create New Columns
# Convert height from centimeters to meters and categorize mass into weight categories
processed_data <- species_filtered %>%
  mutate(
    height_m = height / 100,
    weight_category = case_when(
      mass < 60 ~ "Light",
      mass >= 60 & mass < 90 ~ "Medium",
      mass >= 90 ~ "Heavy",
      TRUE ~ "Unknown"
    )
  )

View(processed_data)


# Step 5: Find Average Height for Each Species-Gender Combination
avg_height_data <- processed_data %>%
  group_by(species, gender) %>%
  summarize(avg_height = mean(height_m, na.rm = TRUE))

View(avg_height_data)


# Step 6: Identify Top Three Species with the Highest Average Height
top_species <- avg_height_data %>%
  group_by(species) %>%
  summarize(avg_species_height = mean(avg_height, na.rm = TRUE)) %>%
  arrange(desc(avg_species_height)) %>%
  slice_head(n = 3)

View(top_species)