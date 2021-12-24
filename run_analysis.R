# initial load libraries and clean environment
packagesToLoad <- c("stringr","tidyr", "dplyr", "rstudioapi")
install.packages(setdiff(packagesToLoad, rownames(installed.packages()))) 
library(stringr)
library(tidyr)
library(dplyr)
library(rstudioapi)
rm(list=ls())
setwd(paste0(head(str_split(getSourceEditorContext()$path,"/")[[1]],-1),collapse="/"))
getwd()

# Load files.
folder_data <- "UCI HAR Dataset"
urlFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file_data <- "getdata_projectfiles_UCI HAR Dataset.zip"

if (!file.exists(file_data)) {
  download.file(urlFile,file_data,method="curl")
}
if (!dir.exists(folder_data)) {
    unzip(file_data)
}

# Read DF with definitions one of Y activities and Features Column Names
dfYActivityLabels <- read.table(paste(folder_data,"activity_labels.txt", sep = "/"),col.names = c("key","label"))
dfFeaturesColumnN <- read.table(paste(folder_data,"features.txt", sep = "/"), col.names = c("key","feature"))

dfX_test <- read.table(paste(folder_data,"test","x_test.txt", sep = "/"), col.names = dfFeaturesColumnN$feature)
dfY_test <- read.table(paste(folder_data,"test","y_test.txt", sep = "/"), col.names = c("activity"))
dfX_train <- read.table(paste(folder_data,"train","x_train.txt", sep = "/"), col.names = dfFeaturesColumnN$feature)
dfY_train <- read.table(paste(folder_data,"train","y_train.txt", sep = "/"), col.names = c("activity"))
dfSubject_train <- read.table(paste(folder_data,"train","subject_train.txt", sep = "/"), col.names = c("subject"))
dfSubject_test <- read.table(paste(folder_data,"test","subject_test.txt", sep = "/"), col.names = c("subject"))
dfX_test$type   <- "test"
dfX_train$type  <- "train"
# 1 - Merges the training and the test sets to create one data set.
dfX <- rbind(dfX_test, dfX_train)
dfY <- rbind(dfY_test, dfY_train)
dfSubject <- rbind(dfSubject_test, dfSubject_train)
dfTotal <- cbind(dfX,dfY,dfSubject)

# 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
dfFinal <- dfTotal[,c(grep("mean|std",names(dfTotal)),(dim(dfTotal)[2]-3):dim(dfTotal)[2])]

#separate variable into variable, estimated and additional vectors
dfFinal <- dfFinal %>% gather(key="variable",value="observation",1:(dim(dfFinal)[2]-3))
dfFinal <- dfFinal %>% separate("variable",c("variable","estimated","coordinate"))

#clean all information using factors instead chars.
dfFinal$activity <- factor(dfFinal$activity,labels=dfYActivityLabels$label,levels=dfYActivityLabels$key)
dfFinal$estimated <- as.factor(dfFinal$estimated)
dfFinal$coordinate <- as.factor(dfFinal$coordinate)
dfFinal$type <- as.factor(dfFinal$type)

# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names. 
dfFinal$variable <- gsub("Acc","Acceleration",dfFinal$variable)
dfFinal$variable <- gsub("^f","frecuency",dfFinal$variable)
dfFinal$variable <- gsub("^t","time",dfFinal$variable)
dfFinal$variable <- gsub("BodyBody","Body",dfFinal$variable)
dfFinal$variable <- gsub("Mag","Magnitude",dfFinal$variable)
dfFinal$variable <- gsub("Gyro","Gyroscope",dfFinal$variable)
dfFinal$variable <- gsub("Jerk","JerkSignals",dfFinal$variable)
dfFinal$variable <- as.factor(dfFinal$variable)

summary(dfFinal)
str(dfFinal)

# 5 From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.

dfAverage <- dfFinal %>% 
             group_by(activity, subject, variable, estimated, coordinate) %>%
             summarise(mean = mean(observation)) %>% 
             arrange(activity, subject, variable, estimated, coordinate)

# 7 Save document
write.table(dfAverage,file="tidy_data.txt",row.name=FALSE)

