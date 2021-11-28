# gettingAndCleaningData
Getting and Cleaning Data final Exercise

# The process is divide by several phases

## 1 - Initial load libraries and clean environment

## 2 - Load files.
The zip are included into git the system check exists the path or need to unzip file

## 3 - Read DF with definitions one of Y activities and Features Column Names  
Load files of definition of activities and Feature vars analyse

## 4 Load files X and Y files. 
**Merges the training and the test sets to create one data set.**
**Uses descriptive activity names to name the activities in the data set**
**Appropriately labels the data set with descriptive variable names. **

## 5 Extract only the measurements on the mean and standard deviation

**Extracts only the measurements on the mean and standard deviation for each measurement.**

## 6 Data set with the average of each variable of previous table

**From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

## 7 FINAL RESULT is:

variable | estimated | coordinate | mean | 
-------- | --------- | ---------- | ---- | 
fBodyAcc | mean()    | X          | -0.622761658493734 | 
 | fBodyAcc | mean() | Y | -0.53749328145871 | 
 | fBodyAcc | mean() | Z | -0.665033506271952 | 
 | fBodyAcc | std() | X | -0.603356276555826 | 
 | fBodyAcc | std() | Y | -0.528420009576204 | 
 | fBodyAcc | std() | Z | -0.617874813333395 | 
 | fBodyAccJerk | mean() | X | -0.656713524546605 | 
 | fBodyAccJerk | mean() | Y | -0.628961179980356 | 
 | fBodyAccJerk | mean() | Z | -0.743608246170053 | 
 | fBodyAccJerk | std() | X | -0.654979816705833 | 
 | fBodyAccJerk | std() | Y | -0.612243590244114 | 
 | fBodyAccJerk | std() | Z | -0.780928428167213 | 
 | fBodyAccMag | mean() | NA | -0.585962696268539 | 
 | fBodyAccMag | std() | NA | -0.659531216655476 | 
 | fBodyBodyAccJerkMag | mean() | NA | -0.620789916331592 | 
 | fBodyBodyAccJerkMag | std() | NA | -0.640076803144351 | 
 | fBodyBodyGyroJerkMag | mean() | NA | -0.779767633083527 | 
 | fBodyBodyGyroJerkMag | std() | NA | -0.792190209274884 | 
 | fBodyBodyGyroMag | mean() | NA | -0.697411069729937 | 
 | fBodyBodyGyroMag | std() | NA | -0.699976372277643 | 
 | fBodyGyro | mean() | X | -0.672094306818974 | 
 | fBodyGyro | mean() | Y | -0.70621663959074 | 
 | fBodyGyro | mean() | Z | -0.644192752866115 | 
 | fBodyGyro | std() | X | -0.738594816501343 | 
 | fBodyGyro | std() | Y | -0.674226934551517 | 
 | fBodyGyro | std() | Z | -0.690446312501126 | 
 | tBodyAcc | mean() | X | 0.274347260646063 | 
 | tBodyAcc | mean() | Y | -0.0177434918458972 | 
 | tBodyAcc | mean() | Z | -0.108925032737064 | 
 | tBodyAcc | std() | X | -0.607783818968688 | 
 | tBodyAcc | std() | Y | -0.510191378479501 | 
 | tBodyAcc | std() | Z | -0.61306429934125 | 
 | tBodyAccJerk | mean() | X | 0.0789381220355816 | 
 | tBodyAccJerk | mean() | Y | 0.0079481069090025 | 
 | tBodyAccJerk | mean() | Z | -0.00467469823628666 | 
 | tBodyAccJerk | std() | X | -0.63978102073413 | 
 | tBodyAccJerk | std() | Y | -0.607971599340832 | 
 | tBodyAccJerk | std() | Z | -0.762820240449202 | 
 | tBodyAccJerkMag | mean() | NA |  -0.649417950650692 | 
 | tBodyAccJerkMag | std() | NA |  -0.627762945785391 | 
 | tBodyAccMag | mean() | NA |  -0.54822165976717 | 
 | tBodyAccMag | std() | NA |  -0.591225327146546 | 
 | tBodyGyro | mean() | X | -0.0309824871713436 | 
 | tBodyGyro | mean() | Y | -0.0747194855994359 | 
 | tBodyGyro | mean() | Z | 0.088357304227173 | 
 | tBodyGyro | std() | X | -0.721192598029789 | 
 | tBodyGyro | std() | Y | -0.682653506899942 | 
 | tBodyGyro | std() | Z | -0.653665674372188 | 
 | tBodyGyroJerk | mean() | X | -0.0967092754729682 | 
 | tBodyGyroJerk | mean() | Y | -0.0423181079782632 | 
 | tBodyGyroJerk | mean() | Z | -0.0548303497968374 | 
 | tBodyGyroJerk | std() | X | -0.731348533131935 | 
 | tBodyGyroJerk | std() | Y | -0.786062320321895 | 
 | tBodyGyroJerk | std() | Z | -0.739932395222129 | 
 | tBodyGyroJerkMag | mean() | NA | -0.762137610987416 | 
 | tBodyGyroJerkMag | std() | NA | -0.77799317279698 | 
 | tBodyGyroMag | mean() | NA | -0.60524856977632 | 
 | tBodyGyroMag | std() | NA | -0.662533062898382 | 
 | tGravityAcc | mean() | X | 0.669226222373046 | 
 | tGravityAcc | mean() | Y | 0.00403879092060517 | 
 | tGravityAcc | mean() | Z | 0.0921508600211059 | 
 | tGravityAcc | std() | X | -0.965207115039421 | 
 | tGravityAcc | std() | Y | -0.95440802665318 | 
 | tGravityAcc | std() | Z | -0.938900969424022 | 
 | tGravityAccMag | mean() | NA | -0.54822165976717 | 
 | tGravityAccMag | std() | NA | -0.591225327146546 | 
