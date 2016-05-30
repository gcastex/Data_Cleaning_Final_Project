library(stringr)
library(dplyr)

## download and unzip data

file="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localfile="dc_project_file_data.zip"
download.file(file, localfile)
unzip(localfile)

traindir="UCI HAR Dataset/train/"
testdir="UCI HAR Dataset/test/"


## read train and test datasets

x_train<-read.table(paste0(traindir, "X_train.txt"))
y_train<-read.table(paste0(traindir, "y_train.txt"), col.names="activity_id")
subject_train<-read.table(paste0(traindir, "subject_train.txt"), col.names="subject")

x_test<-read.table(paste0(testdir, "X_test.txt"))
y_test<-read.table(paste0(testdir, "y_test.txt"), col.names="activity_id")
subject_test<-read.table(paste0(testdir, "subject_test.txt"), col.names="subject")


## merge train and test datasets

x_dat<-rbind(x_train, x_test)
y_dat<-rbind(y_train, y_test)
subject_dat<-rbind(subject_train, subject_test)

## keep mean and std features

features<-readLines("UCI HAR Dataset/features.txt")
ind<-grepl("[mM]ean\\(\\)|std\\(\\)", features)
x_dat<-x_dat[,ind]

## clean up the column names

feat_names<-strsplit(features[ind], " ")
feat_names<-sapply(feat_names, function(x) {gsub("\\-|,|\\(", "_", gsub("\\(\\)|\\)", "", x[2]))})
#feat_names[81]<-sub("\\)", "", feat_names[81])  ## fix a typo
names(x_dat)<-feat_names

## read activity labels

activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activity_id", "activity"))
y_dat<-merge(y_dat, activity_labels, by.col="activity_id")

## create tidy dataset

tidy_dataset<-cbind(subject_dat, select(y_dat, activity), x_dat)
write.csv(tidy_dataset, "tidy_dataset.csv")

## second dataset

by_activity<-group_by(tidy_dataset, subject, activity)
ncols=ncol(by_activity)
list_dat<-apply(by_activity[,3:ncols], 2, function(x) {summarize(by_activity, mean(x))})
tidy_dat2<-list_dat[[1]]
for (i in 2:length(list_dat)) {
    tidy_dat2<-cbind(tidy_dat2, list_dat[[i]][,3])
}
names(tidy_dat2)[3:ncols]<-paste0("mean_",names(by_activity)[3:ncols])
write.csv(tidy_dat2, "tidy_mean_dataset.csv")
