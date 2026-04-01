# Install packages 
# install.packages("ggplot2")
install.packages("plotly")

# Load libraries
library(ggplot2)
library(plotly)

# Load dataset
data(iris)

# 1. Static Visualization (ggplot2)
p <- ggplot(data = iris, aes(x = Sepal.Width, y = Petal.Width, color = Speces)) +
  geom_point(size = 2) +
  labs(
    title = "Static Scatter Plot of Iris Dataset",
    x = "Sepal Width",
    y = "Petal Width"
  )

# Display static plot
p

# 2. Convert to Interactive (ggplotly)
ggplotly(p)

# 3. Interactive Plot using plot_ly
plot_ly(
  data = iris,
  x = ~Sepal.Width,
  y = ~Petal.Width,
  color = ~Species,
  type = "scatter",
  mode = "markers"
) %>%
  layout(
    title = "Iris Data Set Visualization",
    xaxis = list(title = "Sepal Width", ticksuffix = " cm"),
    yaxis = list(title = "Petal Width", ticksuffix = " cm")
  )