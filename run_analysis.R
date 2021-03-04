features <- read.table('UCI HAR Dataset/features.txt') # Load feature labels
activities <- read.table('UCI HAR Dataset/activity_labels.txt') # number -> activity name mapping

# Load main data set
X <- rbind(read.table('UCI HAR Dataset/test/X_test.txt'), read.table('UCI HAR Dataset/train/X_train.txt'))
names(X) <- features[,2]
X <- X[,c(grep('mean()|std()',names(X)))] # extract only mean and standard deviation measurements

# Load activities data set and add their labels
y <- rbind(read.table('UCI HAR Dataset/test/y_test.txt'), read.table('UCI HAR Dataset/train/y_train.txt'))
y <- merge(y, activities, by.x=1, by.y=1) # add column with activity name based on number

# Load subject data set
s <- rbind(read.table('UCI HAR Dataset/test/subject_test.txt'), read.table('UCI HAR Dataset/train/subject_train.txt'))

X <- cbind(cbind(s,y[,2]),X) # Add subject and activity columns to main data frame
names(X) <- c('subject','activity',names(X)[3:ncol(X)]) # Change column names 

library(dplyr)
# Average of each variable for each activity and each subject
df <- X %>% group_by(subject, activity) %>% summarize(across(everything(), list(mean)))
names(df) <- gsub('_1','',names(df))
write.table(df, 'tidy.txt', row.names=FALSE) # Write result