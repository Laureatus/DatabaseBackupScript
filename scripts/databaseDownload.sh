#!/bin/bash

source ../backupconfig.conf

echo "[$(date +"%HH:%MM:%SS")] Begin creating dump file for $SRC_DB..." 2>&1 >> $LOG_PATH

mysqldump --user=$USER_NAME --password=$PASSWORD $SRC_DB > $BACKUP_DIR/$DATE-$SRC_DB.sql 2> >(sed "s/^/[$(date '+%HH:%MM:%SS')] /" >>$LOG_PATH )

file=$BACKUP_DIR/$DATE-$SRC_DB.sql
if test -f "$file"; then
    echo "[$(date +"%HH:%MM:%SS")] Dump $DATE-$SRC_DB.sql has been created succsessfully." 2>&1 >> $LOG_PATH
else
    echo "[$(date +"%HH:%MM:%SS")] ERROR Dump $DATE-$SRC_DB.sql has not been created." 2>&1 >> $LOG_PATH
fi

