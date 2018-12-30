# Getting and Cleaning Data
Final Programming Assignment in Getting and Cleaning Data Course in Coursera


### On the run_analysis.R File
The primary data source used in this file is the Human Activity Recognition Using Smartphones Dataset collected from the accelerometers from the Samsung Galaxy S smartphone. The data source can be retrieved from the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This file results in the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### On the TidyDataSet.csv
As its filename suggests, this file contains the tidy data obtained from running run_analysis.R file. It's worth to note that one can use the View tables which was automatically opened in R.

### On the Codebook.md
This file contains all the variables and summaries calculated, and relavant information.


## License:

From the data source, we reference here the use of its dataset in publications:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
