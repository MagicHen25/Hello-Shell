#!/bin/sh
source /etc/profile
IP=`ifconfig | grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sed -n '1p'`
MAIL=cl7416@126.com
cd /home/rtt/application/RTT_DAG/logs
[ `ps -ef | grep -c RTT_DAG ` -ne 2 ] && echo "${IP} RTT_DAG IS DOWN err 001" | mail -s "${IP} RTT_DAG IS DOWN" $MAIL
file=`ls -t | egrep "ssjt-info.log.[0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{2}" | sed -n '1p'`;a=`stat -c %Y $file`;b=`date +%s`; [ $[ $b - $a ] -gt 4500 ] && echo "${IP} RTT_DAG IS DOWN err 002" | mail -s "${IP} RTT_DAG IS DOWN" $MAIL
tail -500 ssjt-info.log  | grep -q '下载文件结束' ; [ $? -ne 0 ] && echo "${IP} RTT_DAG IS DOWN err 003" | mail -s "${IP} RTT_DAG IS DOWN" $MAIL
tail -500 ssjt-info.log  | grep -q '发送结束符' ; [ $? -ne 0 ] && echo "${IP} RTT_DAG IS DOWN err 004" | mail -s "${IP} RTT_DAG IS DOWN" $MAIL
[ `tail -1000 ssjt-info.log | grep -c 'Exception'` -ne 0 ] && echo "${IP} RTT_DAG IS DOWN err 004" | mail -s "${IP} RTT_DAG IS DOWN" $MAIL
