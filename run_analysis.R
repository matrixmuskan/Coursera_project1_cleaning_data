library(plyr)

#Reading the features data 
features = read.table('features.txt')

#Manuplutating the training data

train = read.table('train/X_train.txt') # Read training data 
train_labels = read.table('train/y_train.txt') # Read train labels 
subject_labels = read.table('train/subject_train.txt') # Read the labels subject 

colnames(train) = features$V2 # Renaming colnames of training data for features names 
train$activity_label = train_labels$V1 # Creating the column for activity label for training set 
train$subject_label = subject_labels$V1

#Manuplutating the test data 
test = read.table('test/X_test.txt') # Read the test data 
test_labels = read.table('test/y_test.txt') # Read the test labels 
subject_labels_test = read.table('test/subject_test.txt') # Read the subject test labels of test data set 


colnames(test) = features$V2 # Renaming column names of test data for features names 
test$activity_label = test_labels$V1 # Creating the column for activity label for test data 
test$subject_label = subject_labels_test$V1

combine = rbind(train,test) # combine the training and test data 

combine$activity_label = as.factor(combine$activity_label) # Converting the labels to factor variabls 

combine$activity_label = revalue(combine$activity_label, c("1" = "WALKING", "2" = "WALKING_UPSTAIRS", "3" = "WALKING_DOWNSTAIRS", "4" = "SITTING", "5" = "STANDING", "6" = "LAYING"))

col_means = grep('mean()',colnames(combine),fixed = T) # column index containing means() in the column names 
col_std = grep('std()',colnames(combine),fixed = T) # column index containing std() in the column names 

filtered_combine = combine[,c(col_means,col_std)] # only columns containing the col_means and col_std 
filtered_combine$activity_label = combine$activity_label
filtered_combine$subject_label = combine$subject_label

# Aggregating the data 
means_subject_activty = aggregate(filtered_combine[,1:(ncol(filtered_combine)-2)],by = list(filtered_combine$subject_label,filtered_combine$activity_label),mean)
write.table(means_subject_activty,'tidy_data_mk_course_project_submission.txt',row.names = F,sep = '\t')
