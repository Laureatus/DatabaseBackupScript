#!/bin/bash
source ../backupconfig.conf

echo "Upload dump file of $SRC_DB to $HOST:$PORT/$TRG_DB" 2>&1 >> $LOG_PATH
mysql --host=$HOST --port=$PORT --user=$USER_NAME --password=$PASSWORD $TRG_DB < $BACKUP_DIR
