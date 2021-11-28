# 1 - part initial load libraries and clean environment
packagesToLoad <- c("stringr","tidyr", "dplyr", "rstudioapi")
install.packages(setdiff(packagesToLoad, rownames(installed.packages()))) 

library(stringr)
library(tidyr)
library(dplyr)
library(rstudioapi)
rm(list=ls())


#define working path in the place of R file. 
setwd(paste0(head(str_split(getSourceEditorContext()$path,"/")[[1]],-1),collapse="/"))
getwd()

# 2 - Load files.
# supposed the zip file has been unzip creating the folder "UCI HAR Dataset" in the place where run_analysis.R 
folder_data <- "UCI HAR Dataset"
file_data <- "getdata_projectfiles_UCI HAR Dataset.zip"
if (!file.exists(folder_data)) {
  print("Un zip file")
}

# 2.1 - Read DF with definitions one of Y activities and Features Column Names
dfYActivityLabels <- read.csv(paste0(folder_data,"/","activity_labels.txt"), header = FALSE)
dfYActivityLabels <- dfYActivityLabels %>% separate(1, c("key","label"), sep=" ")

dfFeaturesColumnN <- read.csv(paste0(folder_data,"/","features.txt"), header = FALSE, sep = "\t")
dfFeaturesColumnN <- dfFeaturesColumnN %>% separate(1, c("key","feature"), sep= " ")


# 2.2. Load files X and Y files. 
# ----Merges the training and the test sets to create one data set.---
dfX_test <- read.csv(paste0(folder_data,"/","test/","X_test.txt"), header = FALSE)
dfX_train <- read.csv(paste0(folder_data,"/","train/","X_train.txt"), header = FALSE)
dfY_test <- read.csv(paste0(folder_data,"/","test/","Y_test.txt"), header = FALSE)
dfY_train <- read.csv(paste0(folder_data,"/","train/","Y_train.txt"), header = FALSE)
dfX_test$type   <- "test"
dfX_train$type  <- "train"
dfY_test$type   <- "test"
dfY_train$type <- "train"
# merging train and test
dfX <- rbind(dfX_test, dfX_train)
dfY <- rbind(dfY_test, dfY_train)
rm(list = c("dfX_test","dfX_train","dfY_test","dfY_train"))

# 2.3. break all information in rows of X file
dfX$V1 <- str_trim(dfX$V1)
dfX <- dfX %>% separate(col=1, into=dfFeaturesColumnN$key, sep=" +", remove = TRUE)

# 2.4 merge both information the X files and Y files.
dfFinal <- dfX %>% select(-type) %>% mutate_if(is.character,as.numeric)
dfFinal$subject <- as.factor(dfX$type)
#separate variable into variable, estimated and additional vectors
dfFinal <- dfFinal %>% gather(key="variable",value="observation",1:561)
dfFinal$variable <- as.character(factor(dfFinal$variable,labels=dfFeaturesColumnN$feature,levels=dfFeaturesColumnN$key))

#This step need time. 
dfFinal <- dfFinal %>% separate("variable",c("variable","estimated","temp"), sep="-", remove = TRUE)
dfFinal <- dfFinal %>% separate("temp",c("coordinate","additionalV"), sep=",", remove = TRUE)

# -- Uses descriptive activity names to name the activities in the data set---
# -- Appropriately labels the data set with descriptive variable names. -- 
dfFinal$activity <- factor(dfY$V1,labels=dfYActivityLabels$label,levels=dfYActivityLabels$key)

dfFinal$variable <- as.factor(dfFinal$variable)
dfFinal$estimated <- as.factor(dfFinal$estimated)
dfFinal$coordinate <- as.factor(dfFinal$coordinate)
dfFinal$additionalV <- as.factor(dfFinal$additionalV)

rm(list = c("dfX","dfY", "dfFeaturesColumnN", "dfYActivityLabels","folder_data"))
str(dfFinal)

# 2.5 next step of script
# -- Extracts only the measurements on the mean and standard deviation for each measurement. --

dfMeanStd <- dfFinal[grep("(mean\\(\\)|std\\(\\))", dfFinal$estimated),]

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

dfAverage <- dfMeanStd %>% 
             group_by(variable, estimated, coordinate) %>%
             summarise(mean = mean(observation)) %>% 
             arrange(variable, estimated, coordinate)
write.table(dfAverage,row.name=FALSE)