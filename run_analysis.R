run_analysis <- function() {
	
	#Read all the necessary data
	ytestActivity <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
    ytrainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)

	subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
    subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
	
	XtestFeatures <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
    XtrainFeatures <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
	
	#Merge the training and test sets to create one Data Set.
	dataSubject <- rbind(subjecttest, subjecttrain)
	dataActivity <- rbind(ytestActivity, ytrainActivity)
	dataFeatures <- rbind(XtestFeatures, XtrainFeatures)
		
		#Use descriptive activity names to name the activities in the data set
		names(dataSubject) <- c("SubjectID")
		names(dataActivity) <- c("Activities")
		dataFeaturesNames <- read.table("./UCI HAR Dataset/features.txt", sep = "", header = FALSE)
		names(dataFeatures) <- dataFeaturesNames$V2
	
	dataMerge <- cbind(dataSubject, dataActivity)
	OneData <- cbind(dataMerge, dataFeatures)
	
	#Extract only the measurements on the mean and standard deviation for each measurement
	subdataFeaturesNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
	selectedNames <- c(as.character(subdataFeaturesNames), "SubjectID", "Activities")
	OneData <- subset(OneData, select = selectedNames)
	ActivityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
	OneData$Activities <- factor(OneData$Activities, labels = as.character(ActivityLabels[,2])) #Factors activity_labels files
	
	#Appropriately label the data set with descriptive variable names
	names(OneData) <- gsub("^t", "time", names(OneData))
    names(OneData) <- gsub("^f", "frequency", names(OneData))
	names(OneData) <- gsub("Acc", "Accelerometer", names(OneData))
	names(OneData) <- gsub("Gyro", "Gyroscope", names(OneData))
	names(OneData) <- gsub("Mag", "Magnitude", names(OneData))
	names(OneData) <- gsub("BodyBody", "Body", names(OneData))
	OneData <- OneData[,c(67, 68, 1:66)] #sets Subject ID and Activities as the first and second columns, respectively
	View(OneData)
	
	#From OneData, create a second, independent tidy data set with average of each activity and each subject
    library(dplyr)
	AverageDataSet <- group_by(OneData, SubjectID, Activities) %>%
        summarise_all(funs(mean))
		View(AverageDataSet)
		write.csv(AverageDataSet, file = "TidyDataSet.csv", row.names=FALSE)
}