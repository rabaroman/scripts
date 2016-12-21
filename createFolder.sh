#!/bin/bash
#This script creates folder which is located by some path

#Name of folder. 1st input parametr
name=$1

#Path where folder should be located. 2nd input parametr.
path=$2

#Verify if inputs parametrs are existing.
if [ ! $name ] || [ ! $path ];
    then echo "Can't create folder. Enter all parameters"
         exit 1
#Verify if path is correct.
else if cd $path;

        #Verify if folder's name is existing.
        then if [[ ! -d $name ]];
             then if mkdir $name;
                  then echo "Folder $name is created" 
                  else echo "Can't create folder $name"
                       exit 1
                  fi
             else echo "Folder $name is already exist"
                  exit 1
             fi
     else echo "Cant create folder. Enter valid path"
          exit 1  
     fi
fi
