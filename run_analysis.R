
subjectTest<-read.csv("../../UCI HAR Dataset/test/subject_test.txt",header = FALSE)
XTest<-read.csv("../../UCI HAR Dataset/test/X_test.txt",sep ="",header = FALSE)
YTest<-read.csv("../../UCI HAR Dataset/test/y_test.txt",header = FALSE)
subjectTrain<-read.csv("../../UCI HAR Dataset/train/subject_train.txt",header = FALSE)
XTrain<-read.csv("../../UCI HAR Dataset/train/X_train.txt",sep ="",header = FALSE)
YTrain<-read.csv("../../UCI HAR Dataset/train/y_train.txt",header = FALSE)
innertial<-read.csv("../../UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",sep ="",header = FALSE)
mean((innertial[1,]))
vars <- readLines("../../UCI HAR Dataset/features.txt")

varNames <- gsub([^A-Za-z|0-9],"",x=vars)
v<- read.csv("../../UCI HAR Dataset/features.txt",sep="",header = FALSE)
train <- cbind(subjectTrain,XTrain,YTrain)
test <- cbind(subjectTest,XTest,YTest)
XTest[1,]
grep(-0.004203632,XTest[,1])
