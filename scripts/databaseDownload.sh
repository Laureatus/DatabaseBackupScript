#!/bin/bash

mysqldump --user=$DB_USER --password=$DB_PASS $DB_NAME > $BACKUP_DIR/$DB_NAME.sql

