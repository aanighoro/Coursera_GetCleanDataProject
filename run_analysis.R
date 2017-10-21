# Merges the training and the test sets to create one data set

setwd("D:/Coursera/DS/Course3_Data_Cleaning/Course_Project/UCI HAR Dataset/")

train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
train_sub <- read.table("train/subject_train.txt")
train <- cbind(train_sub, train_y, train_x)

test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
test_sub <- read.table("test/subject_test.txt")
test <- cbind(test_sub, test_y, test_x)

dataset <- rbind(train, test)
header <- c("subject", "activity", as.vector(read.table("features.txt")[, 2]))
colnames(dataset) <- header

# Extracts only the measurements on the mean and standard deviation for each measurement

mean_std <- dataset[, grep("subject|activity|mean\\(\\)|std\\(\\)", colnames(dataset))]

# Assigns descriptive names to activities in the data set

mean_std[, 2] <- sub("1", "WALKING", mean_std[, 2])
mean_std[, 2] <- sub("2", "WALKING_UPSTAIRS", mean_std[, 2])
mean_std[, 2] <- sub("3", "WALKING_DOWNSTAIRS", mean_std[, 2])
mean_std[, 2] <- sub("4", "SITTING", mean_std[, 2])
mean_std[, 2] <- sub("5", "STANDING", mean_std[, 2])
mean_std[, 2] <- sub("6", "LAYING", mean_std[, 2])


# Assigns descriptive variable names

colnames(mean_std) <- sub("^t", "time_", colnames(mean_std))
colnames(mean_std) <- sub("^f", "freq_", colnames(mean_std))
colnames(mean_std) <- sub("\\(\\)", "", colnames(mean_std))
colnames(mean_std) <- sub("std", "stdev", colnames(mean_std))
colnames(mean_std) <- sub("BodyBody", "Body", colnames(mean_std))

# Split data frame by subject and activity

mean_std_split <- split(x = mean_std, f = c(mean_std[1], mean_std[2])) 

# Creates an independent data set

tidy_dataset <- data.frame()

# Calculates column averages and appends them to the new data frame

for(i in seq_along(mean_std_split)) {                                         
    tidy_dataset <- rbind(tidy_dataset, colMeans(mean_std_split[[i]][,3:68])) 
}

# Add subject and activity

tidy_dataset$subject <- as.numeric(lapply(strsplit(names(mean_std_split), "\\."), function(l) l[[1]]))
tidy_dataset$activity <- as.character(lapply(strsplit(names(mean_std_split), "\\."), function(l) l[[2]]))
tidy_dataset <- cbind(tidy_dataset[, 67], tidy_dataset[, 68], tidy_dataset[, 1:66])

# Assigns names to columns adding the suffix avg to denote average

colnames(tidy_dataset) <- colnames(mean_std)
colnames(tidy_dataset)[3:68] <- paste(colnames(tidy_dataset[3:68]), "avg", sep = "_")

# Writes final data set

write.table(tidy_dataset, "final_dataset.txt", row.names = FALSE)
