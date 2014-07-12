Getting and Cleaning Data Course Project
========================================

## Introduction ##

This is my submission for the Course Project for the Coursera course "Getting and Cleaning Data".

This project gathers, cleans, and presents data from the project "Human Activity Recognition Using Smartphone Dataset", performed at the Smartlab - Non Linear Complex Systems laboratory at the Universita degli Studi di Genova.

From the study's README file describing the project:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Raw Data ##

As of this commit, the raw data can be downloaded from a zip file, here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For the purposes of this project, the important files are (from the data source's README):

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Script ##

The R script to replicate this project is run_activity.R. This script assumes you have already downloaded the source data and unzipped it. The data lives in /UCI HAR Dataset. No other assumptions or steps need to be made other than the loading of common libraries into R.

## Tidy Data Set ##

After merging the training and testing measurements, labels are added and only columns that have to do with mean and standard deviation are kept. 

I have left in (but commented out) instructions for clarifying the names of measurements (features) that do not measure mean or standard deviation. Someone interested in additional analysis would find this of use.

The "angle" measurements are not kept, even when one of the vectors composing the angle is the mean of a quantity. The angles themselves are not average measurements, and so this data is removed from the set.

Finally, the script creates a tidy data set containing the means of all the columns for each combination of actor (subject) and activity. This tidy dataset is written to a tab-delimited file called tidy.txt, which is also in this repository.

## Code Book ##

Can be found at https://github.com/scottmjohns/coursera_getting_and_cleaning_data/code_book.md.
