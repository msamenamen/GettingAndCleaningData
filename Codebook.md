# Codebook

The data source used in this file is the Human Activity Recognition Using Smartphones Dataset collected from the accelerometers from the Samsung Galaxy S smartphone.
The data source can be retrieved from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The link also contains features_info.txt which includes the detaled description of the original dataset.

The final output is the **TidyDataSet.csv** file which contains the tidy data obtained from running *run_analysis.R* file. It's worth to note that *run_analysis.R* automatically opens in R a table similar to this file.

### Dataset Transformation
*run_analysis.R* file assumes that the directory is set where the downloaded data source zip folder is.
All the tasks required are performed as discussed below.

1. Merges the training and the test sets to create one data set.
      - One data set is named "OneData".
2. Extracts only the measurements on the mean and standard deviation for each measurement.
      - This is performed by the grep command which is stored in "subdataFeaturesNames".
3. Uses descriptive activity names to name the activities in the data set.
      - This is performed after merging necessary data. This is achieved by using the names() command.
4. Appropriately labels the data set with descriptive variable names. Using the names() and gsub() commands, 
      - Prefix t is replaced with complete word time
      - Prefix f is replaced with complete word frequency
      - Acc is replaced with complete word Accelerometer
      - Gyro is replaced with complete word Gyroscope
      - Mag is replaced with complete word Magnitude
      - BodyBody is corrected with word Body
  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
     - This is achieved by using the dplyr package which allows the use of summarise_all(funs(mean)) command.
  
License:
========
From the data source, we reference here the use of its dataset in publications:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
