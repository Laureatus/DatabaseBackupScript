#!/bin/bash
source ../backupconfig.conf

dump_file=$(ls -t1 $BACKUP_DIR |  head -n 1)
echo "Upload dump file of $SRC_DB to $HOST:$PORT/$TRG_DB" 2>&1 >> $LOG_PATH
mysql --host=$HOST --port=$PORT --user=$USER_NAME --password=$PASSWORD $TRG_DB < $BACKUP_DIR/$dump_file
