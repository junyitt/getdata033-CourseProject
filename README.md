
# STEP 1 Merge training and test sets

First load the R packages, plyr and dplyr.
Then, set the working directory to "~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/" and load the "features.txt" and "activity_labels.txt"

Next, set the working directory to "~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train" and load the "X_train.txt" (the training set), "y_train.txt" (the activitiy labels in numeric), "subject_train.txt" (the subject who performed the activities). 

Next, set the working directory to "~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train" and load the "X_test.txt" (the test set), "y_tes.txt" (the activitiy labels in numeric), "subject_test.txt" (the subject who performed the activities). 

After that, the subject, activity labels and training set are cbind together and assigned to datatrain; the subject, activity labels and test set are cbind together and assigned to datatest.

datatrain and dataset are then rbind and assigned to data1 which includes both the training and test sets.


#STEP 2 Extract mean and std of measurements

First, the indices of those variables that matches "mean()" is assigned meangrep. Then the indices of those variables that matches "meanFreq()" is assigned meanfgrep. The required indices is meangrep excluding meanfgrep. 
Secondly, the indices of those variables that matches "std()" is assigned stdgrep.
The unique required features (meangrep) indices are then selected and sort and assigned to reqfeatures.

meanstd is the adjustment made due to additional columns added (subject and activities)
data1 is then subset according to indices in meanstd and assigned to data2.
The resulting dataframe, data2 contains only the mean and standard deviation of the measurements, along with the subject and activities label.

#STEP 3 Name the activities

##The activities labels ranges from 1 to 6 are then replaced with descriptive activity names i.e.
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

#STEP 4 Descriptive variables names

Each of the mean and standard deviation of the measurements variables are then assigned their respective descriptive names. 

#STEP 5 Mean of each variable for each subject and each activity

An independent tidy data set, data3 with the average of each variable for each activity and each subject is created by grouping the variables, summarising and applying the function mean to data2.

data3 is then output as "data3.txt".


