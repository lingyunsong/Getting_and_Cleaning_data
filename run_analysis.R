Ent#This is for Data_cleaning_project
#script name: run_analysis.R
# This script (run_analysis.R) does the following. 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# read the ID files(y_test, y_train; activity_labels.txt) into R

setwd("C:/Users/jason/Desktop/Coursera_homeworks/Cleaning_data")

y_test <- read.csv("./UCI HAR Dataset/test/y_test.txt", sep="", header=F)
subject_test <- read.csv("./UCI HAR Dataset/test/subject_test.txt", sep="", header=F)
y_train <- read.csv("./UCI HAR Dataset/train/y_train.txt", sep="", header=F)
subject_train <- read.csv("./UCI HAR Dataset/train/subject_train.txt", sep="", header=F)
activity <- read.csv("./UCI HAR Dataset/activity_labels.txt", sep="", header=F)


#read names of feature data (within file features.txt) into R, and change it to a vector "f" containing names of features.
features <- read.csv("./UCI HAR Dataset/features.txt", sep="", header=F)
f <- features[,2]

#read data into R
x_test <- read.csv("./UCI HAR Dataset/test/X_test.txt", sep="", header=F)
x_train <- read.csv("./UCI HAR Dataset/train/X_train.txt", sep="", header=F)


#combine test ID file and data file into one file "test"
test <- cbind(subject_test,y_test, x_test)

#combine train ID file and data file into one file "train"
train <- cbind(subject_train,y_train, x_train)

#1. Merges the training and the test sets to create one data set.
#combine test and train to be one file "data"
combine <- rbind(test, train)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
col_mean_std <- (grep("mean|std", f)+2)
mean_std <- combine[,c(1,2,col_mean_std)]

#3. Uses descriptive activity names to name the activities in the data set
#change "human_activity" in test and train files as descriptive.
for (i in 1:6) 
{ 
mean_std[,2] = gsub(i, activity[i,2], mean_std[,2])
}

#4. Appropriately labels the data set with descriptive variable names. 
ID_names <- c("volunteer_ID", "human_activity")
data_names <- as.character(f[grep("mean|std", f)])
names(mean_std) <- c(ID_names, data_names)

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#make tidy data by using package "reshape2"
library(reshape2)

melt_data = melt(mean_std, id =ID_names, measure.vars = data_names) 
tidy_data   = dcast(melt_data, volunteer_ID + human_activity ~ variable, mean) 

write.table(tidy_data, "tidy_data.txt", sep='\t', row.name=FALSE)

 


er file contents here
