Getting_and_Cleaning_data
=========================
This is a README document for script run_analysis.R.

Input data are from the project "Human Activity Recognition Using Smartphones Dataset". A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Project data can be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Preparations before running run_analysis.R:
(1) download project data from above website, and unzip it to be "./UCI HAR Dataset" folder. 
(2)install package "reshape2" in R.

Data processing steps of run_analysis.R
1. set up directory to "./UCI HAR Dataset".
2. read data into R.
3. Merges the training and the test sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement.
5.  Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
6. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
7. write the "tidy_data".

More detailed introduction about the project datasets can be found in ./UCI HAR Dataset/README.txt file. 
