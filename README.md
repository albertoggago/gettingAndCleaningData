# gettingAndCleaningData

Getting and Cleaning Data final Exercise

**Steps of run_analysis.R script**

## Initial load libraries and clean environment
Load all needed libraries.

## Load files.
Process the file data. 

If the file data to analysis does not exist then the process load the file data
If the folder unzip does not exist then the process unzip the file data

I did it for not save the file data into the project.

## Read DF with definitions one of Y activities and Features Column Names  
Load files of definition of activities and Feature vars analyse.

* dfYActivityLabels has the information of all activities to label
* dfFeaturesColumnN has the information of each feature var

## Load files X and Y files. 
Get all files from test and train for X, Y and subject. 

## 1 - Merges the training and the test sets to create one data set.
Actions:

* Merge X by Row
* Merge Y by Row
* Merge Subject by row
* Merge 3 previous by Column

All information is in the same DF: dfTotal

## 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
dfFinal is the extraction of dfTotal for only the vars related with mean and std also including activity and subject  

## 3 - Uses descriptive activity names to name the activities in the data set
activity using dfYActivityLabels is created as a factor.

## 4 - Appropriately labels the data set with descriptive variable names. 
Change the name of vars adding information more descriptive

* starting by "f" change by frequency
* starting by "t" change by time
* acc by Acceleration
* Clean BodyBody by Body
* Mag by Magnitude
* Gyro by Gyroscope
* Jerk by JerkSignals

## 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Saved in file tidy_data.txt 

grouping all information by average for activity and subject.

## Create codebook

Using the information of vars, creating a codebook describing each var.

Download the file as a csv. Codebook "codebook_dfFinal.csv" are included into project. 

I´d rather user the information of each var because it can help in the maintenance.