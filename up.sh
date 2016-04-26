#!/bin/sh
source /etc/profile
WORK_PATH=/home/rtt/chenl/cpumem/
TIME_DATE=`date '+%Y%m%d'`
IP_AD=`ifconfig | sed -n '2p' | awk -F '[ :]+' '{print $4}'`
FILE_NAME=${IP_AD}_${TIME_DATE}.tar.gz
LOG_NAME=${IP_AD}_${TIME_DATE}.csv

cd $WORK_PATH
mv out.csv $LOG_NAME
tar -czf $FILE_NAME $LOG_NAME
mv $FILE_NAME ${WORK_PATH}/bak

rm $LOG_NAME

cd ${WORK_PATH}/bak

ftp -n 172.20.2.66 <<EOF
user rtt RTT_1q2w
binary
cd chenl/cpumem_total
put $FILE_NAME
EOF
