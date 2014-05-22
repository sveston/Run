# Introduction  

The purpose of the 'run_analysis.R' script is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.  

## Background  
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:   

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
  
The data for the project:  

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### What 'run_analysis.R' script does  
. The script will first download the zip file from the above link to a temporary file in your terminal  
. Then it will unzip and extract the entire data from the following files for cleaning up:-  

          X_train.txt  
          y_train.txt  
          subject_train.txt  
          X_test.txt  
          y_test.txt  
          subject_test.txt  
          
. The first step for cleaning is to join all the files together to form a single file with Subject as the first entry, followed by the Activity and finally the various data measurement collected from the watch  
. A new set of data is created from the single file which only contain the Subject, Activity, mean and standard deviation of the data measurement   
. As the activities are number coded, the third step is to substitute those code with the actual name of the activity being done  
. In addition, the columns are labelled with defaults and hence the fourth step is to insert the column names
. Finally, a new set of data is created by averaging the means and standard deviations of the measured data of each subject and activity pairs respectively