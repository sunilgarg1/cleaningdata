# load the data.table library. Will need this to use the fread command for reading the files
library(data.table)
# load the deplyr library. Useful for manipulating data frames and data tables. 
library(dplyr)

# Download the Zip file with data to the R working directory
fitnessDataFileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fitnessDataFileURL,"fitnessDataFile.zip", mode = "wb")

# unzip the file in the working directory. This will extract the files with the folder structure present in the zip file
unzip("fitnessDataFile.zip")

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

# Take the training dataset in the files UCI HAR Dataset\train\*.txt and merge the columns together to get the full training dataset.
# Use the variable names vector extracted above to set the column names of the data table
trainingFileList <- c("UCI HAR Dataset/train/y_train.txt", "UCI HAR Dataset/train/subject_train.txt", "UCI HAR Dataset/train/X_train.txt")
training_Df <- do.call(cbind, lapply(trainingFileList, fread))
colnames(training_Df) <- variableColumnNames

# Take the test dataset in the files UCI HAR Dataset\test\*.txt and merge the columns together to get the full test dataset.
# Use the variable names vector extracted above to set the column names of the data table
testFileList <- c("UCI HAR Dataset/test/y_test.txt", "UCI HAR Dataset/test/subject_test.txt", "UCI HAR Dataset/test/X_test.txt")
test_Df <- do.call(cbind, lapply(testFileList, fread))
colnames(test_Df) <- variableColumnNames

# Combine the training and test datasets to creat a merged data set
merged_Df <- rbind(training_Df, test_Df)

# select the ActivityId & SubjectId columns along with those columns which represent means or standard deviations 
# Make a new data table with just the selected columns.
columns_mean_std <- c(grep("ActivityId",variableColumnNames), grep("SubjectId",variableColumnNames),grep("mean()",variableColumnNames), grep("std()",variableColumnNames)) 
mean_std_Df <- merged_Df[, columns_mean_std,with=FALSE]

# Replace the ActivityId in the dataset with the descriptive Activity Names using the activityLabels_Df Data table defined earlier
mean_std_withActivityLabels_DF <- merge(activityLabels_Df,mean_std_Df, by = "ActivityId", all.y = TRUE)
#Drop the ActivityId column from the dataset as it has the descriptive activity names now
mean_std_withActivityLabels_DF <- select(mean_std_withActivityLabels_DF, -ActivityId)

# The variables SubjectId and ActivityName have proper descriptive names already. Also, the names
# of the other variables are already defined in a proper format indicating the time or frquency domain (t or f)
# , the source of measurement - accelerometer or gyroscope (Acc or Gyro)), the measurement - e.g. Body Acceleration
# , gravity Acceleration (BodyAcc, GravityAcc etc) and the type of measurement (mean, std etc). SO I am not redefining
# the names any further.

# Make the tidy data set with the mean of each variable for each activity and each subject
tidyDataSet <- aggregate(. ~ActivityName + SubjectId, mean_std_withActivityLabels_DF, mean)

# Write the tidy data set to a file using write.table. Using the default separator so the columns will be separated 
# by a white space which allows the file to be inspected in excel
write.table(tidyDataSet,"SG_TidyDataSet.txt", row.name=FALSE)








