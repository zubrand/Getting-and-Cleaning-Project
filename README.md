# Getting and Cleaning Project

## Downloading and unziping data
First chunk of the code is responsible from downloading our data in 'zip' format and unzip it for further work.
After unzipping data, we delete 'zip' file because we won't use it further.

## Opening txt files
Next part of code is responsible for reading txt files to R variables. First we read information about activities and features. After that we read 'train' and 'test' data and put them together. In that way we create variables 'X', 'y', 'subject'. These variables are already merged versions of X_train + X_test, y_train + y_test, subject_train + subject_test respectively. Later we will process these variables and in the end put them together in one database.

## Select measurements on mean and standart deviation
In this chunk we find indices of measurements, which contain 'mean()' or 'std()'. To find these indices we use 'features' dataframe that we read from 'features.txt' file. These indices will be later used to select certain columns from 'X'.

## Setting correct names of activities and variables
In 2 following chunks of code we put full names of activities. Names of activities we tie up to the 'y' by function 'merge'. Another part of code puts names of columns of 'X' variable from 'features' variable.

## Putting data together in one tidy dataset.
Here we put processed variable 'subject', 'y' and 'X' in one tidy dataset with appropriate names. Also, here we select only some measurement from 'X', which contain 'mean()' or 'std()'.

## Creating dataset with mean values
Here, using 'aggregate' function to group dataframe by some columns and summarize other columns. Also, that chunk of code puts our summarized dataframe into 'txt' file.
