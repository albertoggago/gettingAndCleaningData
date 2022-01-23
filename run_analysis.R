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
dfFinal <- dfTotal[,c(grep("mean|std|activity|subject",names(dfTotal)))]

# 3 - Uses descriptive activity names to name the activities in the data set
dfFinal$activity <- factor(dfFinal$activity,labels=dfYActivityLabels$label,levels=dfYActivityLabels$key)
dfFinal$subject <- as.factor(dfFinal$subject)

# 4 - Appropriately labels the data set with descriptive variable names. 
names(dfFinal) <- gsub("Acc","Acceleration",names(dfFinal))
names(dfFinal) <- gsub("^f","frecuency",names(dfFinal))
names(dfFinal) <- gsub("^t","time",names(dfFinal))
names(dfFinal) <- gsub("BodyBody","Body",names(dfFinal))
names(dfFinal) <- gsub("Mag","Magnitude",names(dfFinal))
names(dfFinal) <- gsub("Gyro","Gyroscope",names(dfFinal))
names(dfFinal) <- gsub("Jerk","JerkSignals",names(dfFinal))
names(dfFinal) <- gsub("\\.\\.\\.",".",names(dfFinal))
names(dfFinal) <- gsub("\\.\\.","",names(dfFinal))

names(dfFinal)
summary(dfFinal$subject)
str(dfFinal)

# 5 From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.

newTidy <- dfFinal %>% 
             group_by(activity, subject) %>%
             arrange(activity, subject)  %>%
             summarise_all("mean") %>%
             ungroup() 
# Save document
write.table(newTidy,file="newTidy.txt",row.names = FALSE, col.names= TRUE, sep = "\t")
