#!/bin/bash
path=$1
if [ -z $path ];
    then echo "Enter path"
         exit 1
else if cd $path;
     then  find . -type d -empty -delete
           echo "All folders are removed"
     else echo "Can't remove folders. Enter valid path"
          exit 1
     fi
fi
