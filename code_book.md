Code Book
=========

## Variables and Summary Choices ##

This project gathers, cleans, and presents data from the project "Human Activity Recognition Using Smartphone Dataset", performed at the Smartlab - Non Linear Complex Systems laboratory at the Universita degli Studi di Genova.

As of this commit, the raw data can be downloaded from a zip file, here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

From the file 'features_info.txt' in the source data:

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

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


For this project, we keep the mean and standard deviation features/measurements. The are renamed, for clarity:

- "Time Body Acceleration Mean in X Direction"                                                      
- "Time Body Acceleration Mean in Y Direction"                                                      
- "Time Body Acceleration Mean in Z Direction"                                                      
- "Time Body Acceleration Standard Deviation in X Direction"                                        
- "Time Body Acceleration Standard Deviation in Y Direction"                                        
- "Time Body Acceleration Standard Deviation in Z Direction"                                        
- "Time Gravity Acceleration Mean in X Direction"                                                   
- "Time Gravity Acceleration Mean in Y Direction"                                                   
- "Time Gravity Acceleration Mean in Z Direction"                                                   
- "Time Gravity Acceleration Standard Deviation in X Direction"                                     
- "Time Gravity Acceleration Standard Deviation in Y Direction"                                     
- "Time Gravity Acceleration Standard Deviation in Z Direction"                                     
- "Time Body Acceleration Jerk Mean in X Direction"                                                 
- "Time Body Acceleration Jerk Mean in Y Direction"                                                 
- "Time Body Acceleration Jerk Mean in Z Direction"                                                 
- "Time Body Acceleration Jerk Standard Deviation in X Direction"                                   
- "Time Body Acceleration Jerk Standard Deviation in Y Direction"                                   
- "Time Body Acceleration Jerk Standard Deviation in Z Direction"                                   
- "Time Body Gyro Mean in X Direction"                                                              
- "Time Body Gyro Mean in Y Direction"                                                              
- "Time Body Gyro Mean in Z Direction"                                                              
- "Time Body Gyro Standard Deviation in X Direction"                                                
- "Time Body Gyro Standard Deviation in Y Direction"                                                
- "Time Body Gyro Standard Deviation in Z Direction"                                                
- "Time Body Gyro Jerk Mean in X Direction"                                                         
- "Time Body Gyro Jerk Mean in Y Direction"                                                         
- "Time Body Gyro Jerk Mean in Z Direction"                                                         
- "Time Body Gyro Jerk Standard Deviation in X Direction"                                           
- "Time Body Gyro Jerk Standard Deviation in Y Direction"                                           
- "Time Body Gyro Jerk Standard Deviation in Z Direction"                                           
- "Time Body Acceleration Magnitude Mean"                                                           
- "Time Body Acceleration Magnitude Standard Deviation"                                             
- "Time Gravity Acceleration Magnitude Mean"                                                        
- "Time Gravity Acceleration Magnitude Standard Deviation"                                          
- "Time Body Acceleration Jerk Magnitude Mean"                                                      
- "Time Body Acceleration Jerk Magnitude Standard Deviation"                                        
- "Time Body Gyro Magnitude Mean"                                                                   
- "Time Body Gyro Magnitude Standard Deviation"                                                     
- "Time Body Gyro Jerk Magnitude Mean"                                                              
- "Time Body Gyro Jerk Magnitude Standard Deviation"                                                
- "Frequency Body Acceleration Mean in X Direction"                                                 
- "Frequency Body Acceleration Mean in Y Direction"                                                 
- "Frequency Body Acceleration Mean in Z Direction"                                                 
- "Frequency Body Acceleration Standard Deviation in X Direction"                                   
- "Frequency Body Acceleration Standard Deviation in Y Direction"                                   
- "Frequency Body Acceleration Standard Deviation in Z Direction"                                   
- "Frequency Body Acceleration Jerk Mean in X Direction"                                            
- "Frequency Body Acceleration Jerk Mean in Y Direction"                                            
- "Frequency Body Acceleration Jerk Mean in Z Direction"                                            
- "Frequency Body Acceleration Jerk Standard Deviation in X Direction"                              
- "Frequency Body Acceleration Jerk Standard Deviation in Y Direction"                              
- "Frequency Body Acceleration Jerk Standard Deviation in Z Direction"                              
- "Frequency Body Gyro Mean in X Direction"                                                         
- "Frequency Body Gyro Mean in Y Direction"                                                         
- "Frequency Body Gyro Mean in Z Direction"                                                         
- "Frequency Body Gyro Standard Deviation in X Direction"                                           
- "Frequency Body Gyro Standard Deviation in Y Direction"                                           
- "Frequency Body Gyro Standard Deviation in Z Direction"                                           
- "Frequency Body Acceleration Magnitude Mean"                                                      
- "Frequency Body Acceleration Magnitude Standard Deviation"                                        
- "Frequency Body Body Acceleration Jerk Magnitude Mean"                                            
- "Frequency Body Body Acceleration Jerk Magnitude Standard Deviation"                              
- "Frequency Body Body Gyro Magnitude Mean"                                                         
- "Frequency Body Body Gyro Magnitude Standard Deviation"                                           
- "Frequency Body Body Gyro Jerk Magnitude Mean"                                                    
- "Frequency Body Body Gyro Jerk Magnitude Standard Deviation"                                      

All features/measurements are normalized, and take values in the range [-1,1].

## Study Design ##

In this case, the data was collected by others. I downloaded it in a zip file, imported it into R, and processed it as per run_activity.R.
