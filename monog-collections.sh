#!/bin/bash
colls=("achivements" "appsettings" "businessusers" "cardlevels" "cards" "cardupgraderequirements" "categories" "currencies" "inappropriatewords" "maps" "marketplaces" "modules" "nftscounts" "ranks" "rarecardsets" "starterpacks" "towers" "towerskins" "warchests")
for c in ${colls[@]}
do
  mongodump -d wagmi  -c $c --out /backups/stag-wagmi-dump
done
