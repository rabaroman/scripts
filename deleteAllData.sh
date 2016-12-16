#!/bin/bash
dbname=$1
tbname=$2
username=lv207
if [ -z $dbname ] || [ -z $tbname ];
    then echo "Can't delete data. Enter all parameters"
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

if mysql -u $username --password=$PASS -e "use ${dbname};
    DELETE FROM ${tbname};"
   then echo "Table is empty now"
        mysql -u $username --password=$PASS -e "use ${dbname};
        SELECT COUNT(*) FROM ${tbname};"
        exit 0
else echo "Table isn't empty"
     exit 1
fi
