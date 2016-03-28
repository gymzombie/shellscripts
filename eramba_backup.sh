#!/bin/bash
# Simple script to back up Eramba folder and backups
# You will definitely want to use "sudo" to execute this.
# Edit sources here:

eramba_root="/var/www/html/eramba_v2/"
backup_root="/home/user/eramba_backups/"
eramba_dbname="eramba_enterprise"


# Shouldn't need to edit below here:

backup_dir="$backup_root`date +%Y%m%d`"
mkdir $backup_dir/
tar -czvf $backup_dir/eramba_v2.tar.gz $eramba_root
sleep 2
echo ; echo "Need Mysql root password here:" ; echo
mysqldump -u root -p $eramba_dbname > $backup_dir/eramba_database.sql
