###Sam Colon
## Repository for programming assignment in Coursera/JHU course "Getting and Cleaning Data"

##Running Script (run_analysis.R)

Prior to running the script, the raw data from the following link must be unzipped in your working directory :
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

##Description of Script Steps(going from raw to tidy data)

After reading in the "test" and "training" set files (with "read.table"), the script performs the following functions:

1. Merges the training and the test sets to create one data set.
	-this is done using the "rbind command"
2. Extracts only the measurements on the mean and standard deviation for each measurement.
	-using the "grep" function, I extract only variable names containing "mean" and "std"
3. Uses descriptive activity names to name the activities in the data set
	-I use the "sub" function to rename each activity according to its corresponding number
	For example, all 6's in the activity column are renamed to "LAYING"
4. Appropriately labels the data set with descriptive activity names
	-I first put all of the names within "features.txt" file into one object; I then  use the "colnames" function to rename all of the variables.   
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
	-Using functions from the "dplyr" package, I first perform a "group_by" on the "subject" and "activity" variables.  Next, I apply a "summarise_each" passing in the mean function on the resulting data set.  


For descriptions of the variables and the method of data collection, please consult the "Codebook"
