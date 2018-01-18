
# Variables

There are 563 variables.
1. subject - num (1:30)
2. activity - string ("WALKING"; "WALKING_UPSTAIRS"; "WALKING_DOWNSTAIRS"; "SITTING"; "STANDING"; "LAYING")
3. The rest of the variables from 3-563 are the same used in the *features.txt* file.


# Variable Names Modification

Variable names from the features.txt file have been modified with the following R command:
* ```varNames <- gsub("[^A-Za-z|0-9]","",x=vars$V2)```<br />
which substitutes everything that is not a number nor letter with an empty space.

## Example

Before|After
tBodyAcc-mean()-X|tBodyAccmeanX
tBodyAcc-mean()-Y|tBodyAccmeanY 
tBodyAcc-mean()-Z|tBodyAccmeanZ
