# Download and unzip dataset
download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile = 'dataset.zip')
unzip(zipfile = 'dataset.zip')
file.remove('dataset.zip')

# Opening files
activity <- read.table(file = 'UCI HAR Dataset/activity_labels.txt',
                       col.names = c('ID','Name'), header = FALSE, sep = " ")
features <- read.table(file = 'UCI HAR Dataset/features.txt',
                       col.names = c('ID','Name'), header = FALSE, sep = " ")

# Merging train and test files
X <- rbind(read.table(file = 'UCI HAR Dataset/train/X_train.txt'),
           read.table(file = 'UCI HAR Dataset/test/X_test.txt'))


y <- rbind(read.table(file = 'UCI HAR Dataset/train/y_train.txt'),
           read.table(file = 'UCI HAR Dataset/test/y_test.txt'))


subject <- rbind(read.table(file = 'UCI HAR Dataset/train/subject_train.txt'),
                 read.table(file = 'UCI HAR Dataset/test/subject_test.txt'))


# Selecting only the measurements on the mean and standard deviation for each measurement. 
selected <- features$ID[grepl('std()',features$Name,fixed = TRUE) | grepl('mean()',features$Name,fixed = TRUE)]

# Using descriptive activity names
names(y) <- 'Act.ID'
y <- merge(x = activity, y = y,by.x = 'ID', by.y = 'Act.ID',all.x = TRUE)
names(y)[2] <- 'Activity'

# Appropriately label data
names(X) <- features$Name
names(subject) <- 'Case.ID'

# Creating one dataset of subject, y and X
dataset <- data.frame(subject, Activity = y$Activity, X[,selected])


# Creating a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
averaged <- aggregate(formula = . ~ Case.ID + Activity, FUN = mean,
                        simplify = TRUE, data = dataset)

write.table(x = averaged,file = 'step5.txt',row.name = FALSE,quote = FALSE)
