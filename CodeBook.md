---
title: "Coursera Data Science Specialization Peer-graded Assignment: Getting and Cleaning Data Course Project - CodeBook"
author: "Sunil Garg"
date: "June 17, 2017"
output: html_document
---

# Code Book for Getting and Cleaning Data Course Assignment


## 1: Description
This code book describes the variables, the data, and any transformations or work that were performed to clean up the data for Coursera's Johns Hopkins Getting and Cleaning Data course Peer Graded Assignment. It includes the descriptions of both the input dataset as well as the final tidy dataset.


## 2: Input Data Set Details
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### 2.1: Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels. Its range is from 1 to 6 with the corresponding activity names described in activity_labels.txt.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels. Its range is from 1 to 6 with the corresponding activity names described in activity_labels.txt

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


### 2.2: Features Selection (features_info.txt)
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The full list of variables of each feature vector (as described in features.txt) is as follows:
- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tBodyAcc-mad()-X
- tBodyAcc-mad()-Y
- tBodyAcc-mad()-Z
- tBodyAcc-max()-X
- tBodyAcc-max()-Y
- tBodyAcc-max()-Z
- tBodyAcc-min()-X
- tBodyAcc-min()-Y
- tBodyAcc-min()-Z
- tBodyAcc-sma()
- tBodyAcc-energy()-X
- tBodyAcc-energy()-Y
- tBodyAcc-energy()-Z
- tBodyAcc-iqr()-X
- tBodyAcc-iqr()-Y
- tBodyAcc-iqr()-Z
- tBodyAcc-entropy()-X
- tBodyAcc-entropy()-Y
- tBodyAcc-entropy()-Z
- tBodyAcc-arCoeff()-X,1
- tBodyAcc-arCoeff()-X,2
- tBodyAcc-arCoeff()-X,3
- tBodyAcc-arCoeff()-X,4
- tBodyAcc-arCoeff()-Y,1
- tBodyAcc-arCoeff()-Y,2
- tBodyAcc-arCoeff()-Y,3
- tBodyAcc-arCoeff()-Y,4
- tBodyAcc-arCoeff()-Z,1
- tBodyAcc-arCoeff()-Z,2
- tBodyAcc-arCoeff()-Z,3
- tBodyAcc-arCoeff()-Z,4
- tBodyAcc-correlation()-X,Y
- tBodyAcc-correlation()-X,Z
- tBodyAcc-correlation()-Y,Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tGravityAcc-mad()-X
- tGravityAcc-mad()-Y
- tGravityAcc-mad()-Z
- tGravityAcc-max()-X
- tGravityAcc-max()-Y
- tGravityAcc-max()-Z
- tGravityAcc-min()-X
- tGravityAcc-min()-Y
- tGravityAcc-min()-Z
- tGravityAcc-sma()
- tGravityAcc-energy()-X
- tGravityAcc-energy()-Y
- tGravityAcc-energy()-Z
- tGravityAcc-iqr()-X
- tGravityAcc-iqr()-Y
- tGravityAcc-iqr()-Z
- tGravityAcc-entropy()-X
- tGravityAcc-entropy()-Y
- tGravityAcc-entropy()-Z
- tGravityAcc-arCoeff()-X,1
- tGravityAcc-arCoeff()-X,2
- tGravityAcc-arCoeff()-X,3
- tGravityAcc-arCoeff()-X,4
- tGravityAcc-arCoeff()-Y,1
- tGravityAcc-arCoeff()-Y,2
- tGravityAcc-arCoeff()-Y,3
- tGravityAcc-arCoeff()-Y,4
- tGravityAcc-arCoeff()-Z,1
- tGravityAcc-arCoeff()-Z,2
- tGravityAcc-arCoeff()-Z,3
- tGravityAcc-arCoeff()-Z,4
- tGravityAcc-correlation()-X,Y
- tGravityAcc-correlation()-X,Z
- tGravityAcc-correlation()-Y,Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyAccJerk-mad()-X
- tBodyAccJerk-mad()-Y
- tBodyAccJerk-mad()-Z
- tBodyAccJerk-max()-X
- tBodyAccJerk-max()-Y
- tBodyAccJerk-max()-Z
- tBodyAccJerk-min()-X
- tBodyAccJerk-min()-Y
- tBodyAccJerk-min()-Z
- tBodyAccJerk-sma()
- tBodyAccJerk-energy()-X
- tBodyAccJerk-energy()-Y
- tBodyAccJerk-energy()-Z
- tBodyAccJerk-iqr()-X
- tBodyAccJerk-iqr()-Y
- tBodyAccJerk-iqr()-Z
- tBodyAccJerk-entropy()-X
- tBodyAccJerk-entropy()-Y
- tBodyAccJerk-entropy()-Z
- tBodyAccJerk-arCoeff()-X,1
- tBodyAccJerk-arCoeff()-X,2
- tBodyAccJerk-arCoeff()-X,3
- tBodyAccJerk-arCoeff()-X,4
- tBodyAccJerk-arCoeff()-Y,1
- tBodyAccJerk-arCoeff()-Y,2
- tBodyAccJerk-arCoeff()-Y,3
- tBodyAccJerk-arCoeff()-Y,4
- tBodyAccJerk-arCoeff()-Z,1
- tBodyAccJerk-arCoeff()-Z,2
- tBodyAccJerk-arCoeff()-Z,3
- tBodyAccJerk-arCoeff()-Z,4
- tBodyAccJerk-correlation()-X,Y
- tBodyAccJerk-correlation()-X,Z
- tBodyAccJerk-correlation()-Y,Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyro-mad()-X
- tBodyGyro-mad()-Y
- tBodyGyro-mad()-Z
- tBodyGyro-max()-X
- tBodyGyro-max()-Y
- tBodyGyro-max()-Z
- tBodyGyro-min()-X
- tBodyGyro-min()-Y
- tBodyGyro-min()-Z
- tBodyGyro-sma()
- tBodyGyro-energy()-X
- tBodyGyro-energy()-Y
- tBodyGyro-energy()-Z
- tBodyGyro-iqr()-X
- tBodyGyro-iqr()-Y
- tBodyGyro-iqr()-Z
- tBodyGyro-entropy()-X
- tBodyGyro-entropy()-Y
- tBodyGyro-entropy()-Z
- tBodyGyro-arCoeff()-X,1
- tBodyGyro-arCoeff()-X,2
- tBodyGyro-arCoeff()-X,3
- tBodyGyro-arCoeff()-X,4
- tBodyGyro-arCoeff()-Y,1
- tBodyGyro-arCoeff()-Y,2
- tBodyGyro-arCoeff()-Y,3
- tBodyGyro-arCoeff()-Y,4
- tBodyGyro-arCoeff()-Z,1
- tBodyGyro-arCoeff()-Z,2
- tBodyGyro-arCoeff()-Z,3
- tBodyGyro-arCoeff()-Z,4
- tBodyGyro-correlation()-X,Y
- tBodyGyro-correlation()-X,Z
- tBodyGyro-correlation()-Y,Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyGyroJerk-mad()-X
- tBodyGyroJerk-mad()-Y
- tBodyGyroJerk-mad()-Z
- tBodyGyroJerk-max()-X
- tBodyGyroJerk-max()-Y
- tBodyGyroJerk-max()-Z
- tBodyGyroJerk-min()-X
- tBodyGyroJerk-min()-Y
- tBodyGyroJerk-min()-Z
- tBodyGyroJerk-sma()
- tBodyGyroJerk-energy()-X
- tBodyGyroJerk-energy()-Y
- tBodyGyroJerk-energy()-Z
- tBodyGyroJerk-iqr()-X
- tBodyGyroJerk-iqr()-Y
- tBodyGyroJerk-iqr()-Z
- tBodyGyroJerk-entropy()-X
- tBodyGyroJerk-entropy()-Y
- tBodyGyroJerk-entropy()-Z
- tBodyGyroJerk-arCoeff()-X,1
- tBodyGyroJerk-arCoeff()-X,2
- tBodyGyroJerk-arCoeff()-X,3
- tBodyGyroJerk-arCoeff()-X,4
- tBodyGyroJerk-arCoeff()-Y,1
- tBodyGyroJerk-arCoeff()-Y,2
- tBodyGyroJerk-arCoeff()-Y,3
- tBodyGyroJerk-arCoeff()-Y,4
- tBodyGyroJerk-arCoeff()-Z,1
- tBodyGyroJerk-arCoeff()-Z,2
- tBodyGyroJerk-arCoeff()-Z,3
- tBodyGyroJerk-arCoeff()-Z,4
- tBodyGyroJerk-correlation()-X,Y
- tBodyGyroJerk-correlation()-X,Z
- tBodyGyroJerk-correlation()-Y,Z
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tBodyAccMag-mad()
- tBodyAccMag-max()
- tBodyAccMag-min()
- tBodyAccMag-sma()
- tBodyAccMag-energy()
- tBodyAccMag-iqr()
- tBodyAccMag-entropy()
- tBodyAccMag-arCoeff()1
- tBodyAccMag-arCoeff()2
- tBodyAccMag-arCoeff()3
- tBodyAccMag-arCoeff()4
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tGravityAccMag-mad()
- tGravityAccMag-max()
- tGravityAccMag-min()
- tGravityAccMag-sma()
- tGravityAccMag-energy()
- tGravityAccMag-iqr()
- tGravityAccMag-entropy()
- tGravityAccMag-arCoeff()1
- tGravityAccMag-arCoeff()2
- tGravityAccMag-arCoeff()3
- tGravityAccMag-arCoeff()4
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyAccJerkMag-mad()
- tBodyAccJerkMag-max()
- tBodyAccJerkMag-min()
- tBodyAccJerkMag-sma()
- tBodyAccJerkMag-energy()
- tBodyAccJerkMag-iqr()
- tBodyAccJerkMag-entropy()
- tBodyAccJerkMag-arCoeff()1
- tBodyAccJerkMag-arCoeff()2
- tBodyAccJerkMag-arCoeff()3
- tBodyAccJerkMag-arCoeff()4
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroMag-mad()
- tBodyGyroMag-max()
- tBodyGyroMag-min()
- tBodyGyroMag-sma()
- tBodyGyroMag-energy()
- tBodyGyroMag-iqr()
- tBodyGyroMag-entropy()
- tBodyGyroMag-arCoeff()1
- tBodyGyroMag-arCoeff()2
- tBodyGyroMag-arCoeff()3
- tBodyGyroMag-arCoeff()4
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- tBodyGyroJerkMag-mad()
- tBodyGyroJerkMag-max()
- tBodyGyroJerkMag-min()
- tBodyGyroJerkMag-sma()
- tBodyGyroJerkMag-energy()
- tBodyGyroJerkMag-iqr()
- tBodyGyroJerkMag-entropy()
- tBodyGyroJerkMag-arCoeff()1
- tBodyGyroJerkMag-arCoeff()2
- tBodyGyroJerkMag-arCoeff()3
- tBodyGyroJerkMag-arCoeff()4
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAcc-mad()-X
- fBodyAcc-mad()-Y
- fBodyAcc-mad()-Z
- fBodyAcc-max()-X
- fBodyAcc-max()-Y
- fBodyAcc-max()-Z
- fBodyAcc-min()-X
- fBodyAcc-min()-Y
- fBodyAcc-min()-Z
- fBodyAcc-sma()
- fBodyAcc-energy()-X
- fBodyAcc-energy()-Y
- fBodyAcc-energy()-Z
- fBodyAcc-iqr()-X
- fBodyAcc-iqr()-Y
- fBodyAcc-iqr()-Z
- fBodyAcc-entropy()-X
- fBodyAcc-entropy()-Y
- fBodyAcc-entropy()-Z
- fBodyAcc-maxInds-X
- fBodyAcc-maxInds-Y
- fBodyAcc-maxInds-Z
- fBodyAcc-meanFreq()-X
- fBodyAcc-meanFreq()-Y
- fBodyAcc-meanFreq()-Z
- fBodyAcc-skewness()-X
- fBodyAcc-kurtosis()-X
- fBodyAcc-skewness()-Y
- fBodyAcc-kurtosis()-Y
- fBodyAcc-skewness()-Z
- fBodyAcc-kurtosis()-Z
- fBodyAcc-bandsEnergy()-1,8
- fBodyAcc-bandsEnergy()-9,16
- fBodyAcc-bandsEnergy()-17,24
- fBodyAcc-bandsEnergy()-25,32
- fBodyAcc-bandsEnergy()-33,40
- fBodyAcc-bandsEnergy()-41,48
- fBodyAcc-bandsEnergy()-49,56
- fBodyAcc-bandsEnergy()-57,64
- fBodyAcc-bandsEnergy()-1,16
- fBodyAcc-bandsEnergy()-17,32
- fBodyAcc-bandsEnergy()-33,48
- fBodyAcc-bandsEnergy()-49,64
- fBodyAcc-bandsEnergy()-1,24
- fBodyAcc-bandsEnergy()-25,48
- fBodyAcc-bandsEnergy()-1,8
- fBodyAcc-bandsEnergy()-9,16
- fBodyAcc-bandsEnergy()-17,24
- fBodyAcc-bandsEnergy()-25,32
- fBodyAcc-bandsEnergy()-33,40
- fBodyAcc-bandsEnergy()-41,48
- fBodyAcc-bandsEnergy()-49,56
- fBodyAcc-bandsEnergy()-57,64
- fBodyAcc-bandsEnergy()-1,16
- fBodyAcc-bandsEnergy()-17,32
- fBodyAcc-bandsEnergy()-33,48
- fBodyAcc-bandsEnergy()-49,64
- fBodyAcc-bandsEnergy()-1,24
- fBodyAcc-bandsEnergy()-25,48
- fBodyAcc-bandsEnergy()-1,8
- fBodyAcc-bandsEnergy()-9,16
- fBodyAcc-bandsEnergy()-17,24
- fBodyAcc-bandsEnergy()-25,32
- fBodyAcc-bandsEnergy()-33,40
- fBodyAcc-bandsEnergy()-41,48
- fBodyAcc-bandsEnergy()-49,56
- fBodyAcc-bandsEnergy()-57,64
- fBodyAcc-bandsEnergy()-1,16
- fBodyAcc-bandsEnergy()-17,32
- fBodyAcc-bandsEnergy()-33,48
- fBodyAcc-bandsEnergy()-49,64
- fBodyAcc-bandsEnergy()-1,24
- fBodyAcc-bandsEnergy()-25,48
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyAccJerk-mad()-X
- fBodyAccJerk-mad()-Y
- fBodyAccJerk-mad()-Z
- fBodyAccJerk-max()-X
- fBodyAccJerk-max()-Y
- fBodyAccJerk-max()-Z
- fBodyAccJerk-min()-X
- fBodyAccJerk-min()-Y
- fBodyAccJerk-min()-Z
- fBodyAccJerk-sma()
- fBodyAccJerk-energy()-X
- fBodyAccJerk-energy()-Y
- fBodyAccJerk-energy()-Z
- fBodyAccJerk-iqr()-X
- fBodyAccJerk-iqr()-Y
- fBodyAccJerk-iqr()-Z
- fBodyAccJerk-entropy()-X
- fBodyAccJerk-entropy()-Y
- fBodyAccJerk-entropy()-Z
- fBodyAccJerk-maxInds-X
- fBodyAccJerk-maxInds-Y
- fBodyAccJerk-maxInds-Z
- fBodyAccJerk-meanFreq()-X
- fBodyAccJerk-meanFreq()-Y
- fBodyAccJerk-meanFreq()-Z
- fBodyAccJerk-skewness()-X
- fBodyAccJerk-kurtosis()-X
- fBodyAccJerk-skewness()-Y
- fBodyAccJerk-kurtosis()-Y
- fBodyAccJerk-skewness()-Z
- fBodyAccJerk-kurtosis()-Z
- fBodyAccJerk-bandsEnergy()-1,8
- fBodyAccJerk-bandsEnergy()-9,16
- fBodyAccJerk-bandsEnergy()-17,24
- fBodyAccJerk-bandsEnergy()-25,32
- fBodyAccJerk-bandsEnergy()-33,40
- fBodyAccJerk-bandsEnergy()-41,48
- fBodyAccJerk-bandsEnergy()-49,56
- fBodyAccJerk-bandsEnergy()-57,64
- fBodyAccJerk-bandsEnergy()-1,16
- fBodyAccJerk-bandsEnergy()-17,32
- fBodyAccJerk-bandsEnergy()-33,48
- fBodyAccJerk-bandsEnergy()-49,64
- fBodyAccJerk-bandsEnergy()-1,24
- fBodyAccJerk-bandsEnergy()-25,48
- fBodyAccJerk-bandsEnergy()-1,8
- fBodyAccJerk-bandsEnergy()-9,16
- fBodyAccJerk-bandsEnergy()-17,24
- fBodyAccJerk-bandsEnergy()-25,32
- fBodyAccJerk-bandsEnergy()-33,40
- fBodyAccJerk-bandsEnergy()-41,48
- fBodyAccJerk-bandsEnergy()-49,56
- fBodyAccJerk-bandsEnergy()-57,64
- fBodyAccJerk-bandsEnergy()-1,16
- fBodyAccJerk-bandsEnergy()-17,32
- fBodyAccJerk-bandsEnergy()-33,48
- fBodyAccJerk-bandsEnergy()-49,64
- fBodyAccJerk-bandsEnergy()-1,24
- fBodyAccJerk-bandsEnergy()-25,48
- fBodyAccJerk-bandsEnergy()-1,8
- fBodyAccJerk-bandsEnergy()-9,16
- fBodyAccJerk-bandsEnergy()-17,24
- fBodyAccJerk-bandsEnergy()-25,32
- fBodyAccJerk-bandsEnergy()-33,40
- fBodyAccJerk-bandsEnergy()-41,48
- fBodyAccJerk-bandsEnergy()-49,56
- fBodyAccJerk-bandsEnergy()-57,64
- fBodyAccJerk-bandsEnergy()-1,16
- fBodyAccJerk-bandsEnergy()-17,32
- fBodyAccJerk-bandsEnergy()-33,48
- fBodyAccJerk-bandsEnergy()-49,64
- fBodyAccJerk-bandsEnergy()-1,24
- fBodyAccJerk-bandsEnergy()-25,48
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyGyro-mad()-X
- fBodyGyro-mad()-Y
- fBodyGyro-mad()-Z
- fBodyGyro-max()-X
- fBodyGyro-max()-Y
- fBodyGyro-max()-Z
- fBodyGyro-min()-X
- fBodyGyro-min()-Y
- fBodyGyro-min()-Z
- fBodyGyro-sma()
- fBodyGyro-energy()-X
- fBodyGyro-energy()-Y
- fBodyGyro-energy()-Z
- fBodyGyro-iqr()-X
- fBodyGyro-iqr()-Y
- fBodyGyro-iqr()-Z
- fBodyGyro-entropy()-X
- fBodyGyro-entropy()-Y
- fBodyGyro-entropy()-Z
- fBodyGyro-maxInds-X
- fBodyGyro-maxInds-Y
- fBodyGyro-maxInds-Z
- fBodyGyro-meanFreq()-X
- fBodyGyro-meanFreq()-Y
- fBodyGyro-meanFreq()-Z
- fBodyGyro-skewness()-X
- fBodyGyro-kurtosis()-X
- fBodyGyro-skewness()-Y
- fBodyGyro-kurtosis()-Y
- fBodyGyro-skewness()-Z
- fBodyGyro-kurtosis()-Z
- fBodyGyro-bandsEnergy()-1,8
- fBodyGyro-bandsEnergy()-9,16
- fBodyGyro-bandsEnergy()-17,24
- fBodyGyro-bandsEnergy()-25,32
- fBodyGyro-bandsEnergy()-33,40
- fBodyGyro-bandsEnergy()-41,48
- fBodyGyro-bandsEnergy()-49,56
- fBodyGyro-bandsEnergy()-57,64
- fBodyGyro-bandsEnergy()-1,16
- fBodyGyro-bandsEnergy()-17,32
- fBodyGyro-bandsEnergy()-33,48
- fBodyGyro-bandsEnergy()-49,64
- fBodyGyro-bandsEnergy()-1,24
- fBodyGyro-bandsEnergy()-25,48
- fBodyGyro-bandsEnergy()-1,8
- fBodyGyro-bandsEnergy()-9,16
- fBodyGyro-bandsEnergy()-17,24
- fBodyGyro-bandsEnergy()-25,32
- fBodyGyro-bandsEnergy()-33,40
- fBodyGyro-bandsEnergy()-41,48
- fBodyGyro-bandsEnergy()-49,56
- fBodyGyro-bandsEnergy()-57,64
- fBodyGyro-bandsEnergy()-1,16
- fBodyGyro-bandsEnergy()-17,32
- fBodyGyro-bandsEnergy()-33,48
- fBodyGyro-bandsEnergy()-49,64
- fBodyGyro-bandsEnergy()-1,24
- fBodyGyro-bandsEnergy()-25,48
- fBodyGyro-bandsEnergy()-1,8
- fBodyGyro-bandsEnergy()-9,16
- fBodyGyro-bandsEnergy()-17,24
- fBodyGyro-bandsEnergy()-25,32
- fBodyGyro-bandsEnergy()-33,40
- fBodyGyro-bandsEnergy()-41,48
- fBodyGyro-bandsEnergy()-49,56
- fBodyGyro-bandsEnergy()-57,64
- fBodyGyro-bandsEnergy()-1,16
- fBodyGyro-bandsEnergy()-17,32
- fBodyGyro-bandsEnergy()-33,48
- fBodyGyro-bandsEnergy()-49,64
- fBodyGyro-bandsEnergy()-1,24
- fBodyGyro-bandsEnergy()-25,48
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyAccMag-mad()
- fBodyAccMag-max()
- fBodyAccMag-min()
- fBodyAccMag-sma()
- fBodyAccMag-energy()
- fBodyAccMag-iqr()
- fBodyAccMag-entropy()
- fBodyAccMag-maxInds
- fBodyAccMag-meanFreq()
- fBodyAccMag-skewness()
- fBodyAccMag-kurtosis()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyAccJerkMag-mad()
- fBodyBodyAccJerkMag-max()
- fBodyBodyAccJerkMag-min()
- fBodyBodyAccJerkMag-sma()
- fBodyBodyAccJerkMag-energy()
- fBodyBodyAccJerkMag-iqr()
- fBodyBodyAccJerkMag-entropy()
- fBodyBodyAccJerkMag-maxInds
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyAccJerkMag-skewness()
- fBodyBodyAccJerkMag-kurtosis()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroMag-mad()
- fBodyBodyGyroMag-max()
- fBodyBodyGyroMag-min()
- fBodyBodyGyroMag-sma()
- fBodyBodyGyroMag-energy()
- fBodyBodyGyroMag-iqr()
- fBodyBodyGyroMag-entropy()
- fBodyBodyGyroMag-maxInds
- fBodyBodyGyroMag-meanFreq()
- fBodyBodyGyroMag-skewness()
- fBodyBodyGyroMag-kurtosis()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()
- fBodyBodyGyroJerkMag-mad()
- fBodyBodyGyroJerkMag-max()
- fBodyBodyGyroJerkMag-min()
- fBodyBodyGyroJerkMag-sma()
- fBodyBodyGyroJerkMag-energy()
- fBodyBodyGyroJerkMag-iqr()
- fBodyBodyGyroJerkMag-entropy()
- fBodyBodyGyroJerkMag-maxInds
- fBodyBodyGyroJerkMag-meanFreq()
- fBodyBodyGyroJerkMag-skewness()
- fBodyBodyGyroJerkMag-kurtosis()
- angle(tBodyAccMean,gravity)
- angle(tBodyAccJerkMean),gravityMean)
- angle(tBodyGyroMean,gravityMean)
- angle(tBodyGyroJerkMean,gravityMean)
- angle(X,gravityMean)
- angle(Y,gravityMean)
- angle(Z,gravityMean)

### 2.3: Class labels with their activity names (activity_labels.txt)
- 1 WALKING
- 2 WALKING_UPSTAIRS
- 3 WALKING_DOWNSTAIRS
- 4 SITTING
- 5 STANDING
- 6 LAYING


## 3: Tranformations Performed on the input data set to produce the tidy data set
The R Script run_analysis.R processes the input data to produce the tidy data set. The details of the transformations done are provided in the README.md file.


## 4: Output Tidy Data set
The output tidy dataset consists of the following:

### 4.1: Identifiers
- ActivityName: Descriptive activity name performed when the corresponding measurements were taken.
- SubjectId: ID of the subject (Person) for whom the measurements were taken, ranging from 1 to 30.

### 4.2: Measurements
The measurements consist of the average of each of the following variable for each activity and each subject:

- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyAccMag-mean()
- tGravityAccMag-mean()
- tBodyAccJerkMag-mean()
- tBodyGyroMag-mean()
- tBodyGyroJerkMag-mean()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-meanFreq()-X
- fBodyAcc-meanFreq()-Y
- fBodyAcc-meanFreq()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-meanFreq()-X
- fBodyAccJerk-meanFreq()-Y
- fBodyAccJerk-meanFreq()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-meanFreq()-X
- fBodyGyro-meanFreq()-Y
- fBodyGyro-meanFreq()-Z
- fBodyAccMag-mean()
- fBodyAccMag-meanFreq()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-meanFreq()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-meanFreq()
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-std()
- tGravityAccMag-std()
- tBodyAccJerkMag-std()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-std()
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-std()






