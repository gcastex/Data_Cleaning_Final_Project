Dataset for the Data Cleaning John Hopkins course on Coursera
=============================================================
Human Activity Recognition Using Smartphones Datasets for John Hopkins Coursera specialization

Independant work based on the initial Human Activity Recognition Using Smartphones Dataset version 1.0 by:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

## Introduction

The data in this repository has been processed based on the Human Activity Recognition Using Smartphones Dataset presented here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The inital dataset has been was partitioned into two sets: training data and test data.
We have merged the two sets of data into a single set. 

Two datasets files have been produced from this data:     
tidy_dataset.csv    
tidy_mean_dataset.csv

## Initial data from Human Activity Recognition Using Smartphones Dataset
In the initial data, the sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The initial data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables for each pattern.


## Presentation of the file tidy_dataset.csv

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The Inital data presented the following variables, for each of wich we have kept the mean and standard deviation observations: 

tBodyAcc_XYZ  
tGravityAcc_XYZ  
tBodyAccJerk_XYZ  
tBodyGyro_XYZ  
tBodyGyroJerk_XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc_XYZ  
fBodyAccJerk_XYZ  
fBodyGyro_XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

Abbreviations:  
mean: Mean value  
std: Standard deviation

To this list of variables, we have added "activity" and "subject" which were stored independantly in the initial dataset.

## Complete list of variables in tidy_dataset.csv

The file contains 10299 observations and 68 variables:    
"subject":  id of the subject. number between 1 and 30    
"activity": activity of the subject among the 6 following possibilities: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS     
"tBodyAcc_mean_X"    
"tBodyAcc_mean_Y"    
"tBodyAcc_mean_Z"    
"tBodyAcc_std_X"    
"tBodyAcc_std_Y"            
"tBodyAcc_std_Z"           
"tGravityAcc_mean_X"        
"tGravityAcc_mean_Y"        
"tGravityAcc_mean_Z"        
"tGravityAcc_std_X"        
"tGravityAcc_std_Y"         
"tGravityAcc_std_Z"         
"tBodyAccJerk_mean_X"       
"tBodyAccJerk_mean_Y"      
"tBodyAccJerk_mean_Z"       
"tBodyAccJerk_std_X"        
"tBodyAccJerk_std_Y"        
"tBodyAccJerk_std_Z"       
"tBodyGyro_mean_X"         
"tBodyGyro_mean_Y"          
"tBodyGyro_mean_Z"          
"tBodyGyro_std_X"          
"tBodyGyro_std_Y"           
"tBodyGyro_std_Z"           
"tBodyGyroJerk_mean_X"      
"tBodyGyroJerk_mean_Y"     
"tBodyGyroJerk_mean_Z"      
"tBodyGyroJerk_std_X"       
"tBodyGyroJerk_std_Y"       
"tBodyGyroJerk_std_Z"      
"tBodyAccMag_mean"          
"tBodyAccMag_std"           
"tGravityAccMag_mean"       
"tGravityAccMag_std"       
"tBodyAccJerkMag_mean"      
"tBodyAccJerkMag_std"       
"tBodyGyroMag_mean"         
"tBodyGyroMag_std"         
"tBodyGyroJerkMag_mean"     
"tBodyGyroJerkMag_std"      
"fBodyAcc_mean_X"           
"fBodyAcc_mean_Y"          
"fBodyAcc_mean_Z"           
"fBodyAcc_std_X"            
"fBodyAcc_std_Y"            
"fBodyAcc_std_Z"           
"fBodyAccJerk_mean_X"       
"fBodyAccJerk_mean_Y"       
"fBodyAccJerk_mean_Z"       
"fBodyAccJerk_std_X"       
"fBodyAccJerk_std_Y"        
"fBodyAccJerk_std_Z"        
"fBodyGyro_mean_X"          
"fBodyGyro_mean_Y"         
"fBodyGyro_mean_Z"          
"fBodyGyro_std_X"           
"fBodyGyro_std_Y"           
"fBodyGyro_std_Z"          
"fBodyAccMag_mean"          
"fBodyAccMag_std"           
"fBodyBodyAccJerkMag_mean"  
"fBodyBodyAccJerkMag_std"  
"fBodyBodyGyroMag_mean"     
"fBodyBodyGyroMag_std"      
"fBodyBodyGyroJerkMag_mean"     
"fBodyBodyGyroJerkMag_std"

## Presentation of the files tidy_mean_dataset.csv and tidy_mean_dataset.txt

From the data in tidy_data.csv, a second data set with the average of each variable for each activity and each subject has been created and stored in tidy_mean_dataset.csv.
The file contains 35 observations and 68 variables:  
"subject":  id of the subject. number between 1 and 30    
"activity": activity of the subject among the 6 following possibilities: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS                    
"mean_tBodyAcc_mean_X"           
"mean_tBodyAcc_mean_Y"          
"mean_tBodyAcc_mean_Z"           
"mean_tBodyAcc_std_X"            
"mean_tBodyAcc_std_Y"            
"mean_tBodyAcc_std_Z"           
"mean_tGravityAcc_mean_X"        
"mean_tGravityAcc_mean_Y"        
"mean_tGravityAcc_mean_Z"        
"mean_tGravityAcc_std_X"        
"mean_tGravityAcc_std_Y"         
"mean_tGravityAcc_std_Z"         
"mean_tBodyAccJerk_mean_X"       
"mean_tBodyAccJerk_mean_Y"      
"mean_tBodyAccJerk_mean_Z"       
"mean_tBodyAccJerk_std_X"        
"mean_tBodyAccJerk_std_Y"        
"mean_tBodyAccJerk_std_Z"       
"mean_tBodyGyro_mean_X"          
"mean_tBodyGyro_mean_Y"          
"mean_tBodyGyro_mean_Z"          
"mean_tBodyGyro_std_X"          
"mean_tBodyGyro_std_Y"           
"mean_tBodyGyro_std_Z"           
"mean_tBodyGyroJerk_mean_X"      
"mean_tBodyGyroJerk_mean_Y"     
"mean_tBodyGyroJerk_mean_Z"      
"mean_tBodyGyroJerk_std_X"       
"mean_tBodyGyroJerk_std_Y"       
"mean_tBodyGyroJerk_std_Z"      
"mean_tBodyAccMag_mean"          
"mean_tBodyAccMag_std"           
"mean_tGravityAccMag_mean"       
"mean_tGravityAccMag_std"       
"mean_tBodyAccJerkMag_mean"      
"mean_tBodyAccJerkMag_std"       
"mean_tBodyGyroMag_mean"         
"mean_tBodyGyroMag_std"         
"mean_tBodyGyroJerkMag_mean"     
"mean_tBodyGyroJerkMag_std"      
"mean_fBodyAcc_mean_X"           
"mean_fBodyAcc_mean_Y"          
"mean_fBodyAcc_mean_Z"           
"mean_fBodyAcc_std_X"            
"mean_fBodyAcc_std_Y"            
"mean_fBodyAcc_std_Z"           
"mean_fBodyAccJerk_mean_X"       
"mean_fBodyAccJerk_mean_Y"       
"mean_fBodyAccJerk_mean_Z"       
"mean_fBodyAccJerk_std_X"       
"mean_fBodyAccJerk_std_Y"        
"mean_fBodyAccJerk_std_Z"        
"mean_fBodyGyro_mean_X"          
"mean_fBodyGyro_mean_Y"         
"mean_fBodyGyro_mean_Z"          
"mean_fBodyGyro_std_X"           
"mean_fBodyGyro_std_Y"           
"mean_fBodyGyro_std_Z"          
"mean_fBodyAccMag_mean"          
"mean_fBodyAccMag_std"           
"mean_fBodyBodyAccJerkMag_mean"  
"mean_fBodyBodyAccJerkMag_std"  
"mean_fBodyBodyGyroMag_mean"     
"mean_fBodyBodyGyroMag_std"      
"mean_fBodyBodyGyroJerkMag_mean"     
"mean_fBodyBodyGyroJerkMag_std"
