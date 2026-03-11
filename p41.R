# -----------------------------
# Setup
# -----------------------------
# Run install.packages() once as needed:
#install.packages("tidyr")
# install.packages("dplyr")

library(tidyr)
library(dplyr)

cat("\n=== Messy & Mixed-Format Input Data ===\n")
messy <- data.frame(
  StudentID = 1:4,
  Name      = c("Alice", "Bob", "Charlie", "Dana"),
  Math_2020 = c(85, 90, NA, 70),
  Math_2021 = c(88, NA, 78, 75),
  Eng_2020  = c(80, 92, 85, NA),
  Eng_2021  = c(82, 95, NA, 77),
  ExtraInfo = c("A-2020-S1", "B-2021-S2", "C-2020-S1", NA),
  stringsAsFactors = FALSE
)
print(messy)

# -----------------------------
# 1) gather(): Wide → Long
# -----------------------------
cat("\n=== 1) gather(): Convert subject-year columns into key/value rows ===\n")
long1 <- messy %>%
  gather(key = "SubjectYear", value = "Score", Math_2020:Eng_2021)
print(long1)

# -----------------------------
# 2) separate(): Split 'SubjectYear' into 'Subject' and 'Year'
# -----------------------------
cat("\n=== 2) separate(): Split 'SubjectYear' into 'Subject' and 'Year' ===\n")
long2 <- long1 %>%
  separate(col = SubjectYear, into = c("Subject", "Year"), sep = "_", remove = TRUE)
print(long2)

# -----------------------------
# 3) drop_na(): Remove rows with missing Score
# -----------------------------
cat("\n=== 3) drop_na(): Remove rows with missing 'Score' ===\n")
long_clean <- long2 %>%
  drop_na(Score)
print(long_clean)

# -----------------------------
# (Optional) separate(): Parse ExtraInfo into components
# -----------------------------
cat("\n=== (Optional) separate(): Parse 'ExtraInfo' --> Initial, InfoYear, Section ===\n")
long_parsed <- long_clean %>%
  separate(ExtraInfo, into = c("Initial", "InfoYear", "Section"), sep = "-", remove = FALSE)
print(long_parsed)

# -----------------------------
# 4) spread(): Long → Wide by Year (one column per year)
# -----------------------------
cat("\n=== 4) spread(): Create year-wise columns for each Student/Subject ===\n")
wide_by_year <- long_parsed %>%
  select(StudentID, Name, Subject, Year, Score) %>%
  spread(key = Year, value = Score)
print(wide_by_year)

# -----------------------------
# 5) unite(): Combine Name and Subject into a single descriptor
# -----------------------------
cat("\n=== 5) unite(): Combine 'Name' and 'Subject' into 'Name_Subject' ===\n")
wide_united <- wide_by_year %>%
  unite(col = "Name_Subject", Name, Subject, sep = " - ")
print(wide_united)

# -----------------------------
# 6) fill(): Forward-fill values in a time-series-like table
# -----------------------------
cat("\n=== 6) fill(): Forward-fill missing 'Attendance' within each StudentID ===\n")

progress <- data.frame(
  StudentID  = c(1, 1, 1, 2, 2, 2, 3, 3),
  Term       = c("T1", "T2", "T3", "T1", "T2", "T3", "T1", "T2"),
  Attendance = c("Present", NA, NA, "Absent", NA, "Present", NA, "Present"),
  stringsAsFactors = FALSE
)
cat("\nOriginal 'progress' table:\n")
print(progress)

progress_filled <- progress %>%
  group_by(StudentID) %>%
  arrange(Term, .by_group = TRUE) %>%
  fill(Attendance, .direction = "down") %>%
  ungroup()

cat("\nAfter fill() (forward-fill per StudentID):\n")
print(progress_filled)

# -----------------------------
# Final notes & quick checks
# -----------------------------
cat("\n=== Quick Checks ===\n")
cat("- Rows in long2 vs. long_clean (dropped NAs):\n")
cat("  long2 rows:", nrow(long2), " | long_clean rows:", nrow(long_clean), "\n")

cat("\nDone.\n")
