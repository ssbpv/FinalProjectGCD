---
title: "CodeBook"
author: "SSBPV"
date: "December 8, 2016"
output: html_document
---


## CodeBook for run_analysis.R and TidyMeanStd.txt

CodeBook.md has two parts. Part 1 describes the variables and the transformation of the data within the run_analysis.R script. Part 2 contains the description of the variables in the "TidyMeanStd.txt" data set.

### Part 1: for run_analysis.R

**fileURL:** contains the [weblink](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for the original data set that was used for this analysis.

**GCDAssg.zip:** file name of the zip file in the working directory

**dataURL:** contains a character vector with the path to each unzipped file in the various subfolders

**featvar & FeatLab:** list of variable names for xTest and xTrain, FeatLab is a character vector. These variable names were extracted from 'features.txt'.

**subTest/subTrain:** data extracted from 'subject_test.txt'/'subject_train.txt' where each row contains the ID of the subjects who performed the activity for each window sample (range: 1 to 30). The column was renamed as 'ID'.

**yTest/yTrain:** data extracted from 'y_test.txt'/'y_train.txt' where each row has the corresponding activity labels as numbers.

**xTest/xTrain:** data extracted from 'x_test.txt'/'x_train.txt' which are the test and training sets respectively. Each column in theis respective dataset contains the data from the variables as detailed in 'features.txt'.

**TestDF/TrainDF:** respective data frame where (subTest,yTest,xTest)/(subTrain,yTrain,xTrain) are column binded.

**mergedData:** merged data frame of TestDF & TrainDF.

**meanStdDF:** contains all columns whose variable names have either mean or std with the exception of column names containing meanFreq.

**IDLabel:** contains the ID and avtivity label variables from mergedData.

**meanStdDF2:** data frame where meanStdDF and IDLabel are column binded and then arranged first using ID and then by Activity. Subsequently the activity numbers are replaced by the corresponding descriptive names. In the next step column names are cleaned up using gsub for easier visualiztion. The column names are described in detail in Part 2.

**tidyMeanSet:** contains independent tidy data set with the average of each variable for each activity and each subject created using group_by first by ID then activity followed by summarise_each. This data set is then written into a text file "TidyMeanStd.txt".

### Part 2: for TidyMeanStd.txt
Listed below are the column names and description of the variables in "TidyMeanStd.txt". This data file is a subset of the 'mergedData' and contains only information of the average of each variable of mean and standard deviation for each activity and each subject.

**1 ID:** column contains the subject identification number.

**2 Activity:** column contains what type of activity is being performed by the subjects (walking, walking, up, walking down, sitting, standing and laying). 

**3-68:** Contains the average of the 'mean' and 'standard deviation' of each variable for each activity for each subject. The following nomenclature applies for all the variables from column names numbered 3 to 68.

        - Variable names with prefix 't' denotes values of time domain signals captured at 50 Hz and filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
        
        - Variable names with prefix 'f' denotes  indicate frequency domain signals obtained by fast fourier transform of signals
        
        - Variable names containing 'Acc' denotes acceleration values
        
        - Variable names containing 'Body' denotes body decomposed values
        
        - Variable names containing 'Gravity' denotes gravity decomposed values 
        
        - Variable names containing 'BodyAccJerk' denotes body linear acceleration 
        
        - Variable names containing 'BodyGyroJerk' denotes body angular velocity 
        
        - Variable names containing 'Mag' denotes the magnitude of the three-dimensional signals calculated using the Euclidean norm
        
        - Variable names containing 'X/Y/Z' denotes 3-axial signals in the X, Y and Z   directions
        
        - Variable names containing 'Mean' denotes the mean values
         
        - Variable names containing 'Std' denotes the standard deviation values



**3 tBodyAccMeanX**

**4 tBodyAccMeanY**

**5 tBodyAccMeanZ**

**6 tBodyAccStdX**

**7 tBodyAccStdY**

**8 tBodyAccStdZ**

**9 tGravityAccMeanX**

**10 tGravityAccMeanY**

**11 tGravityAccMeanZ**

**12 tGravityAccStdX**

**13 tGravityAccStdY**

**14 tGravityAccStdZ**

**15 tBodyAccJerkMeanX**

**16 tBodyAccJerkMeanY**

**17 tBodyAccJerkMeanZ**

**18 tBodyAccJerkStdX**

**19 tBodyAccJerkStdY**

**20 tBodyAccJerkStdZ**

**21 tBodyGyroMeanX**

**22 tBodyGyroMeanY**

**23 tBodyGyroMeanZ**

**24 tBodyGyroStdX**

**25 tBodyGyroStdY**

**26 tBodyGyroStdZ**

**27 tBodyGyroJerkMeanX**

**28 tBodyGyroJerkMeanY**

**29 tBodyGyroJerkMeanZ**

**30 tBodyGyroJerkStdX**

**31 tBodyGyroJerkStdY**

**32 tBodyGyroJerkStdZ**

**33 tBodyAccMagMean**

**34 tBodyAccMagStd**

**35 tGravityAccMagMean**

**36 tGravityAccMagStd**

**37 tBodyAccJerkMagMean**

**38 tBodyAccJerkMagStd**

**39 tBodyGyroMagMean**

**40 tBodyGyroMagStd**

**41 tBodyGyroJerkMagMean**

**42 tBodyGyroJerkMagStd**

**43 fBodyAccMeanX**

**44 fBodyAccMeanY**

**45 fBodyAccMeanZ**

**46 fBodyAccStdX**

**47 fBodyAccStdY**

**48 fBodyAccStdZ**

**49 fBodyAccJerkMeanX**

**50 fBodyAccJerkMeanY**

**51 fBodyAccJerkMeanZ**

**52 fBodyAccJerkStdX**

**53 fBodyAccJerkStdY**

**54 fBodyAccJerkStdZ**

**55 fBodyGyroMeanX**

**56 fBodyGyroMeanY**

**57 fBodyGyroMeanZ**

**58 fBodyGyroStdX**

**59 fBodyGyroStdY**

**60 fBodyGyroStdZ**

**61 fBodyAccMagMean**

**62 fBodyAccMagStd**

**63 fBodyBodyAccJerkMagMean**

**64 fBodyBodyAccJerkMagStd**

**65 fBodyBodyGyroMagMean**

**66 fBodyBodyGyroMagStd**

**67 fBodyBodyGyroJerkMagMean**

**68 fBodyBodyGyroJerkMagStd**

