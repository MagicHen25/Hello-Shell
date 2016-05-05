#!/bin/sh
source /etc/profile
export LANG=UTF-8
IP=`ifconfig | grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sed -n '1p'`
MAIL="shidm@neusoft.com yan.sh@neusoft.com li_dl@neusoft.com gaowl@neusoft.com zhang_qiang.neu@neusoft.com jin-gd@neusoft.com chenl.long@neusoft.com yifeng@neusoft.com yangle@neusoft.com"
LOG_FILE=/home/rtt/chenl/checkout/check.log
cd /home/rtt/application/RTT_DAG/logs
[ `ps -ef | grep -c RTT_DAG ` -ne 2 ] && echo -e "IP:${IP}\n找不到网关进程，请检查。" | mail -s "Warning IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}找不到网关进程，请检查。" >> $LOG_FILE
file=`ls -t | egrep "ssjt-info.log.[0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{2}" | sed -n '1p'`;a=`stat -c %Y $file`;b=`date +%s`; [ $[ $b - $a ] -gt 4500 ] && echo -e "IP:${IP}\n服务器已经超过1小时无最新日志生成，请及时查看。" | mail -s "Warning IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}服务器已经超过1小时无最新日志生成，请及时查看。" >> $LOG_FILE
tail -500 ssjt-info.log  | grep -q '下载文件结束' ; [ $? -ne 0 ] && echo -e "IP:${IP}\n服务器日志后500行中无【下载文件结束】关键字_请检查" | mail -s "Warning IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}服务器日志后500行中无【下载文件结束】关键字_请检查" >> $LOG_FILE
tail -500 ssjt-info.log  | grep -q '发送结束符' ; [ $? -ne 0 ] && echo -e "IP:${IP}\n服务器日志后500行中无【发送结束符】关键字_请检查" | mail -s "Warning IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}服务器日志后500行中无【发送结束符】关键字_请检查" >> $LOG_FILE
[ `tail -1000 ssjt-info.log | grep -c 'Exception'` -gt 20 ] && echo -e "IP:${IP}\n服务器日志后1000行中【Exception】关键字超过20个_请检查" | mail -s "Warning IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}服务器日志后1000行中【Exception】关键字超过20个_请检查" >> $LOG_FILE
