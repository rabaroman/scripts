#!/bin/bash
#This script delete data from some table which is in some database.

#Database name.
dbname=$1

#Table name.
tbname=$2

#SQL querries
sql_use="use '${dbname}';"
sql_select="SELECT * FROM ${dbname}.${tbname};"
sql_count="SELECT COUNT(*) FROM ${dbname}.${tbname};"
sql_delete="DELETE FROM ${dbname}.${tbname};"

#Verify if inputs parametrs are existing.
if [ ! $dbname ] || [ ! $tbname ];
    then echo "Can't delete data. Enter all parameters"
         exit 1
fi

#Verify if database name is valid.
if ! mysql --defaults-extra-file=config.cnf -e "$sql_use"
  then echo "Database doesn't exist"
       exit 1
fi

#Verify if table with such name is in DB.
if ! mysql --defaults-extra-file=config.cnf -e "$sql_select"
   then echo "Table doesn't exist"
        exit 1
   else if [ $(mysql --defaults-extra-file=config.cnf --raw --batch -e "$sql_count" -s) == 0 ]
        then echo "Nothing to delete. The table is empty"
             exit 1
      fi
fi

#Delete data from table.
if mysql --defaults-extra-file=config.cnf -e "$sql_delete"
    then mysql --defaults-extra-file=config.cnf -e "$sql_count"
         echo "The table is empty now"
         exit 0
    else echo "Table isn't empty"
     exit 1
fi
