---
output:
  word_document: default
  html_document: default
---
# Variables

There are 563 variables.
1. subject - num (1:30)
2. activity - string ("WALKING"; "WALKING_UPSTAIRS"; "WALKING_DOWNSTAIRS"; "SITTING"; "STANDING"; "LAYING")
3. The rest of the variables from 3-563 are the same used in the *features.txt* file.


#Variable Names Modification

Variable names from the _*features.txt*_ file have been modified with the following R command:
_*```varNames <- gsub("[^A-Za-z|0-9]","",x=vars$V2)```*_, which substitutes everything that is not a number nor letter with an empty space.
---
Before: "Untitled"
After: tBodyAccmeanX| tBodyAccmeanY| tBodyAccmeanZ
---

