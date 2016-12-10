# R script for collecting and cleaning data set
#Reference: https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

rm(list=ls()) # clears variables in the environment

library(tidyr)
library(dplyr)


 #fileURL has the url for the zip file to be downloaded for the assignment
 fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
 #download the file to the working directory and unzip it
 download.file(fileURL,dest="GCDAssg.zip", mode="wb")
 # dataURL contains the file path for each of the files in their respective subfolders
 dataURL<-unzip ("GCDAssg.zip") 

#read in labels for the feature variables

featvar<-read.table(dataURL[2])
FeatLab<-as.character(featvar$V2) # list of variable names for xTest and xTrain

#Read all the training and test sets to be merged 

subTest<-read.table(dataURL[14])
        names(subTest)<-"ID" # rename columns
xTest<-read.table(dataURL[15])
        names(xTest)<-FeatLab # rename columns
yTest<-read.table(dataURL[16])
       names(yTest)<-"Activity" # rename columns

subTrain<-read.table(dataURL[26])
       names(subTrain)<-"ID" # rename columns
xTrain<-read.table(dataURL[27])
       names(xTrain)<-FeatLab # rename columns
yTrain<-read.table(dataURL[28])
      names(yTrain)<-"Activity" # rename columns
        
# Part 1: Merges the training and the test sets to create one data set.

TestDF<-data.frame(cbind(subTest,yTest,xTest)) # merges the Test data set
        
TrainDF<-data.frame(cbind(subTrain,yTrain,xTrain)) # merges the Train data set

# Data set with both test and train variables

mergedData<-merge(TestDF,TrainDF,all=TRUE,sort = FALSE) 
        
#Part 2: Extracts only the measurements on the mean and standard deviation for each measurement.

# Extracts all columns whose variable names have either mean or std any where
#in the name of the merged data set
        meanStdDF<-mergedData[,grepl("mean|std", colnames(mergedData))] 
# This step removes the cloumns which have meanFreq as title. The assignement asks for
#measurments with mean and standard deviation. The requirement for columns with meanFreq
#variable is not clear and I removed it because there are no standard deviation values
#associated with it
        meanStdDF<-meanStdDF[,!(grepl("meanFreq", colnames(meanStdDF)))]
# Extracts the subject id and activities column from the merged data set
        IDLabel<-mergedData[,c(1,2)]
# Merged data set with subject id's, activity columns and variables containing mean and
#standard deviation values
        meanStdDF2<-cbind.data.frame(IDLabel,meanStdDF)
# Orders the previous data first by subject id's and then by activity numbers
        meanStdDF2<-arrange(meanStdDF2,ID,Activity)
       
#Part 3: Uses descriptive activity names to name the activities in the data set  
        
# Uses nested if else loops to assign descriptive names to activity values
        meanStdDF2[,2] <- ifelse(meanStdDF2[,2] == 1, "walking", 
                ifelse(meanStdDF2[,2] == 2, "walking up",
                      ifelse(meanStdDF2[,2] == 3, "walking down", 
                              ifelse(meanStdDF2[,2] == 4, "sitting", 
                                      ifelse(meanStdDF2[,2] == 5, "standing",
                                            ifelse(meanStdDF2[,2] == 6, "laying",NA))))))
        
#Part 4: Appropriately labels the data set with descriptive variable names.
# Uses gsub to modifiy the existing variable names for a cleaner appearance 
#Please see code book for further details

        names(meanStdDF2)<-gsub("[...]","",names(meanStdDF2))#removes "..." from variable names
        names(meanStdDF2)<-gsub("std","Std",names(meanStdDF2))# capitalises "S" in std
        names(meanStdDF2)<-gsub("mean","Mean",names(meanStdDF2))# capitalises "M" in mean

#Part 5:From the data set in step 4, creates a second, independent tidy data set 
        #with the average of each variable for each activity and each subject.
# Group_by followed by summarise_each allows for calculating the averages for each activity
        # for each subject id
        tidyMeanSet<- group_by(meanStdDF2, ID, Activity) %>% summarise_each(funs(mean))
# The data set generated in the previous step is exported to a csv file
        write_csv(tidyMeanSet,"TidyMeanStd.csv")
        
#Please uncomment and use following code to read the tidy data set.
       # FileUrl<"https://github.com/ssbpv/FinalProjectGCD/blob/master/TidyMeanStd.csv"
       # data <- read.csv(FileUrl, header = TRUE)
       # View(data)



