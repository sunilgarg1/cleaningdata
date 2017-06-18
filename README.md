---
title: "Coursera Data Science Specialization Peer-graded Assignment: Getting and Cleaning Data Course Project - README"
author: "Sunil Garg"
date: "June 17, 2017"
output: html_document
---
[Link to project on GitHUB](https://github.com/sunilgarg1/cleaningdata)

# README for Getting and Cleaning Data Course Assignment

## Summary 
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The submission includes: 1) a tidy data set as described below, 2) a link to a Github repository with the R script called run_analysis.R for performing the analysis, and 3) a code book that describes the variables, the data, any transformations or work performed to clean up the data called CodeBook.md and 4) this README.md file which explains how all of the scripts work and how they are connected.
### Assignment Details
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Students should create an R script called run_analysis.R that does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.




## Detailed Steps performed by the R Script run_analysis.R

### 1: Load the required libraries
```{r, cache=TRUE, collapse = TRUE, warning=FALSE, message = FALSE, echo=TRUE, results='markup'}
# load the data.table library. Will need this to use the fread command for reading the files
library(data.table)
# load the deplyr library. Useful for manipulating data frames and data tables. 
library(dplyr)
```

### 2: Download the zip file and unzip it
```{r, cache=TRUE, collapse = TRUE, warning=FALSE, message = FALSE, echo=TRUE, results='markup'}
# Download the Zip file with data to the R working directory
fitnessDataFileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fitnessDataFileURL,"fitnessDataFile.zip", mode = "wb")

# unzip the file in the working directory. This will extract the files with the folder structure present in the zip file
unzip("fitnessDataFile.zip")
```

### 3: Read the Features and the Activity files and make a vector with the column names for the training and test data sets
```{r, cache=TRUE, collapse = TRUE, warning=FALSE, message = FALSE, echo=TRUE, results='markup'}
# Everything is extraced under a base directory called "UCI HAR Dataset". The README.txt along with other *.txt
# files in the base directory provide all information about the dataset.
# Read the features text file to get all the feature ids and names.
variableColumnNames_Df <- fread("UCI HAR Dataset/features.txt")
colnames(variableColumnNames_Df) <- c("VariableId", "VariableName")

# Read the activity lables text file to get all the activity ids and labels.
activityLabels_Df <- fread("UCI HAR Dataset/activity_labels.txt")
colnames(activityLabels_Df) <- c("ActivityId", "ActivityName")

#Make a vector of variable names
variableColumnNames <-  c("ActivityId", "SubjectId", variableColumnNames_Df$VariableName)
```

### 4: Prepare the Training Dataset
```{r, cache=TRUE, collapse = TRUE, warning=FALSE, message = FALSE, echo=TRUE, results='markup'}
# Take the training dataset in the files UCI HAR Dataset\train\*.txt and merge the columns together to get the full training dataset.
# Use the variable names vector extracted above to set the column names of the data table
trainingFileList <- c("UCI HAR Dataset/train/y_train.txt", "UCI HAR Dataset/train/subject_train.txt", "UCI HAR Dataset/train/X_train.txt")
training_Df <- do.call(cbind, lapply(trainingFileList, fread))
colnames(training_Df) <- variableColumnNames
```

### 5: Prepare the Test Dataset
```{r, cache=TRUE, collapse = TRUE, warning=FALSE, message = FALSE, echo=TRUE, results='markup'}
# Take the test dataset in the files UCI HAR Dataset\test\*.txt and merge the columns together to get the full test dataset.
# Use the variable names vector extracted above to set the column names of the data table
testFileList <- c("UCI HAR Dataset/test/y_test.txt", "UCI HAR Dataset/test/subject_test.txt", "UCI HAR Dataset/test/X_test.txt")
test_Df <- do.call(cbind, lapply(testFileList, fread))
colnames(test_Df) <- variableColumnNames
```

### 6: Merge the training and test datasets
```{r, cache=TRUE, collapse = TRUE, warning=FALSE, message = FALSE, echo=TRUE, results='markup'}
# Combine the training and test datasets to creat a merged data set
merged_Df <- rbind(training_Df, test_Df)
```

### 7: Select the key columns + mean and standard deviation columns only
```{r, cache=TRUE, collapse = TRUE, warning=FALSE, message = FALSE, echo=TRUE, results='markup'}
# select the ActivityId & SubjectId columns along with those columns which represent means or standard deviations 
# Make a new data table with just the selected columns.
columns_mean_std <- c(grep("ActivityId",variableColumnNames), grep("SubjectId",variableColumnNames),grep("mean()",variableColumnNames), grep("std()",variableColumnNames)) 
mean_std_Df <- merged_Df[, columns_mean_std,with=FALSE]
```

### 8: Replace Activity Id with descriptive Activity Names
```{r, cache=TRUE, collapse = TRUE, warning=FALSE, message = FALSE, echo=TRUE, results='markup'}
# Replace the ActivityId in the dataset with the descriptive Activity Names using the activityLabels_Df Data table defined earlier
mean_std_withActivityLabels_DF <- merge(activityLabels_Df,mean_std_Df, by = "ActivityId", all.y = TRUE)
#Drop the ActivityId column from the dataset as it has the descriptive activity names now
mean_std_withActivityLabels_DF <- select(mean_std_withActivityLabels_DF, -ActivityId)
```

### 9: Note on the names of the Columns
```{r, cache=TRUE, collapse = TRUE, warning=FALSE, message = FALSE, echo=TRUE, results='markup'}
# The variables SubjectId and ActivityName have proper descriptive names already. Also, the names
# of the other variables are already defined in a proper format indicating the time or frquency domain (t or f)
# , the source of measurement - accelerometer or gyroscope (Acc or Gyro)), the measurement - e.g. Body Acceleration
# , gravity Acceleration (BodyAcc, GravityAcc etc) and the type of measurement (mean, std etc). SO I am not redefining
# the names any further.
```

### 10: Make a new tidy dataset with the average of each variable for each activity and each subject and write it to an output text file
```{r, cache=TRUE, collapse = TRUE, warning=FALSE, message = FALSE, echo=TRUE, results='markup'}
# Make the tidy data set with the mean of each variable for each activity and each subject
tidyDataSet <- aggregate(. ~ActivityName + SubjectId, mean_std_withActivityLabels_DF, mean)

# Write the tidy data set to a file using write.table. Using the default separator so the columns will be separated 
# by a white space which allows the file to be inspected in excel
write.table(tidyDataSet,"SG_TidyDataSet.txt", row.name=FALSE)
```








