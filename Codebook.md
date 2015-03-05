<<<<<<< HEAD
# Getting and Cleaning Data Project

This repositiory is created for submission of Getting and Cleaning Data project.

## Introduction
This project serves to demostrate and consolidate the learning from the getting and cleaning data course, which involves collecting and cleaning data set that is easy to use for further analysis. 

## About the dataset
A full description of the data used can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data for the project can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Project objective
The objective of this project is to create a R script that does the following to the given dataset:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## About run_analysis.R script
1. Set the working directory to be the same as where the dataset is located, UCI HAR Dataset. 
2. Save run_analysis.R in the same working directory
3. Run the run_analysis.R file, and a tidy_data.txt will be created in the same folder

## About Codebook
Codebook.md describes the variables, the data, and any transformations or work that have been performed to clean up the data
=======
# run_analysis.R Codebook

##About Data Set 

The data set is derived from recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment

and these attributes are found in the files listed below:

ID of subjects performing the activity: subject_test.txt,subject_train.txt
561-feature vector names: features.txt
561-feature vector description: features_info.txt
561-feature vector readings: x_test.txt,x_train.txt
Activity performed (dependent variable): y_test.txt,y_train.txt
Activity descriptive labels: activity_labels.txt

## Overview of steps in run_analysis.R

###1. Import features name and activity labels data

###2. Create a vector to store all Subject Ids
a. Import data sets that gives ID of subjects performing the activity
b. Create a variable subjectFinal that stores all the subject IDs from training and test data sets

###3. Create a data frame to store actitivy performed by subjects
a. Import data sets that gives Activity performed
b. Create a dataframe yFinal that stores the activity performed from training and test data sets
c. Import and merge the activity descriptive labels to dataframe yFinal

###4. Create a data frame to store all features data
a. Import data sets that gives 561-feature vector readings
b. Create a dataframe, xAll that stores all the readings from training and test data sets

###5. Create data frame that only contains mean and standard deviation information
a. Create a logicalVector by using grepl that output TRUE if column name contains "mean" or "std" and not "meanFreq"
b. Create a dataframe, xFinal that only has columns that contains mean or std information

###6. Create final data frame that contains subject, selected feature vectors and activity information
a. Column bind the vector/dataframe created for subjects, activity performed and feature vector readings (i.e subjectFinal, yFinal, and xFinal)
b. Clean up the variable names by using gsub function, and the final data set is named dataFinal.

###7. Create tidy data set, which is a data set with the average of each variable for each activity and each subject.
a. Create a new dataframe, tidy from dataFinal by using group_by and summarise_each functions from dplyr package

###8. Write tidy to a txt.file


>>>>>>> 3bf021de902398217ddba8d00ac435b3b193213b
