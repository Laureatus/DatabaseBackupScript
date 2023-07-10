#!/bin/bash

source ../backupconfig.conf
mysqldump --user=$USER_NAME --password=$PASSWORD $SRC_DB > $BACKUP_DIR/$DATE-$SRC_DB.sql

file=$BACKUP_DIR/$DATE-$SRC_DB.sql
if test -f "$file"; then
    echo "[$(date +"%HH:%MM:%SS")] Dump $DATE-$SRC_DB.sql has been created succsessfully." 2>&1 >> $LOG_PATH
else
    echo "[$(date +"%HH:%MM:%SS")] ERROR Dump $DATE-$SRC_DB.sql has not been created." 2>&1 >> $LOG_PATH
fi