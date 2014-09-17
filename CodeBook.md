# Getting and Cleaning Data Assignment

The source file is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The downloaded file is unzipped and the raw dataset 'UCI HAR Dataset' is obtained.

## Transforming the data
These are the step in transforming the data:  
1. Read the 'features.txt' file and remove the first column  
2. Read the 'X_test.txt' files of the 'test' directory  
3. Label the columns of the 'X_test.txt' file using the data from the trimmed 'features.txt' file  
4. Read the 'y_test.txt' file of the 'test' directory and label the column 'Activity'  
5. Read the 'subject_test.txt' file of the 'test' directory and label the column 'SubjectID'  
6. Bind the formatted subject_test, y_test, X_test by column, in that order
7. Read the 'X_train.txt' files of the 'train' directory  
8. Label the columns of the 'X_train.txt' file using the data from the trimmed 'features.txt' file  
9. Read the 'y_train.txt' file of the 'train' directory and label the column 'Activity'  
10. Read the 'subject_train.txt' file of the 'train' directory and label the column 'SubjectID'  
11. Bind the formatted subject_train, y_train, X_train by column, in that order 
12. Bind the test and training set by row  
13. Subset the data only with column name include the words 'mean(' or 'std('  
14. Replace the numeric activity code with activity code and text; information of the activity   labels is from the 'activity_labels.txt'file  
15. Calculate the mean of each measurement, group by 'SubjectID' and'Activity'  
16. Write the summarized dataset, i.e. tidy data, into 'tidyData.txt'  

## Description of variables and data
- SubjectID - the unique identifier of the subject (1 - 30)
- Activity - the code and the type of the activity (1-WALKING, 2-WALKING_UPSTAIRS, 3-WALKING_DOWNSTAIRS,4-SITTING, 5-STANDING, 6-LAYING)

***The following variables are defined as per the raw dataset.  Averages of each measurment grouped by SubjectID and Activity are presented.  The tidy data is ordered by SubjectID and Activity***  
*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.*

*Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).* 

*Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).*

*These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

*The set of variables that were estimated from these signals are: mean(): Mean value and std(): Standard deviation*

- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()