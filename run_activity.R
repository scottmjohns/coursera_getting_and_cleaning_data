# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# This script assumes you have already downloaded the source data 
# ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
# and unzipped it. The data lives in /UCI HAR Dataset.

# You will need to modify this line to reflect the data folder's location on your machine.
setwd("C:/Users/Scott/Desktop/R_Programming/UCI HAR Dataset")

# Read in all of the needed raw data.
x_train <- read.table('./train/X_train.txt')            # Training data set, 7352 x 561
y_train <- read.table('./train/Y_train.txt')            # Training activity labels, 7352 x 1
x_test <- read.table('./test/X_test.txt')               # Test data set, 7352 x 561
y_test <- read.table('./test/Y_test.txt')               # Test activity labels, 7352 x 1
activity_labels <- read.table('./activity_labels.txt')  # The activity labels (1-6) and names
features <- read.table('./features.txt')                # The names of the features
actors_train <- read.table('./train/subject_train.txt') # Which actor (1-30) performed which training measurements, 7352 x 1
actors_test <- read.table('./test/subject_test.txt')    # Which actor (1-30) performed which test measurements, 7352 x 1

# all_measurements is a data_frame where all data will be stored.
# Combine the raw training and test data, 10299 x 561
all_measurements <- rbind(x_train, x_test)
# Combine the activity labels (1-6) from training and test, 10299 x 1
activities <- rbind(y_train, y_test)
# Combine the actor (1-30)lists from training and test, 10299 x 1
actors <- rbind(actors_train, actors_test)
# Add the activity names to the data frame with the activity numbers
activities$activity_name = activity_labels$V2[activities$V1]  
# Add activity names as a column to all_measurements
all_measurements <- cbind(all_measurements, activities$activity_name) 
# Add the actors as a column to all_measurements
all_measurements <- cbind(all_measurements, actors)
# Rearranage all_measurements so that Activity is in the first column, and Actor is in the second column
all_measurements <- cbind(all_measurements[562], all_measurements[563], all_measurements[1:561]) 

#The vector feature_names is where we'll develop readable names for the measurements.
feature_names <- features[,2]
# A series of substitutions using gsub and regular expressions
feature_names <- gsub("tBodyAccJerkMean)", "tBodyAccJerkMean", feature_names) # remove an extra parenthesis from data 
feature_names <- gsub("^t", "Time ", feature_names)
feature_names <- gsub("^f", "Frequency ", feature_names)
feature_names <- gsub("BodyAcc", "Body Acceleration ", feature_names)
feature_names <- gsub("GravityAcc", "Gravity Acceleration ", feature_names)
feature_names <- gsub("Gyro", " Gyro ", feature_names)
feature_names <- gsub("Jerk", "Jerk ", feature_names)
feature_names <- gsub("Mag", "Magnitude ", feature_names)
feature_names <- gsub("-mean\\(\\)-([XYZ])", "Mean in \\1 Direction", feature_names)
feature_names <- gsub("-std\\(\\)-([XYZ])", "Standard Deviation in \\1 Direction", feature_names)
feature_names <- gsub("-mean\\(\\)-([XYZ])", "Mean in \\1 Direction", feature_names)
feature_names <- gsub("-mean\\(\\)", "Mean", feature_names)
feature_names <- gsub("-std\\(\\)", "Standard Deviation", feature_names)
feature_names <- gsub("-meanFreq\\(\\)-([XYZ])", "Weighted Average of the Frequency Components in the \\1 Direction", feature_names)
feature_names <- gsub("-meanFreq\\(\\)", "Weighted Average of the Frequency Components", feature_names)
feature_names <- gsub("BodyBody", "Body Body", feature_names)

# If we were interested in analyzing additional data, we could clean up the feature names like so:
#feature_names <- gsub("-mad\\(\\)-([XYZ])", "Median Absolute Deviation in \\1 Direction", feature_names)
#feature_names <- gsub("-max\\(\\)-([XYZ])", "Largest Value in \\1 Direction", feature_names)
#feature_names <- gsub("-min\\(\\)-([XYZ])", "Smallest Value in \\1 Direction", feature_names)
#feature_names <- gsub("-energy\\(\\)-([XYZ])", "Energy in \\1 Direction", feature_names)
#feature_names <- gsub("-iqr\\(\\)-([XYZ])", "Interquartile Range in \\1 Direction", feature_names)
#feature_names <- gsub("-entropy\\(\\)-([XYZ])", "Signal Entropy in \\1 Direction", feature_names)
#feature_names <- gsub("-sma\\(\\)", "Signal Magnitude Area", feature_names)
#feature_names <- gsub("-arCoeff\\(\\)-([XYZ]),([1-4])", "Autoregression Coefficients in \\1, \\2 Direction", feature_names)
#feature_names <- gsub("-arCoeff\\(\\)([1-4])", "Autoregression Coefficients - \\1", feature_names)
#feature_names <- gsub("-correlation\\(\\)-([XYZ]),([X-Z])", "Correlation between \\1, \\2 Directions", feature_names)
#feature_names <- gsub("-mad\\(\\)", "Median Absolute Deviation", feature_names)
#feature_names <- gsub("-max\\(\\)", "Largest Value", feature_names)
#feature_names <- gsub("-min\\(\\)", "Smallest Value", feature_names)
#feature_names <- gsub("-energy\\(\\)", "Energy", feature_names)
#feature_names <- gsub("-iqr\\(\\)", "Interquartile Range", feature_names)
#feature_names <- gsub("-entropy\\(\\)", "Entropy", feature_names)
#feature_names <- gsub("-skewness\\(\\)-([XYZ])", "Skewness of Frequency Domain Signal in the \\1 Direction", feature_names)
#feature_names <- gsub("-skewness\\(\\)", "Skewness of Frequency Domain Signal", feature_names)
#feature_names <- gsub("-kurtosis\\(\\)-([XYZ])", "Kurtosis of Frequency Domain Signal in the \\1 Direction", feature_names)
#feature_names <- gsub("-kurtosis\\(\\)", "Kurtosis of Frequency Domain Signal", feature_names)
#feature_names <- gsub("-maxInds-([XYZ])", "Index of the Frequency Component with the Largest Magnitude in the \\1 Direction", feature_names)
#feature_names <- gsub("-maxInds", "Index of the Frequency Component with the Largest Magnitude", feature_names)
#feature_names <- gsub("-bandsEnergy\\(\\)-([0-9]+),([0-9]+)", "Energy of the Frequency Interval (\\1,\\2)", feature_names)
#feature_names <- gsub("gravityMean", "Mean Gravity", feature_names)
#feature_names <- gsub("\\(tBody", "\\(Time Body", feature_names)
#feature_names <- gsub("angle\\(([A-Za-z ]+),([A-Za-z ]+)\\)", "Angle Between the \\1 and the \\2 Vectors", feature_names)
# NOTE: We don't include the 'angle' measurements, even though they contain angles between vectors of mean quantities,
#       because these measurements are means themselves.

# Rearrange the feature_names vector to put ACtivity Name and Actor in first two columns.
feature_names <- c("Activity Name", "Actor", feature_names[1:561])

# Assign the feature names to the all_measurements data frame.
names(all_measurements) = feature_names

# Order all_measurements so that its sorted by activity, then actor.
all_measurements <- all_measurements[order(all_measurements[,1],all_measurements[,2]),]

# mean_and_sdd_columns is a logical vector containing all the mean and standard deviation
# features, using union and grep. It also holds onto the Activity and Actor columns.
mean_and_sd_columns <- union(grep("Activity", names(all_measurements)), grep("Actor", names(all_measurements)))
mean_and_sd_columns <- union(mean_and_sd_columns, grep("Mean", names(all_measurements)))
mean_and_sd_columns <- union(mean_and_sd_columns, grep("Standard Deviation", names(all_measurements)))
mean_and_sd_columns <- setdiff(mean_and_sd_columns, grep("angle", names(all_measurements)))

# mean_and_sd_data is the subset of all measurements containing only means and standard deviations.
mean_and_sd_data <- all_measurements[mean_and_sd_columns]

# tidy is a 'tidy' data frame that calculates the mean of all the data points in mean_and_sd_data
# for each activity and actor combination.
tidy <- aggregate(mean_and_sd_data, by=list(Actor=mean_and_sd_data$"Actor", Activity=mean_and_sd_data$"Activity Name"), mean)
# Perform cleanup of tidy.
tidy[3] = NULL; tidy[3] = NULL

# Write the tidy table to an output text file.
write.table(tidy, './tidy.txt', sep='\t')