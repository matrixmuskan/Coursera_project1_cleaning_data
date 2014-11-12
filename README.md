Coursera_project1_cleaning_data
===============================

Firstly we would read files associated with training set 
1.) Read the training data from X_train.txt
2.) Read the training labels 
3.) Read the subject association for training 
4.) Read the feature names of the data of the features.txt
5.) Change the columns names of data from feature.txt 
6.) Add column activity label read from the file 
7.) Add column subject label read from the file 

Repeat the same for test 

8.) rbind training and test set 
9.) Change activity label from numeric to factor
10.) Rename activity label more descriptive like walking, laying etc 
11.) Using grep command, choose the appproirate label containing exactly the word mean() and std()
12.) using aggregate function and list by subjectid and activity label, calculate mean of every columns
13.) write the data set into the table 
