# Install packages 
# install.packages("ggplot2")
install.packages("hexbin")  

# Load libraries
library(ggplot2)
library(hexbin)

# Load dataset
data("midwest", package = "ggplot2")
View(midwest)

# 1. Scatter plot
ggplot(data = midwest) + 
  geom_point(aes(x = percollege, y = percadultpoverty))

# 2. Bar chart (population by state)
ggplot(data = midwest) + 
  geom_col(aes(x = state, y = poptotal))

# 3. Hexbin plot 
ggplot(data = midwest) + 
  geom_hex(aes(x = percollege, y = percadultpoverty))

# 4. Scatter plot with smooth line
ggplot(data = midwest) + 
  geom_point(aes(x = percollege, y = percadultpoverty)) + 
  geom_smooth(aes(x = percollege, y = percadultpoverty))

# 5. Shared aesthetic mappings
ggplot(data = midwest, aes(x = percollege, y = percadultpoverty)) + 
  geom_point() +
  geom_smooth() +
  geom_point(aes(y = percchildbelowpovert))

# 6. Color mapping by state
ggplot(data = midwest) + 
  geom_point(aes(x = percollege, y = percadultpoverty, color = state))

# 7. Constant color + transparency
ggplot(data = midwest) + 
  geom_point(aes(x = percollege, y = percadultpoverty), 
             color = "red", 
             alpha = 0.3)