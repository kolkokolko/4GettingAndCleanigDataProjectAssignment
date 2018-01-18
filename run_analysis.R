
setwd("C:/Users/hrist499/Documents/Coursera/DataSciennce/4GettingAndCleanigDataProjectAssignment/")
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
varNames <- gsub("[^A-Za-z|0-9]","",x=vars$V2)

### COMBINE DATA
train <- cbind(subjectTrain,YTrain,XTrain)
test <- cbind(subjectTest,YTest,XTest)
dataSet<-rbind(train,test)
###ASSIGN COLUMN NAMES
names(dataSet)<- c("subject","activity",varNames)

###EXTRACT DATA FOR mean AND std
### get the column for the users and activities and all that contain "mean" and "std" in their name

meanStdData <-dataSet[,c(1,2,grep("mean|std",names(dataSet)))]

###CHANGE THE ACTIVITY VARIABLE
meanStdData$activity<-as.factor(meanStdData$activity)
levels(meanStdData$activity)<-activities[,2]

### CONVERT TO DPLYR FORMAT
dataSet_Dp <- tbl_df(meanStdData)

summaryData <- dataSet_Dp %>% group_by(subject,activity) %>% summarise_all(funs(mean))
