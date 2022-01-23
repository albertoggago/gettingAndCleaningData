# Peer-graded Assignment: Getting and Cleaning Data Course Project CODEBOOK

***

## Original Information

*Project Information*
[Human Activity Recognition Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[*Download Information*](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Used files              | component         |  Purpose File                                                 
------------------------|-------------------|-------------------------------------------------------------------------
activity_labels.txt     | dfYActivityLabels | Labels of activity, identify each number of activity with a description
features.txt            | dfFeaturesColumnN | Labels of Features, identify each feature analysed with its name
test/x_test.txt         | dfX_test          | Observations made for each var or feature, test set.
test/y_test.txt         | dfY_test          | Activity done in the observation, test set.
test/subject_test.txt   | dfSubject_test    | Subject that made the observation, test set.
train/x_train.txt       | dfX_train         | Observations made for each var or feature, train set.
train/y_train.txt       | dfY_train         | Activity done in the observation, train set.
train/subject_train.txt | dfSubject_train   | Subject that made the observation, train set.

***

### 1 - Join files
* dfX is join by row of dfX_train and dfX_test
* dfY is join by row of dfY_train and dfY_test
* dfSubject is join by row of dfSubject_train and dfSubjec_test
* dfTotal is join by colum of  dfX, dfY and dfSubject.

**dfTotal data set has all information**

### 2 - Find all measures with mean and std from dfTOTAL 

**dfFinal has only subject, activity and all vars that contains mean and std**


### 3 - Use descriptive activuy names to named the activities

dfFinal update activity.

### 4 - Appropriately labels the data set with descriptive variable names.
In dfFinal update all names

* starting by "f" change by frequency
* starting by "t" change by time
* acc by Acceleration
* Clean BodyBody by Body
* Mag by Magnitude
* Gyro by Gyroscope
* Jerk by JerkSignals

### 5 - Create newTiddy

using dfFinal grouping the information by activity and subject ordered by activity and subject.
creating the new Data set **newTidy**

```
newTidy <- dfFinal %>% 
             group_by(activity, subject) %>%
             arrange(activity, subject)  %>%
             summarise_all("mean") %>%
             ungroup() 
```             
Save newTiddy in "newTiddy.txt"
             


## vars of newTiddy

newTiddy has 180 obs and 81 variables 

* timeBodyAcceleration.mean.X
* timeBodyAcceleration.mean.Y
* timeBodyAcceleration.mean.Z
* timeBodyAcceleration.std.X
* timeBodyAcceleration.std.Y
* timeBodyAcceleration.std.Z
* timeGravityAcceleration.mean.X
* timeGravityAcceleration.mean.Y
* timeGravityAcceleration.mean.Z
* timeGravityAcceleration.std.X
* timeGravityAcceleration.std.Y
* timeGravityAcceleration.std.Z
* timeBodyAccelerationJerkSignals.mean.X
* timeBodyAccelerationJerkSignals.mean.Y
* timeBodyAccelerationJerkSignals.mean.Z
* timeBodyAccelerationJerkSignals.std.X
* timeBodyAccelerationJerkSignals.std.Y
* timeBodyAccelerationJerkSignals.std.Z
* timeBodyGyroscope.mean.X
* timeBodyGyroscope.mean.Y
* timeBodyGyroscope.mean.Z
* timeBodyGyroscope.std.X
* timeBodyGyroscope.std.Y
* timeBodyGyroscope.std.Z
* timeBodyGyroscopeJerkSignals.mean.X
* timeBodyGyroscopeJerkSignals.mean.Y
* timeBodyGyroscopeJerkSignals.mean.Z
* timeBodyGyroscopeJerkSignals.std.X
* timeBodyGyroscopeJerkSignals.std.Y
* timeBodyGyroscopeJerkSignals.std.Z
* timeBodyAccelerationMagnitude.mean
* timeBodyAccelerationMagnitude.std
* timeGravityAccelerationMagnitude.mean
* timeGravityAccelerationMagnitude.std
* timeBodyAccelerationJerkSignalsMagnitude.mean
* timeBodyAccelerationJerkSignalsMagnitude.std
* timeBodyGyroscopeMagnitude.mean
* timeBodyGyroscopeMagnitude.std
* timeBodyGyroscopeJerkSignalsMagnitude.mean
* timeBodyGyroscopeJerkSignalsMagnitude.std
* frecuencyBodyAcceleration.mean.X
* frecuencyBodyAcceleration.mean.Y
* frecuencyBodyAcceleration.mean.Z
* frecuencyBodyAcceleration.std.X
* frecuencyBodyAcceleration.std.Y
* frecuencyBodyAcceleration.std.Z
* frecuencyBodyAcceleration.meanFreq.X
* frecuencyBodyAcceleration.meanFreq.Y
* frecuencyBodyAcceleration.meanFreq.Z
* frecuencyBodyAccelerationJerkSignals.mean.X
* frecuencyBodyAccelerationJerkSignals.mean.Y
* frecuencyBodyAccelerationJerkSignals.mean.Z
* frecuencyBodyAccelerationJerkSignals.std.X
* frecuencyBodyAccelerationJerkSignals.std.Y
* frecuencyBodyAccelerationJerkSignals.std.Z
* frecuencyBodyAccelerationJerkSignals.meanFreq.X
* frecuencyBodyAccelerationJerkSignals.meanFreq.YfrecuencyBodyAccelerationJerkSignals.meanFreq.Z
* frecuencyBodyGyroscope.mean.X
* frecuencyBodyGyroscope.mean.Y
* frecuencyBodyGyroscope.mean.Z
* frecuencyBodyGyroscope.std.X
* frecuencyBodyGyroscope.std.Y
* frecuencyBodyGyroscope.std.Z
* frecuencyBodyGyroscope.meanFreq.X
* frecuencyBodyGyroscope.meanFreq.Y
* frecuencyBodyGyroscope.meanFreq.Z
* frecuencyBodyAccelerationMagnitude.mean
* frecuencyBodyAccelerationMagnitude.std
* frecuencyBodyAccelerationMagnitude.meanFreq
* frecuencyBodyAccelerationJerkSignalsMagnitude.meanfrecuencyBodyAccelerationJerkSignalsMagnitude.std
* frecuencyBodyAccelerationJerkSignalsMagnitude.meanFreqfrecuencyBodyGyroscopeMagnitude.mean
* frecuencyBodyGyroscopeMagnitude.std
* frecuencyBodyGyroscopeMagnitude.meanFreq
* frecuencyBodyGyroscopeJerkSignalsMagnitude.meanfrecuencyBodyGyroscopeJerkSignalsMagnitude.std
* frecuencyBodyGyroscopeJerkSignalsMagnitude.meanFreqactivity
* subject

***

#### Extra information for uderstand each feature.

Feature Selection 

***

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'




