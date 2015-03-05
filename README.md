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
