data <- data.frame(
  Student_ID = 1:10,
  Course = c("CSE","ECE","MECH","CSE","ECE","CIVIL","CSE","MECH","ECE","CIVIL"),
  Semester = c(1,2,1,3,2,1,4,3,1,2),
  Study_Hours = c(3.5,4.0,2.5,5.0,3.0,2.0,6.0,3.5,2.8,3.2),
  Attendance_Percentage = c(85,90,75,95,80,70,98,85,78,82),
  Assignment_Score = c(78,85,70,92,75,65,95,80,72,77),
  Exam_Score = c(82,88,72,94,78,68,97,82,75,79),
  Satisfaction_Level = c(4,5,3,5,4,2,5,4,3,4),
  City = c("Chennai","Bangalore","Hyderabad","Mumbai","Delhi","Kolkata","Pune","Ahmedabad","Jaipur","Lucknow"),
  Latitude = c(13.0827,12.9716,17.3850,19.0760,28.7041,22.5726,18.5204,23.0225,26.9124,26.8467),
  Longitude = c(80.2707,77.5946,78.4867,72.8777,77.1025,88.3639,73.8567,72.5714,75.7873,80.9462)
)
write.csv(data,"student_learning_experience.csv",row.names=FALSE)

#task 1 : built in functions
df<-read.csv("student_learning_experience.csv",stringsAsFactors=FALSE)
str(df)
print("Summary Statistics: ")
summary(df)
colnames(df)

#task 2 : user defined functions
finalperformancescore<-function(Assignment_Score,Exam_Score){
  Final_Performance_Score<-(0.4*Assignment_Score)+(0.6*Exam_Score)
  return (Final_Performance_Score)
}
df$Final_Performance_Score<-finalperformancescore(df$Assignment_Score,df$Exam_Score)
head(df)

#task 3 : vectors
study_hours<-df$Study_Hours
ap<-df$Attendance_Percentage
fps<-df$Final_Performance_Score
study_hours_norm<-(study_hours-min(study_hours))/(max(study_hours)-min(study_hours))
above_avg<-fps[fps>mean(fps)]

#task 4 : lists
student_list<-list(
  summary_stats=summary(df[,c("Study_Hours","Attendance_Percentage","Final_Performance_Score")]),
  top_perf=df[order(-df$Final_Performance_Score), ][1:5, ],
  course_satisfaction=aggregate(Satisfaction_Level~Course,
                                data=df,
                                FUN=mean)
  
)

#task 5 : data frames
filtered_df<-df["Attendance_Percentage">=75 & "Satisfaction_Level">=4,]
filtered_df$City<-NULL

#task 6 : CSV
write.csv(df,"processed_student_learning_data.csv",row.names=FALSE)
new_df<-read.csv("processed_student_learning_data.csv",stringsAsFactors = FALSE)
#verify integrity
all.equal(df,new_df)

#task 7 : dplyr
library(dplyr)
final_result <- df %>%
  group_by(Course, Semester) %>%
  summarise(
    Avg_Performance = mean(Final_Performance_Score),
    Avg_Satisfaction = mean(Satisfaction_Level),
    Avg_Attendance = mean(Attendance_Percentage),
  ) %>%
  arrange(desc(Avg_Performance)) %>%
  filter(Avg_Performance > 80) %>%
  select(Course, Semester, Avg_Performance, Avg_Satisfaction)

#task 8 : ggplot2
library(ggplot2)
barchart<-ggplot(data=final_result,aes(x=Course,y=Avg_Satisfaction))+
  geom_col()+
  labs(title="Bar chart",x="Course",y="Average Satisfaction Level")
barchart

#task 9 : plotly/leaflet
library(plotly)
library(leaflet)
ggplotly(barchart)
map<-leaflet(df) %>%
  addTiles() %>%
  addMarkers(lng=~Longitude,lat=~Latitude,popup=~City)
map