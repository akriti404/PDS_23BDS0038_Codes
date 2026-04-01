# Install and load ggplot2
# install.packages("ggplot2")
library(ggplot2)

# Create the dataset
data <- data.frame(
  Plant_ID = 1:5,
  Growth_Rate = c(3.2, 1.8, 2.6, 0.9, 3.8),
  Condition_Label = c("Sunny", "Shade", "Rainy", "Drought", "Cloudy")
)

# Create scatter plot
ggplot(data = data, aes(x = Plant_ID, y = Growth_Rate)) +
  geom_point(color = "dodgerblue", size = 4) +
  geom_text(aes(label = Condition_Label), 
            vjust = 1.5, 
            color = "darkorange") +
  labs(
    title = "Scatter Plot of Plant Growth Data",
    x = "Plant ID",
    y = "Growth Rate"
  )