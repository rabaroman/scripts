#!/bin/bash
path=$1
if [ ! $path ];
    then echo "Enter path"
         exit 1
else if cd $path;
     then     
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
