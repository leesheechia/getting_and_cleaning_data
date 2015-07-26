# getting_and_cleaning_data
course project

The data set used: Human Activity Recognition Using Smartphones

A few steps were taken in order to tidy the initial data set given. I have created a R script called run_analysis.R, which contains all the code to perform the analyses.

The R script does the following:

1. Download the data source,extract the UCI HAR Dataset folder to my local drive.

2. Load the information of activity labels and features.  

3. Load the train and test datasets, and extract only the measurement on the mean and standard deviation for each measurement.

4. Appropriately labels the data set with descriptive variable names.

5. Load the activity and subject data for each dataset, perform column bind to merge the datasets.

6. Merges the training and the test sets to create one data set.

7. Add labels for the merged data.

8. Turn activity & subject into factors.

9. Require Library(reshape2)

10. Variables were further summarized by taking their mean for each subject/activity pair.

11. The final data set can be found in the tidy.txt file, and uploaded into the text box in the course project.


#The dataset includes the following files:

    'README.txt'

    'features_info.txt': Shows information about the variables used on the feature vector.

    'features.txt': List of all features.

    'activity_labels.txt': Links the class labels with their activity name.

    'train/X_train.txt': Training set.

    'train/y_train.txt': Training labels.

    'test/X_test.txt': Test set.

    'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

    'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

    'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

    'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

    'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
 