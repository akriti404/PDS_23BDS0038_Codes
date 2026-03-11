# 0) File names
input_csv         <- "branches_input.csv"
branches_rank_csv <- "branches_by_rank.csv"
quarter_avg_csv   <- "quarter_wise_averages.csv"
region_avg_csv    <- "region_wise_averages.csv"

#1) Create vectors from the table
BranchID   <- c("BR001","BR002","BR003","BR004","BR005","BR006","BR007","BR008","BR009","BR010")
BranchName <- c("Vellore Town","Chennai Central","Mumbai Andheri","Pune Hinjewadi","Delhi Karol Bagh",
                "Noida Sector 18","Kolkata Park St","Hyderabad Hitech","Ahmedabad CG Rd","Jaipur MI Road")
Region     <- c("South","South","West","West","North","North","East","South","West","North")
Segment    <- c("Grocery","Electronics","Grocery","Home","Apparel","Electronics","Grocery","Home","Apparel","Home")

Q1 <- c(120,140,110,95,150,132,105,128,115,108)
Q2 <- c(115,150,118,100,142,138,107,131,120,112)
Q3 <- c(130,145,122,108,155,136,112,134,125,118)
Q4 <- c(125,160,120,112,158,140,115,137,129,121)
Q3_Sales <- Q3  # verification column

# 2) Create data frame and write input CSV
branches <- data.frame(
  BranchID, BranchName, Region, Segment,
  Q1, Q2, Q3, Q4, Q3_Sales,
  stringsAsFactors = FALSE
)
write.csv(branches, file = input_csv, row.names = FALSE, na = "")
cat("Input CSV written:", normalizePath(input_csv, winslash = "/"), "\n")

# 3) Read input CSV for analytics
branches_in <- read.csv(input_csv, stringsAsFactors = FALSE, check.names = TRUE)
str(branches_in)

quarter_cols  <- c("Q1","Q2","Q3","Q4")
required_cols <- c("BranchID","BranchName","Region","Segment", quarter_cols, "Q3_Sales")
missing <- setdiff(required_cols, names(branches_in))
if (length(missing) > 0) stop("Missing columns: ", paste(missing, collapse = ", "))
for (cn in quarter_cols) if (!is.numeric(branches_in[[cn]])) branches_in[[cn]] <- as.numeric(branches_in[[cn]])
stopifnot(all(sapply(branches_in[quarter_cols], is.numeric)))

# 4) Per-branch analytics (Sum, Average, Rank)
branches_in$Sum     <- rowSums(branches_in[ , quarter_cols], na.rm = TRUE)
branches_in$Average <- branches_in$Sum / length(quarter_cols)
branches_in$Rank    <- rank(-branches_in$Sum, ties.method = "min")
branches_by_rank    <- branches_in[order(branches_in$Rank, branches_in$BranchID), ]
write.csv(branches_by_rank, file = branches_rank_csv, row.names = FALSE, na = "")
cat("Branches by rank CSV:", normalizePath(branches_rank_csv, winslash = "/"), "\n")

# 5) Quarter-wise averages
quarter_wise_avg <- colMeans(branches_in[ , quarter_cols], na.rm = TRUE)
quarter_avg_df   <- data.frame(Quarter = names(quarter_wise_avg),
                               Average = as.numeric(quarter_wise_avg),
                               stringsAsFactors = FALSE)
write.csv(quarter_avg_df, file = quarter_avg_csv, row.names = FALSE, na = "")
cat("Quarter-wise averages CSV:", normalizePath(quarter_avg_csv, winslash = "/"), "\n")

# 6) Region-wise averages (per quarter + overall)
region_quarter_avg <- aggregate(
  branches_in[ , quarter_cols],
  by = list(Region = branches_in$Region),
  FUN = function(x) mean(x, na.rm = TRUE)
)
region_quarter_avg$Overall_Average <- rowMeans(region_quarter_avg[ , quarter_cols], na.rm = TRUE)
region_quarter_avg <- region_quarter_avg[order(-region_quarter_avg$Overall_Average, region_quarter_avg$Region), ]
write.csv(region_quarter_avg, file = region_avg_csv, row.names = FALSE, na = "")
cat("Region-wise averages CSV:", normalizePath(region_avg_csv, winslash = "/"), "\n")
