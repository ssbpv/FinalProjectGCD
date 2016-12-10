---
output: html_document
---
---
title: "README"
author: "SSBPV"
date: "December 8, 2016"
output: html_document

---


## This is a README file that explains the analysis files used for the Assignment in Getting and Cleaning Data Course Project

-The data for this project was downloaded from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and the site from where data is obtained is [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

-The experimental protocol for the Human Activity Recognition Using Smartphones Dataset is as follows: "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain" (Reference: README.txt in the orginal files downloaded from the above link).

-For the purpose of the assignment I have merged the training and test data set, extracted only the measurements on the mean and standard deviation for each measurement, re-labelled the variables and created a second, independent tidy data set with the average of each variable for each activity and each subject. The codes and accompanying comments are elaborated below and in the run_analysis.R script.

##The data set in the repository includes the following files:
README.md, CodeBook.md,run_analysis.R script and TidyMeanStd.csv

**README.md**

**CodeBook.md:**
CodeBook.md has two parts. Part 1 describes the variables and the transformation of the data within the run_analysis.R script. Part 2 contains the description of the variables in the "TidyMeanStd.csv" data set.

**TidyMeanStd.csv:** 
Tidy data set with the average of each variable of mean and standard deviation for each activity and each subject.

**run_analysis.R:** 

        -The data is first dowloaded using download.file and saved as "GCDAssg.zip". dataURL contains a character vector with the path to each file in the various subfolders within the working directory.
        
        -Next step involves reading all the relevant files into R using read.table with the file paths contained in dataURL. The test and train files are read separately. 
        
        -Part 1 merges all the data files together to create a single large dataset using cbind and merge.
        
        -Part 2 extracts only the measurements on the mean and standard deviation for each measurement using grepl.I removed the columns with the meanFreq variable as it is not clear if it is required and because there are no accompanying standarad deviation values for the meanFreq variable. According to [David Hood](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/), including meanFreq variable is dependent on individual discretion. 
        
        -Part 3 assigns descriptive names to activities and part 4 cleans up the names for the variables. 
        
        -Part 5 creates a second, independent tidy data set with the average of each variable for each activity and each subject. I have opted for a wide format representation of the data though both wide and narrow formats are acceptable for this assignment (reference:[David Hood's blog](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/)). I have used the write_csv function to generate a csv file of the tidy data set "TidyMeanStd.csv". Please use the following code to read it:
        ``` FileUrl<""
         data <- read.csv(FileUrl, header = TRUE)
         View(data)
```
        





