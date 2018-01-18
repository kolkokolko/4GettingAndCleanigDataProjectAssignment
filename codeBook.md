
# Variables

There are 563 variables.
1. subject - num (1:30)
2. activity - string ("WALKING"; "WALKING_UPSTAIRS"; "WALKING_DOWNSTAIRS"; "SITTING"; "STANDING"; "LAYING")
3. The rest of the variables from 3-563 are the same used in the *features.txt* file.


# Variable Names Modification

Variable names from the features.txt file have been modified with the following R command:
* ```varNames <- gsub("[^A-Za-z|0-9]","",x=vars$V2)```<br />
which substitutes everything that is not a number nor letter with an empty space.

## Example of Variable Modification

Before|After
------|------
tBodyAcc-mean()-X|tBodyAccmeanX
tBodyAcc-mean()-Y|tBodyAccmeanY 
tBodyAcc-mean()-Z|tBodyAccmeanZ

# Steps performed to manipulate the data

1. Read all input data files.
2. Manipulate the variable names as stated in the chapter above.
3. Combine the train and test data and adding the columns for the "subject" and "activity".
4. Add column names to the data frame.
5. Extract only the columns which contain "mean" or "std" data.
6. Change the activity type from numbers to description.
7. Convert the data frame to a dplyr format.
8. Create a new data frame with an average for every column based on subject and activity type.
