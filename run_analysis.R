#########################################################################################################
# Input files:
# - subject_test.txt, subject_train.txt
# - X_test.txt, X_train.txt
# - Y_test, Y_train
# - activity_labels.txt
# - features.txt
# Output: 
# clean data frame containing the average of each variable for each activity and each subject.
# 
# The script does the following: 
#   -Merges the training and the test sets to create one data set.
#   -Extracts only the measurements on the mean and standard deviation for each measurement.
#   -Uses descriptive activity names to name the activities in the data set
#   -Appropriately labels the data set with descriptive variable names.
#   -From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#########################################################################################################

setwd("C:~/Documents/Coursera/DataSciennce/4GettingAndCleanigDataProjectAssignment/")
library(dplyr)

###READ IN THE DATA FILES 
subjectTest<-read.csv("../../UCI HAR Dataset/test/subject_test.txt",header = FALSE)
XTest<-read.csv("../../UCI HAR Dataset/test/X_test.txt",sep ="",header = FALSE)
YTest<-read.csv("../../UCI HAR Dataset/test/y_test.txt",header = FALSE)
subjectTrain<-read.csv("../../UCI HAR Dataset/train/subject_train.txt",header = FALSE)
XTrain<-read.csv("../../UCI HAR Dataset/train/X_train.txt",sep ="",header = FALSE)
YTrain<-read.csv("../../UCI HAR Dataset/train/y_train.txt",header = FALSE)

###READ IN THE ACTIVITY NAMES
activities<-read.csv("../../UCI HAR Dataset/activity_labels.txt",sep="",header = FALSE)

###READ IN THE VARIABLE NAMES
vars<- read.csv("../../UCI HAR Dataset/features.txt",sep="",header = FALSE)
varNames <- gsub("[^A-Za-z|0-9]","",x=vars$V2) # replaces evrything that is not a number nor letter

### COMBINE  TRAIN AND TEST DATA
train <- cbind(subjectTrain,YTrain,XTrain)
test <- cbind(subjectTest,YTest,XTest)
dataSet<-rbind(train,test)
###ASSIGN COLUMN NAMES
names(dataSet)<- c("subject","activity",varNames)

###EXTRACT DATA FOR mean AND std
### get all columns containin "mean" and "std" in their name and the first two "columns" subject and "activity"

meanStdData <-dataSet[,c(1,2,grep("mean|std",names(dataSet)))]

###CHANGE THE ACTIVITY VARIABLE from numbers to text (1,2,3,4,5-> walking, walking upstairs,...)
meanStdData$activity<-as.factor(meanStdData$activity)
levels(meanStdData$activity)<-activities[,2]

### CONVERT TO DPLYR FORMAT
dataSet_Dp <- tbl_df(meanStdData)
# calculate the mean for all columns for each "subject" and each "activity"

summaryData <- dataSet_Dp %>% group_by(subject,activity) %>% summarise_all(funs(mean))
