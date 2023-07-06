#!/bin/bash

source ../backupconfig.conf
mysqldump --user=$USER_NAME --password=$PASSWORD $SRC_DB > $BACKUP_DIR/$DATE-$SRC_DB.sql

file=$BACKUP_DIR/$DATE-$SRC_DB.sql
if test -f "$file"; then
    echo "Dump $DATE-$SRC_DB.sql has been created succsessfully."
else
    echo "ERROR Dump $DATE-$SRC_DB.sql has not been created."
fi