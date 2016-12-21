#!/bin/bash
#This script adds data to table in DB.

#Database name
dbname=$1

#Table name
tbname=$2

#SQL querries
sql_use="use '${dbname}';"
sql_select="SELECT * FROM ${dbname}.${tbname};"
sql_insert="INSERT INTO ${dbname}.${tbname} (name,login,password,age)
            VALUES ('Oleg','iva','qwerty','4');"
sql_count="SELECT COUNT(*) FROM ${dbname}.${tbname};"

#Verify if input parametrs are existing
if [ ! $dbname ] || [ ! $tbname ];
    then echo "Can't add data. Enter all parameters"
         exit 1
fi

#Verify if database is valid
if ! mysql --defaults-extra-file=config.cnf -e "$sql_use" 
  then echo "Database doesn't exist"
       exit 1   
fi

#Verify is table is in DB
echo "Old table"
if ! mysql --defaults-extra-file=config.cnf -e "$sql_count"
   then echo "Table doesn't exist"
        exit 1 
fi

#Add data to table
for i in {1..10}
  do 
     mysql --defaults-extra-file=config.cnf -e "$sql_insert"
  done
echo "Table is updated"

mysql --defaults-extra-file=config.cnf -e "$sql_count"
