# Getting and Cleaning Data - Course Project

This script runs as long as the 'UCI HAR Dataset' folder in your working directory. 

What is does:

1. read in featureNames, activities, train data and test data
2. merges train and test data
3. Assigns featureNames as colnames to merged data (dim = 10299 rows * 563 cols)
4. Selects subset from merged data where the colnames matches on 'mean()' or 'std()'(dim = 10299 rows * 68 cols)
5. Changes numeric labels for activities to descriptive names
6. For further processing: make factors from column 'Subjects' and 'Activities'
7. Makes independent tidy dataset in which a mean is calculated for each individuals over each activity and each measurement
8. Saves tidy dataset as 'tidy.txt'
