# Coursera Getting and Cleaning Data Course Project

## Files
- `run_analysis.R` : Script doing the analyzis
- `tidy.txt` : Result geerated by cript
- `CodeBook.md` : File with detailed data description

## Description

`run_analysis.R` scripts creates final dataset `tidy.txt`. Final dataset was created by joining train and test datasets together. From X_ files only mean and standard deviation mesures were selected. New columns subject (based on joined subject_ files) and activity (based on joined y_ files) were added. Activity column labels were changes based on activity_labels.txt file. Column names were changed based on features.txt. Final dataset contains summarization averages of each variable for each activity and each subject.


