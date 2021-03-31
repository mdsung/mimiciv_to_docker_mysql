# MIMIC IV to MYSQL Docker

## Pre-requisite
1. Running mysql server in docker environment: docker name - `mysql`
2. Need .env in the same folder with `main.sh`

[e.g. for .env file]
```
PHYSIONET_USERNAME=YOUR_PHYSIONET_ID
PHYSIONET_KEY=YOUR_PHYSIONET_PASSWORD
MYSQL_PASSWORD=YOUR_MYSQL_ID
```

## Process
1. read .env file
2. download mimic file
3. move *.csv.gz file to parent folder
4. unzip files
5. delete extra files
6. download sql files
7. mkdir in docker root
8. cp to docker mysql 
9. run sql in the docker

## Reference
https://github.com/MIT-LCP/mimic-iv/buildmimic/mysql
