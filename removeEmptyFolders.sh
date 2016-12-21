#!/bin/bash
#This script removes empty folders in some folder.

#Path to the folder.
path=$1

#Verify if path is entered.
if [ ! $path ];
    then echo "Enter path"
         exit 1

#Verify if path is correct.
else if cd $path;
     then     

           #Finding all empty folders in current folder.
           #And delete if such are exists.
           emptyfolders="$(find . -type d -empty)"
           if [[ $emptyfolders ]];
           then
              for var in $emptyfolders
              do 
                rmdir $var
              done
              echo "All folders are removed"
           else
               echo "Nothing to delete"
               exit 1
           fi
     else echo "Can't remove folders. Enter valid path"
          exit 1
    fi
fi
