#!/bin/bash

## Author: MinDong Sung
## Objective: Download mimic-iv files and upload to mysql database

## 0. CONST
VER=1.0
MYSQL_USER="root"
DOCKER_CONTAINER_NAME="mysql"

## 1. read .env file
export $(cat .env | xargs)

## 2. download mimic file
wget -r -N -c -np --user $PHYSIONET_USERNAME --password $PHYSIONET_KEY https://physionet.org/files/mimiciv/"$VER"/ 

## 3. mv *.csv.gz file to parent folder
mv ./physionet.org/files/mimiciv/"$VER"/core/*.csv.gz .
mv ./physionet.org/files/mimiciv/"$VER"/hosp/*.csv.gz .
mv ./physionet.org/files/mimiciv/"$VER"/icu/*.csv.gz .
rm -r ./physionet.org

## 4. unzip files
gunzip -r .

## 5. delete extra files
rm *.html *.txt

## 6. download sql files
wget https://raw.githubusercontent.com/MIT-LCP/mimic-iv/master/buildmimic/mysql/index.sql 
wget https://raw.githubusercontent.com/MIT-LCP/mimic-iv/master/buildmimic/mysql/load.sql 

## 7. mkdir in docker root
docker exec $DOCKER_CONTAINER_NAME mkdir mimic

## 8. cp to docker mysql 
FILES=./*

for f in $FILES
do
  echo "Copying to mysql docker $f file..."
  docker cp $f $DOCKER_CONTAINER_NAME:/mimic
done

docker cp load_index.sql.sh $DOCKER_CONTAINER_NAME:/mimic
docker cp .env $DOCKER_CONTAINER_NAME:/mimic

## 9. run sql in the docker
docker exec --workdir /mimic $DOCKER_CONTAINER_NAME load_index_sql.sh
