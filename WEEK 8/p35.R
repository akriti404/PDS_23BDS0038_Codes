# 0) File names
input_csv            <- "students_input.csv"
students_rank_csv    <- "students_by_rank.csv"
assessment_avg_csv   <- "assessment_wise_averages.csv"
spec_avg_csv         <- "specialization_wise_averages.csv"

# 1) Create vectors from the table
RegNo <- c(
  "24BCE1001","24BCE1002","24BCE1003","24BCE1004","24BCE1005",
  "24BCE1006","24BCE1007","24BCE1008","24BCE1009","24BCE1010"
)

Name <- c(
  "Aadesh Kumar","Bhavya Reddy","Charan Iyer","Divya Sharma","Esha Nair",
  "Farhan Khan","Gayathri Raj","Harish Kumar","Ishita Menon","Jai Verma"
)

Programme <- c(
  "B.Tech","B.Tech","B.Tech","B.Tech","B.Tech",
  "B.Tech","B.Tech","B.Tech","B.Tech","B.Tech"
)

Specialization <- c(
  "CSE","AI","DS","IT","CSE","ECE","Cyber","AI","DS","IT"
)

Assess1 <- c(18,15,20,14,20,12,17,16,19,18)
Assess2 <- c(17,16,19,15,20,14,18,17,18,17)
Assess3 <- c(19,14,18,15,19,13,17,16,19,16)
Assess4 <- c(18,18,20,16,20,16,19,15,18,19)

# 2) Create data frame and write input CSV
students <- data.frame(
  RegNo, Name, Programme, Specialization,
  Assess1, Assess2, Assess3, Assess4,
  stringsAsFactors = FALSE
)

str(students)
head(students)

write.csv(students, file = input_csv, row.names = FALSE, na = "")
cat("Input CSV written:", normalizePath(input_csv, winslash="/"), "\n")
# 3) Read CSV for analytics
students_in <- read.csv(input_csv, stringsAsFactors = FALSE, check.names = TRUE)

str(students_in)

assessment_cols <- c("Assess1","Assess2","Assess3","Assess4")
required_cols <- c("RegNo","Name","Programme","Specialization", assessment_cols)

missing <- setdiff(required_cols, names(students_in))
if(length(missing) > 0) stop("Missing columns: ", paste(missing, collapse=", "))

for(cn in assessment_cols){
  if(!is.numeric(students_in[[cn]])){
    students_in[[cn]] <- as.numeric(students_in[[cn]])
  }
}

stopifnot(all(sapply(students_in[assessment_cols], is.numeric)))

# 4) Per-student analytics
students_in$Total   <- rowSums(students_in[, assessment_cols], na.rm = TRUE)
students_in$Average <- students_in$Total / length(assessment_cols)
students_in$Rank    <- rank(-students_in$Total, ties.method = "min")

students_by_rank <- students_in[order(students_in$Rank, students_in$RegNo), ]

write.csv(students_by_rank, file = students_rank_csv, row.names = FALSE, na = "")
cat("Students by rank CSV:", normalizePath(students_rank_csv, winslash="/"), "\n")

# 5) Assessment-wise averages
assessment_avg <- colMeans(students_in[, assessment_cols], na.rm = TRUE)

assessment_avg_df <- data.frame(
  Assessment = names(assessment_avg),
  Average = as.numeric(assessment_avg),
  stringsAsFactors = FALSE
)

write.csv(assessment_avg_df, file = assessment_avg_csv, row.names = FALSE, na = "")
cat("Assessment-wise averages CSV:", normalizePath(assessment_avg_csv, winslash="/"), "\n")

# 6) Specialization-wise averages
spec_assess_avg <- aggregate(
  students_in[, assessment_cols],
  by = list(Specialization = students_in$Specialization),
  FUN = function(x) mean(x, na.rm = TRUE)
)

spec_assess_avg$Overall_Average <- rowMeans(spec_assess_avg[, assessment_cols], na.rm = TRUE)

spec_assess_avg <- spec_assess_avg[
  order(-spec_assess_avg$Overall_Average, spec_assess_avg$Specialization),
]

write.csv(spec_assess_avg, file = spec_avg_csv, row.names = FALSE, na = "")
cat("Specialization-wise averages CSV:", normalizePath(spec_avg_csv, winslash="/"), "\n")

