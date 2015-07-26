#Load activity_labels and features.
#Uses descriptive activity names to name the activities in the data set

activityName <- read.table("activity_labels.txt")
activityName[,2] <- as.character(activityName[,2])

features <- read.table("features.txt")
features[,2] <- as.character(features[,2])

#Extracts only the measurements on the mean and standard deviation for each measurement.
#Appropriately labels the data set with descriptive variable names.

features2 <- grep(".*mean.*|.*std.*", features[,2])
features2.names <- features[features2,2]
features2.names = gsub('-mean', 'Mean', features2.names)
features2.names = gsub('-std', 'Std', features2.names)
features2.names <- gsub('[-()]', '', features2.names)

#Merges the training and the test sets to create one data set.
#Add labels.

train <- read.table("X_train.txt")[features2]
trainY <- read.table("y_train.txt")
trainSubject <- read.table("subject_train.txt")
train <- cbind(trainSubject, trainY, train)

test <- read.table("X_test.txt")[features2]
testY <- read.table("y_test.txt")
testSubject <- read.table("subject_test.txt")
test <- cbind(testSubject, testY, test)

mergedData <- rbind(train, test)

colnames(mergedData) <- c("subject", "activity", features2.names)

library(reshape2)

# Turn activities & subjects into factors

mergedData$activity <- factor(mergedData$activity, levels = activityName[,1], labels = activityName[,2])
mergedData$subject <- as.factor(mergedData$subject)

mergedData.melted <- melt(mergedData, id = c("subject", "activity"))
mergedData.mean <- dcast(mergedData.melted, subject + activity ~ variable, mean)


write.table(mergedData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
