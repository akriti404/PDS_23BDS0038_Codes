# 1) Create a vector for each column
PatientID <- c("HOS1001","HOS1002","HOS1003","HOS1004","HOS1005",
               "HOS1006","HOS1007","HOS1008","HOS1009","HOS1010"
)

Name <- c("Arjun Menon","Bhavana Iyer","Chirag Gupta","Devika Nair","Eshwar Rao",
          "Farida Sheikh","Gaurav Kumar","Harini Krishnan","Ishita S","Jatin Verma"
)

Department <- c("Cardiology","Neurology","Endocrinology","Pulmonology","Cardiology",
                "Endocrinology","Neurology","Pulmonology","Cardiology","Endocrinology"
)

Diagnosis <- c("Hypertension","Migraine","Type-2 Diabetes","Asthma","Hypertension",
               "Thyroid Disorder","Epilepsy","COPD","Arrhythmia","Type-1 Diabetes"
)

Test1 <- c(82,71,90,64,95,60,78,68,87,83)
Test2 <- c(76,69,92,70,94,63,82,72,85,79)
Test3 <- c(88,73,86,67,93,61,79,70,90,77)
Test4 <- c(84,75,91,72,96,66,81,69,88,85)
Test3_Score <- Test3

# 2) Combine them into a single data frame
patients <- data.frame(
  PatientID=PatientID,
  Name=Name,
  Department=Department,
  Diagnosis=Diagnosis,
  Test1=Test1,
  Test2=Test2,
  Test3=Test3,
  Test4=Test4,
  Test3_Score=Test3_Score,
  stringsAsFactors = FALSE
)

str(patients)
head(patients)

# 3) Compute patient-level Sum, Average, and Rank
patients$Sum <- rowSums(patients[, c("Test1","Test2","Test3","Test4")])
patients$Average <- round(patients$Sum / 4, 2)  

patients$Rank <- rank(-patients$Sum, ties.method = "min")
#Ties are handled using ties.method = "min", meaning tied values receive the same minimum rank.

patients_sorted <- patients[order(patients$Rank), ]
patients_sorted

# 4) Compute test-wise averages
test_cols <- c("Test1","Test2","Test3","Test4")
test_wise_avg <- colMeans(patients[ , test_cols], na.rm = TRUE)
print(test_wise_avg)

# 5) Compute department-wise averages
dept_test_avg <- aggregate(
  patients[ , test_cols],
  by = list(Department = patients$Department),
  FUN = function(x) mean(x, na.rm = TRUE)
)
dept_test_avg$Overall_Average <- rowMeans(dept_test_avg[ , test_cols], na.rm = TRUE)
dept_test_avg <- dept_test_avg[order(-dept_test_avg$Overall_Average), ]
print(dept_test_avg)

