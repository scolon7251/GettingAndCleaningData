#Programming assignment for Getting and Cleaning Data
library(dplyr)

##Read in test and training sets
test <- read.table("./UCI HAR Dataset/test//X_test.txt", header=FALSE)
train <-read.table("./UCI HAR Dataset/train//X_train.txt", header=FALSE)

##merge test and trainings sets using rbind
full_data <- rbind(test, train)

##Put vector of all 561 features into one object, then change column names
labels <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
colnames(full_data) <- labels[,2]

##find column locations of mean and std values for dataset; 
##subset data set to only include those column locations
onlymean <- grep("mean", names(full_data))
onlystd <- grep("std", names(full_data))
mean_cols <- full_data[,onlymean]
std_cols <- full_data[, onlystd]

##combine mean and std columns--now have data frame with 10,299 obs and 79 vars.
full_data <- cbind(mean_cols, std_cols)

##combine y_test and y_train to get complete row of activity labels
y_train <- (read.table("./UCI HAR Dataset/train//y_train.txt", header=FALSE))
y_test <- (read.table("./UCI HAR Dataset/test//y_test.txt", header=FALSE))
y_full <- rbind(y_test, y_train)

##Change names for each activity with "sub" function by matching to 
##the corresponding number

y_full <- sub("6", "LAYING", y_full[,1])
y_full <- sub("4", "SITTING", y_full)
y_full <- sub("5", "STANDING", y_full)
y_full <- sub("3", "WALKING_DOWNSTAIRS", y_full)
y_full <- sub("2", "WALKING_UPSTAIRS", y_full)
y_full <- sub("1", "WALKING", y_full)

##Add column with correct activity names to data frame
full_data <- cbind(y_full,full_data)

#change column name to activity
colnames(full_data)[1] <- "activity"

##Make a single object for the subjects, and bind to data frame, name first column
test_subjects <- (read.table("./UCI HAR Dataset/test//subject_test.txt", header=FALSE))
training_subjects <- (read.table("./UCI HAR Dataset/train//subject_train.txt", header=FALSE))
subjects <- rbind(test_subjects, training_subjects)
full_data <- cbind(subjects, full_data)

##name first column appropriately
colnames(full_data)[1] <- "subject"

##Use group_by to group data frame by subject and activity
full_data <- group_by(full_data, subject, activity)

##Use summarize_each to calculate mean of each variable for each
##subject and activity

full_data <- summarise_each(full_data, funs(mean))

##Tidy data set completed