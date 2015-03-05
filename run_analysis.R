#################################################################################################

## Getting and Cleaning Data Project


# Set working directory
setwd("./Project/UCI HAR Dataset")

# Import features names and activity labels from txt files
features <- read.table('./features.txt', header=FALSE)
activityLabels <- read.table('./activity_labels.txt', header=FALSE)
colnames(activityLabels) <- c('activitylabel','activity')

# Import subjectId
subjectTrain <- read.table('./train/subject_train.txt', header=FALSE)
colnames(subjectTrain) <- 'subjectId'
subjectTest <- read.table('./test/subject_test.txt', header=FALSE)
colnames(subjectTest) <- 'subjectId'
subjectFinal <- rbind(subjectTrain,subjectTest)

# Import Dependent variable data
yTrain <- read.table('./train/Y_train.txt', header=FALSE)
yTest <- read.table('./test/Y_test.txt', header=FALSE)
colnames(yTrain) <- 'activitylabel'
colnames(yTest) <- 'activitylabel'

# Merge dependent variable data and add in activity name
yFinal <- rbind(yTrain,yTest)
yFinal <- merge(yFinal,activityLabels,by.x='activitylabel', by.y='activitylabel',all.x=TRUE

# Import features data
xTrain <- read.table('./train/X_train.txt', header=FALSE)
xTest <- read.table('./test/X_test.txt', header=FALSE)
colnames(xTrain) <- features[,2]
colnames(xTest) <- features[,2]

# Merge features data
xAll <- rbind(xTrain,xTest)

# Select columns that are mean and std
colNames <- colnames(xAll)
logicalVector <- (grepl("-mean",colNames) & !grepl("-meanFreq",colNames) | grepl("std", colNames))
xFinal <- xAll[,logicalVector]

# to check the what columns are extracted
# table(colNames[logicalVector])

)

# Merge subject, x and y data, and activity label
dataFinal <- cbind(subjectFinal,xFinal,yFinal)

# Clean up variable names
colNamesFinal <- colnames(dataFinal)

for (i in 1:length(colNamesFinal)){
    colNamesFinal[i] <- gsub("\\()","",colNamesFinal[i])
    colNamesFinal[i] <- gsub("^(t)","time",colNamesFinal[i])
    colNamesFinal[i] <- gsub("^(f)","freq",colNamesFinal[i])
    colNamesFinal[i] <- gsub("BodyBody","Body",colNamesFinal[i])
    colNamesFinal[i] <- gsub("-mean","Mean",colNamesFinal[i])
    colNamesFinal[i] <- gsub("-std","Std",colNamesFinal[i])
    colNamesFinal[i] <- gsub("Mag","Magnitude",colNamesFinal[i])    
}

colnames(dataFinal) <- colNamesFinal

# Create tidy data set, which is a data set with the average of each variable for each activity and each subject.
tidy <- tbl_df(dataFinal)
tidy <- tidy %>% group_by(activity,subjectId) %>% summarise_each(funs(mean))

## Write to file
write.table(tidy, file = "./tidy_data.txt",row.names=FALSE)
