#!/bin/bash

/bin/bash ./databaseDownload.sh
/bin/bash ./databaseRestore.sh
source ../backupconfig.conf

if [ "$KEEP_DUMP_FILES" = "None" ]
then
    echo "[$(date +"%HH:%MM:%SS")] Removing dump file" >> $LOG_PATH
    rm $BACKUP_DIR/* 2> >(sed "s/^/[$(date '+%HH:%MM:%SS')] /" >>$LOG_PATH )
elif [ "$KEEP_DUMP_FILES" = "All" ]
then
    echo "[$(date +"%HH:%MM:%SS")] Keeping dump file" >> $LOG_PATH
elif [ "$KEEP_DUMP_FILES" = "Last" ]
then
    cd $BACKUP_DIR 2> >(sed "s/^/[$(date '+%HH:%MM:%SS')] /" >>$LOG_PATH )
    ls -t | tail -n +2 | xargs -I {} rm {} 2> >(sed "s/^/[$(date '+%HH:%MM:%SS')] /" >>$LOG_PATH )
    echo "[$(date +"%HH:%MM:%SS")] Keeping last dump file" >> $LOG_PATH
else
    echo "[$(date +"%HH:%MM:%SS")] Invalid value for KEEP_DUMP_FILES. Please set to 'None' ,'Last' or 'All'" >> $LOG_PATH
fi
