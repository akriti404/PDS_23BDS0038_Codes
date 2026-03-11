library(dplyr)
#load starwars dataset which is a built-in dataset in the dplyr package
data("starwars", package = "dplyr")
View(starwars)


#Step2 (Select Columns): Extract relevant columns such as name, species, height, mass, and homeworld.

starwars_data <- starwars %>%
  select(name, species, height, mass, homeworld)
View(starwars_data)


#Step 3: (Filter Rows): Focus on data for characters who are Human
human_data <- starwars_data %>%
  filter(species == "Human")
View(human_data)

#Step 4: (Create New Columns): Calculate the Body Mass Index (BMI) for each character.
human_data <- human_data %>%
  mutate(BMI = mass / (height/100)^2)
View(human_data)

#Step5: (Summarize Data): Find the average BMI for Human characters from each homeworld
summary_data <- human_data %>%
  group_by(homeworld) %>%
  summarize(avg_BMI = mean(BMI, na.rm = TRUE))
View(summary_data)
