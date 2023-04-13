#!/bin/bash
DATE=$(date +%d-%m)
PAST_DAY=`/bin/date -d '7 days ago' +%d-%m`
CONTAINER_NAME='wagmi-mobile-dev-mongo'
BACKUP_DIR=/home/ubuntu/dumps
cd $BACKUP_DIR
docker exec -i $CONTAINER_NAME sh -c 'mongodump --archive --db=wagmi' > $BACKUP_DIR/wagmi-stag-$DATE-dump && gzip wagmi-stag-$DATE-dump && rm wagmi-stag-$DATE-dump
rm wagmi-stag-$DATE-dump wagmi-stag-$PAST_DAY-dump.gz
