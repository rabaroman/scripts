#!/bin/bash
name=$1
path=$2
if [ ! $name ] || [ ! $path ];
    then echo "Can't create folder. Enter all parameters"
         exit 1
else if cd $path;
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
