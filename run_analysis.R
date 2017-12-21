run_analysis <- function(variables) 
{
  # load libraries
  library(dplyr)
  library(reshape2)
  
  # merge the training and the test sets to create one data set.
  featureNames <- read.delim("UCI HAR Dataset/features.txt", sep='', header=F, stringsAsFactors = F) # get feature names (N=561)
  activity_labels <- read.delim("UCI HAR Dataset/activity_labels.txt", sep='', header=F, stringsAsFactors = F)  # get activities
    
  # get train data (dim= 7352 rows * 563 cols)
  X_train <- tbl_df(read.delim("UCI HAR Dataset/train/X_train.txt", sep='', header=F, stringsAsFactors = F))
  subject_train <- tbl_df(read.delim("UCI HAR Dataset/train/subject_train.txt", sep='', header=F, stringsAsFactors = F))
  y_train <- tbl_df(read.delim("UCI HAR Dataset/train/y_train.txt", sep='', header=F, stringsAsFactors = F))
  train_data <- cbind(subject_train, y_train, X_train)
  
  # get test data (dim= 2947 rows * 563 cols)
  X_test <- tbl_df(read.delim("UCI HAR Dataset/test/X_test.txt", sep='', header=F, stringsAsFactors = F))
  subject_test <- tbl_df(read.delim("UCI HAR Dataset/test/subject_test.txt", sep='', header=F, stringsAsFactors = F))
  y_test <- tbl_df(read.delim("UCI HAR Dataset/test/y_test.txt", sep='', header=F, stringsAsFactors = F))
  test_data <- cbind(subject_test, y_test, X_test)
  
  # merge data (dim = 10299 rows * 563 cols) & appropriately labels the data set with descriptive variable names.
  merged_df <- rbind(train_data, test_data) # merge data
  names(merged_df) <- c("Subject","Activity", featureNames[,2]) # assign feature names
  
  # select only the columns with measurements on the mean and standard deviation (dim = 10299 rows * 68 cols)
  cols_to_keep <- which(grepl("mean\\(|std\\(", names(merged_df))) # find idx of colnames that match on 'mean(' or 'std('
  subset <- merged_df[c(1,2,cols_to_keep)] # select only those columns + col with subject id and activity
  
  # Uses descriptive activity names to name the activities in the data set and make factor from activities and subjects for further purposes
  subset$Activity <- factor(subset$Activity, levels = activity_labels[,1], labels = activity_labels[,2])
  subset$Subject <- as.factor(subset$Subject)
  
  # Creates an independent tidy data set with the average of each variable for each activity and each subject.
  tidy_ds <- subset %>% melt(id = c("Subject", "Activity")) %>% dcast(Subject + Activity ~ variable, mean)
  
  write.table(tidy_ds, "tidy.txt", row.names = F, quote=F)
}