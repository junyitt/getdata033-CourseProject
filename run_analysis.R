# STEP 1 Merge training and test sets

library(plyr); library(dplyr)

setwd("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

setwd("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

setwd("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

datatrain <- cbind(subject = subject_train$V1, activity = y_train$V1, X_train)
datatest <- cbind(subject = subject_test$V1, activity = y_test$V1, X_test)
data1 <- rbind(datatrain, datatest)

#STEP 2 Extract mean and std of measurements
meangrep <-grep("mean()",features$V2)
meanfgrep <-grep("meanFreq()",features$V2)
meangrep <- meangrep[!meangrep %in% meanfgrep]
stdgrep <-grep("std()",features$V2)
reqfeatures <- sort(as.numeric(unique(c(meangrep, stdgrep))))
meanstd <- sort(as.numeric(unique(c(1,2, meangrep+2, stdgrep+2))))
data2 <- data1[,meanstd]

#STEP 3 Name the activities

data2[,"activity"] <- factor(x = data2[,2], labels = activity_labels$V2, levels = 1:6)


#STEP 4 Descriptive variables names
names(data2) <- c("subject","activity",as.character(features$V2[reqfeatures]))

#STEP 5 Mean of each variable for each subject and each activity
data3 <- data2 %>% group_by(subject,activity) %>% summarise_each(funs(mean))

write.table(data3, "data3.txt", row.name = FALSE)

