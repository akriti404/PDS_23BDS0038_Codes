# 1) Install and load required packages
required_packages <- c("DBI", "RSQLite", "dplyr")

for(pkg in required_packages){
  if(!require(pkg, character.only = TRUE)){
    install.packages(pkg, dependencies = TRUE)
    library(pkg, character.only = TRUE)
  }
}

# 2) Set working directory
setwd(getwd())
cat("Working directory:", getwd(), "\n")

# 3) Create / connect to SQLite database
db_file <- "songs.db"
con <- dbConnect(RSQLite::SQLite(), db_file)

cat("Connected to database:", db_file, "\n")

# 4) Create songs table if it does not exist
create_table_query <- "
CREATE TABLE IF NOT EXISTS songs (
song_id INTEGER PRIMARY KEY,
title TEXT,
artist_id INTEGER
);
"

dbExecute(con, create_table_query)
cat("Table 'songs' ensured.\n")

# 5) Insert sample data (including Queen with artist_id = 11)

sample_data <- data.frame(
  song_id = 1:10,
  title = c(
    "Bohemian Rhapsody",
    "Don't Stop Me Now",
    "We Will Rock You",
    "Another One Bites The Dust",
    "Somebody To Love",
    "Shape of You",
    "Blinding Lights",
    "Bad Guy",
    "Perfect",
    "Levitating"
  ),
  artist_id = c(
    11,11,11,11,11,  # Queen songs
    5,6,7,5,8       # Other artists
  ),
  stringsAsFactors = FALSE
)

# Write data to table (overwrite if exists)
dbWriteTable(con, "songs", sample_data, overwrite = TRUE)

cat("Sample data inserted into songs table.\n")

# 6) Verify table exists
tables <- dbListTables(con)

if(!("songs" %in% tables)){
  stop("Error: songs table not found.")
}

# 7) Create reference to songs table
songs_tbl <- tbl(con, "songs")

# 8) Construct query for Queen songs
queen_query <- songs_tbl %>%
  filter(artist_id == 11) %>%
  select(title)

# 9) Display SQL query
cat("\nGenerated SQL Query:\n")
show_query(queen_query)

# 10) Retrieve actual data as tibble
queen_songs <- collect(queen_query)

cat("\nSongs by Queen:\n")
print(queen_songs)

# 11) Disconnect database
dbDisconnect(con)

cat("\nDatabase disconnected successfully.\n")