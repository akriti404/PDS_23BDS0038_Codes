#1. Wide → Long Transformation
#Step1:
# Install necessary package
install.packages("tidyr")

# Load the necessary libraries
library(tidyr)

#Step2: 
# Create a sample data frame in wide format
wide_data <- data.frame(
  ID = 1:3,
  Year2019 = c(10, 15, 20),
  Year2020 = c(12, 18, 24)
)
# print the wide data
print(wide_data)

#Step3:
# Use gather() to convert wide data to long format
long_data <- wide_data %>%
  gather(key = "Year", value = "Value", Year2019:Year2020)

# View the long data
print(long_data)


#2. Long → Wide Transformation

#Step1:
# Install necessary package
install.packages("tidyr")

# Load the necessary libraries
library(tidyr)

#Step2: 
# Create a sample data frame in long format
long_data <- data.frame(
  ID = c(1, 1, 2, 2, 3, 3),
  Year = c("2019", "2020", "2019", "2020", "2019", "2020"),
  Value = c(10, 12, 15, 18, 20, 24)
)

# View the long data
print(long_data)

#Step3:
# Use spread() to convert long data to wide format
wide_data <- long_data %>%
  spread(key = "Year", value = "Value")

# View the wide data
print(wide_data)

