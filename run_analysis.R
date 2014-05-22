#Create a temporary file
tmpdir <- tempdir()
temp <- tempfile()

#Download the file from the link provided
setInternet2(TRUE)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- basename(url)
download.file(url,file)
unzip(file,exdir=tmpdir)

#Unzip & Read data
xtrainfile <- paste(tmpdir,"/UCI HAR Dataset/train/X_train.txt",sep="")
ytrainfile <- paste(tmpdir,"/UCI HAR Dataset/train/y_train.txt",sep="")
strainfile <- paste(tmpdir,"/UCI HAR Dataset/train/subject_train.txt",sep="")
xtrain <- read.table(xtrainfile,header = FALSE)
ytrain <- read.table(ytrainfile,header = FALSE)
strain <- read.table(strainfile,header = FALSE)

xtestfile <- paste(tmpdir,"/UCI HAR Dataset/test/X_test.txt",sep="")
ytestfile <- paste(tmpdir,"/UCI HAR Dataset/test/y_test.txt",sep="")
stestfile <- paste(tmpdir,"/UCI HAR Dataset/test/subject_test.txt",sep="")
xtest <- read.table(xtestfile,header = FALSE)
ytest <- read.table(ytestfile,header = FALSE)
stest <- read.table(stestfile,header = FALSE)

#Remove temp file
unlink(temp)

#1. Merges the training and the test sets to create one data set
datall <- rbind(cbind(strain,ytrain,xtrain),cbind(stest,ytest,xtest))

#2. Extracts only the measurements on the mean and standard deviation for each measurement
#mycols <- rep("NULL", 561)
#mycols[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)] <- NA
data <- subset(datall, select=c(1:2,3:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545))

#3. Uses descriptive activity names to name the activities in the data set
data[,2] <- gsub(1,"WALKING",data[,2])
data[,2] <- gsub(2,"WALKING_UPSTAIRS",data[,2])
data[,2] <- gsub(3,"WALKING_DOWNSTAIRS",data[,2])
data[,2] <- gsub(4,"SITTING",data[,2])
data[,2] <- gsub(5,"STANDING",data[,2])
data[,2] <- gsub(6,"LAYING",data[,2])


#4. Appropriately labels the data set with descriptive activity names
colnames(data) <- c("Subject","Activity","tBodyAccmeanX","tBodyAccmeanY","tBodyAccmeanZ","tBodyAccstdX","tBodyAccstdY","tBodyAccstdZ","tGravityAccmeanX","tGravityAccmeanY","tGravityAccmeanZ","tGravityAccstdX","tGravityAccstdY","tGravityAccstdZ","tBodyAccJerkmeanX","tBodyAccJerkmeanY","tBodyAccJerkmeanZ","tBodyAccJerkstdX","tBodyAccJerkstdY","tBodyAccJerkstdZ","tBodyGyromeanX","tBodyGyromeanY","tBodyGyromeanZ","tBodyGyrostdX","tBodyGyrostdY","tBodyGyrostdZ","tBodyGyroJerkmeanX","tBodyGyroJerkmeanY","tBodyGyroJerkmeanZ","tBodyGyroJerkstdX","tBodyGyroJerkstdY","tBodyGyroJerkstdZ","tBodyAccMagmean","tBodyAccMagstd","tGravityAccMagmean","tGravityAccMagstd","tBodyAccJerkMagmean","tBodyAccJerkMagstd","tBodyGyroMagmean","tBodyGyroMagstd","tBodyGyroJerkMagmean","tBodyGyroJerkMagstd","fBodyAccmeanX","fBodyAccmeanY","fBodyAccmeanZ","fBodyAccstdX","fBodyAccstdY","fBodyAccstdZ","fBodyAccJerkmeanX","fBodyAccJerkmeanY","fBodyAccJerkmeanZ","fBodyAccJerkstdX","fBodyAccJerkstdY","fBodyAccJerkstdZ","fBodyGyromeanX","fBodyGyromeanY","fBodyGyromeanZ","fBodyGyrostdX","fBodyGyrostdY","fBodyGyrostdZ","fBodyAccMagmean","fBodyAccMagstd","fBodyBodyAccJerkMagmean","fBodyBodyAccJerkMagstd","fBodyBodyGyroMagmean","fBodyBodyGyroMagstd","fBodyBodyGyroJerkMagmean","fBodyBodyGyroJerkMagstd")


#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
require(plyr)
avedata <- ddply(data, .(Subject, Activity), numcolwise(mean))