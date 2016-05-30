# Dataset for the Data Cleaning John Hopkins course on Coursera

## Introduction
This repository contains an independant work based on the initial Human Activity Recognition Using Smartphones Dataset version 1.0 by:
Jorge L. Reyes-Ortiz et al. (www.smartlab.ws)
It was done for the Data Cleaning course from John Hopkins University on Coursera.

This repository contains the following files:
*CodeBook.md : Presents the data files and their variables.
*tidy_dataset.csv : First dataset computed from the intial HARUS dataset.
*tidy_mean_dataset.csv : Second dataset, computed from tidy_dataset.csv by averaging each variable over the subject and activity.
*run_analysis.R : The script used to read the HARUS dataset and create our derived files.
*README.md : The present file. Presents the scripts in a more user friendly manner.


## Analysis code
### Load libraries
Load the libraries needed for the analysis.
```{r}
library(stringr)
library(dplyr)
```

### Download and unzip data
Download the initial dataset and store it locally.

```{r}
file="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localfile="dc_project_file_data.zip"
download.file(file, localfile)
unzip(localfile)

traindir="UCI HAR Dataset/train/"
testdir="UCI HAR Dataset/test/"
```

### Read train and test datasets
Read the train and test datasets from the unzipped directories.
X, Y and subject data are stored in independant datafiles.
```{r}
x_train<-read.table(paste0(traindir, "X_train.txt"))
y_train<-read.table(paste0(traindir, "y_train.txt"), col.names="activity_id")
subject_train<-read.table(paste0(traindir, "subject_train.txt"), col.names="subject")

x_test<-read.table(paste0(testdir, "X_test.txt"))
y_test<-read.table(paste0(testdir, "y_test.txt"), col.names="activity_id")
subject_test<-read.table(paste0(testdir, "subject_test.txt"), col.names="subject")
```

### Merge train and test datasets
Merge the train and test data for each 3 components: X, Y, and subject.
```{r}
x_dat<-rbind(x_train, x_test)
y_dat<-rbind(y_train, y_test)
subject_dat<-rbind(subject_train, subject_test)
```

### keep mean and std features
From the initial dataset, we keep only the mean and standard variation of each variable. 

```{r}
features<-readLines("UCI HAR Dataset/features.txt")
ind<-grepl("[mM]ean\\(\\)|std\\(\\)", features)
x_dat<-x_dat[,ind]
```

### Clean up the column names
We clean up a bit the variable names to avoid later problems arising from the use of special characters. 
Parenthesis, dashes and commas are removed from variables names.
```{r}
feat_names<-strsplit(features[ind], " ")
feat_names<-sapply(feat_names, function(x) {gsub("\\-|,|\\(", "_", gsub("\\(\\)|\\)", "", x[2]))})
#feat_names[81]<-sub("\\)", "", feat_names[81])  ## fix a typo
names(x_dat)<-feat_names
```

### Read activity labels
Read the activity labels to have readable activity names instead of numbers.
```{r}
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activity_id", "activity"))
y_dat<-merge(y_dat, activity_labels, by.col="activity_id")
```

### Create tidy dataset
Create the final tidy dataset by merging X-variables, activity and subject, and save the resulting dataframe in a .csv file.
```{r}
tidy_dataset<-cbind(subject_dat, select(y_dat, activity), x_dat)
write.csv(tidy_dataset, "tidy_dataset.csv")
```

### Second dataset
Creation of the second dataset by computing the average of each variable for each activity and subject.
The second dataset is then save into a .csv file.
```{r}
by_activity<-group_by(tidy_dataset, subject, activity)
ncols=ncol(by_activity)
list_dat<-apply(by_activity[,3:ncols], 2, function(x) {summarize(by_activity, mean(x))})
tidy_dat2<-list_dat[[1]]
for (i in 2:length(list_dat)) {
    tidy_dat2<-cbind(tidy_dat2, list_dat[[i]][,3])
}
names(tidy_dat2)[3:ncols]<-paste0("mean_",names(by_activity)[3:ncols])
write.csv(tidy_dat2, "tidy_mean_dataset.csv")
```
