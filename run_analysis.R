## STEP 1: Load packages 

# load required packages 
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

## STEP 2: Merge the training and the test datasets

# read data into train and test data frames
subject_train <- read.table("./train/subject_train.txt")
subject_test <- read.table("./test/subject_test.txt")
X_train <- read.table("./train/X_train.txt")
X_test <- read.table("./test/X_test.txt")
y_train <- read.table("./train/y_train.txt")
y_test <- read.table("./test/y_test.txt")

# add column name for subjects
names(subject_train) <- "SubjectID"
names(subject_test) <- "SubjectID"

# add column names for measurements
features <- read.table("features.txt")
names(X_train) <- features$V2
names(X_test) <- features$V2

# add column name for labels
names(y_train) <- "Activity"
names(y_test) <- "Activity"

# combine files into one dataset
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
combine <- rbind(train, test)


## STEP 3: Extract measurements of the mean and standard deviation for each measurement

## determine which columns contain the mean() or std()
meanstd <- grepl("mean\\(\\)", names(combine)) | grepl("std\\(\\)", names(combine))

# make sure SubjectID and Activity columns are retained
meanstd[1:2] <- TRUE

# remove columns not needed
combine <- combine[, meanstd]

## STEP 4: Label the data set with descriptive activity names 

# convert the Activity column 
combine$Activity <- factor(combine$Activity, labels=c("Walking",
    "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))


## STEP 5: Create an independent tidy data set with the average of each variable for each activity and each subject

# create tidy data set
merge <- melt(combine, id=c("SubjectID","Activity"))
tidy <- dcast(merge, SubjectID+Activity ~ variable, mean)

# write tidy data set to a file
write.table(tidy, "dataoutput.txt", row.names=FALSE)
