#!/bin/bash
DATE=$(date +%d-%m)
PAST_DAY=`/bin/date -d '7 days ago' +%d-%m`
CONTAINER_NAME='mongo'
BACKUP_DIR=/home/shahrukh/Documents/dumps
#read -p "Enter container id to create backup: " id
docker exec $CONTAINER_NAME mongodump --db wagmi --out /backups/wagmi-stag-$DATE-dump
docker cp $CONTAINER_NAME:/backups/wagmi-stag-$DATE-dump  $BACKUP_DIR
cd $BACKUP_DIR && tar czfv wagmi-stag-$DATE-dump.tar.gz ./wagmi-stag-$DATE-dump/wagmi
#rm -rf ./dumps
rm wagmi-stag-$PAST_DAY-dump.tar.gz
