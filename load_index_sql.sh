#!/bin/bash
export $(cat .env | xargs)

mysql -u root --password=$MYSQL_PASSWORD --local-infile mimiciv < load.sql > load.log
mysql -u root --password=$MYSQL_PASSWORD mimiciv < index.sql > index.log
