#!/bin/bash
dbname=$1
tbname=$2
username=lv207
if [ -z $dbname ] || [ -z $tbname ];
    then echo "Can't add data. Enter all parameters"
         exit 1
fi
if ! mysql -u $username --password=$PASS -e "use ${dbname};" 
  then echo "Database doesn't exist"
       exit 1   
fi

if ! mysql -u $username --password=$PASS -e "use ${dbname};
   SELECT COUNT(*) FROM ${tbname}" 
   then echo "Table doesn't exist"
        exit 1
fi

 if  mysql -u $username --password=$PASS -e "use ${dbname}; 
       INSERT INTO ${tbname} (name,login,password,age)
       VALUES ('Stepan','iva','qwerty',51);
       INSERT INTO ${tbname} (name,login,password,age)
       VALUES ('Petro','iva','qwerty',34);
       SELECT * FROM ${tbname};"
    then echo "Data is added to the table ${tbname}"
         exit 0
else echo "Data isn't add to the table ${tbname}"
     exit 1
fi

