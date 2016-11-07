# Getting-and-Cleaning-Data-Project
The script run_analysis.R performs the following steps:
 1.   Merges the training and the test sets to create one data set.
 2.   Extracts only the measurements on the mean and standard deviation for each measurement.
 3.   Uses descriptive activity names to name the activities in the data set
 4.   Appropriately labels the data set with descriptive variable names.
 5.   From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
 ## How to get the data
 Data is available from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
 Unzip the dataset to create a directory: UCI-HAR-Dataset.
 Set this directory as your R working directory.
 
 ## How to run the analysis
 Put the script run_analysis.R into the UCI-HAR-Dataset directory.
 Go to the UCI-HAR-Dataset directory, start R and source the script - i.e. run the `source("run_analysis.R")` command.
 A file called tidy.txt will be created in your working directory.
 
 ## R dependencies
 The script run_analysis.R loads the required R modules automatically.

