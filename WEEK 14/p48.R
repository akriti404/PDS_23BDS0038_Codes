# Install and load leaflet
install.packages("leaflet")
library(leaflet)

# Step 1 & 2: Initialize map and set view
map <- leaflet() %>%
  addTiles() %>%
  setView(lng = 80.1309, lat = 12.9699, zoom = 10)

map

# Step 3: Add marker with popup
map <- map %>%
  addMarkers(
    lng = 80.1309,
    lat = 12.9699,
    popup = "Hello from Katpadi!"
  )

map

# Step 4: Add customized circle marker
map <- map %>%
  addCircleMarkers(
    lng = 80.2,
    lat = 12.95,
    color = "red",
    radius = 8,
    label = "This is a circle marker!"
  )

map