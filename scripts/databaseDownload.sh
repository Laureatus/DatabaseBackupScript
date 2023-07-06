#!/bin/bash

source ../backupconfig.conf
mysqldump --user=$USER_NAME --password=$PASSWORD $SRC_DB > $BACKUP_DIR/$DATE-$SRC_DB.sql

file=$BACKUP_DIR/$DATE-$SRC_DB.sql
if test -f "$file"; then
    echo "Dump $DATE-$SRC_DB.sql has been created succsessfully."
else
    echo "ERROR Dump $DATE-$SRC_DB.sql has not been created."
fi

if [ $KEEP_DUMP_FILES == "None" ]
then
    echo "Removing dump file"
    rm $BACKUP_DIR/$SRC_DB.sql
elif [ $KEEP_DUMP_FILES == "All" ]
then
    echo "Keeping dump file"
elif [ $KEEP_DUMP_FILES == "Last" ]
then
    cd $BACKUP_DIR
    ls -t | tail -n +2 | xargs -I {} rm {}
    echo "Keeping last dump file"
else
    echo "Invalid value for KEEP_DUMP_FILES. Please set to 'None' ,'Last' or 'All'"    
fi