#!/bin/bash

/bin/bash ./databaseDownload.sh
/bin/bash ./databaseRestore.sh

if [ $KEEP_DUMP_FILES == "None" ]
then
    echo "Removing dump file"
    rm $BACKUP_DIR/*
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