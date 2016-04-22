#!/bin/sh
WORK_PATH=/home/rtt/chenl/cpumem/
TIME_DATE=`date '+%Y%m%d'`
IP_AD=`ifconfig | sed -n '2p' | awk -F '[ :]+' '{print $4}'`
FILE_NAME=${IP_AD}_${TIME_DATE}.tar.gz
LOG_NAME=${IP_AD}_${TIME_DATE}.csv


mv out.csv $LOG_NAME
tar -czvf $FILE_NAME $LOG_NAME
mv $FILE_NAME ${WORK_PATH}/bak

rm $LOG_NAME
