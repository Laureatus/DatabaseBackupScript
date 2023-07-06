#!/bin/bash
source ../backupconfig.conf
mysql --host=$mySqlHost --port=$mySqlPort --user=$userName --password=$password $trgDb < $dbDumpPath