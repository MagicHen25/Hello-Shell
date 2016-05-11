#!/bin/sh
source /etc/profile
export LANG=en_US.UTF-8
IP=`ifconfig | grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sed -n '1p'`
MAIL="shidm@neusoft.com yan.sh@neusoft.com li_dl@neusoft.com gaowl@neusoft.com zhang_qiang.neu@neusoft.com jin-gd@neusoft.com chenl.long@neusoft.com"

LOG_FILE=/home/rtt/chenl/checkout/check.log

PATH_TMC_01=/home/rtt/application/tmc258/log
PATH_TMC_02=/home/rtt/application/tmc259/log
PATH_TMC_03=/home/rtt/application/tmc257/log

[ `ps -ef | grep java | wc -l` -ne 4 ] && echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${LOG_PATH}\n故障:有TMC服务未开启！请及时查看。" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}有TMC服务未开启！请及时查看。" >> $LOG_FILE

#/home/rtt/application/tmc/log
cd $PATH_TMC_01

file=`ls -t | sed -n '2p'`;a=`stat -c %Y $file`;b=`date +%s`; \
[ $[ $b - $a ] -gt 4500 ] && echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${PATH_TMC_01}\n故障:服务器已经超过1小时无最新日志生成，请及时查看。" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}\t日志路径:${PATH_TMC_01}\t服务器已经超过1小时无最新日志生成，请及时查看。" >> $LOG_FILE

cat tmc.log | grep 'Connection refused'; [ $? -eq 0 ] && \
echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${PATH_TMC_01}\n故障:连接网关异常" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}\t日志路径:${PATH_TMC_01}\t连接网关异常" >> $LOG_FILE


cat tmc.log | grep 'SQLRecoverableException';[ $? -eq 0 ] && \
echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${PATH_TMC_01}\n故障:数据库连接异常" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}\t日志路径:${PATH_TMC_01}\t数据库连接异常" >> $LOG_FILE

cat tmc.log | egrep 'State change|Session expired event received|maxRetries too large (999). Pinning to 29';[ $? -eq 0 ] && \
echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${PATH_TMC_01}\n故障:与Zookeeper连接异常" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}\t日志路径:${PATH_TMC_01}\t与Zookeeper连接异常" >> $LOG_FILE

#/home/rtt/application/tmc_dongguan/log
cd $PATH_TMC_02

file=`ls -t | sed -n '2p'`;a=`stat -c %Y $file`;b=`date +%s`; \
[ $[ $b - $a ] -gt 4500 ] && echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${PATH_TMC_02}\n故障:服务器已经超过1小时无最新日志生成，请及时查看。" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}\t日志路径:${PATH_TMC_02}\t服务器已经超过1小时无最新日志生成，请及时查看。" >> $LOG_FILE

cat tmc.log | grep 'Connection refused'; [ $? -eq 0 ] && \
echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${PATH_TMC_02}\n故障:连接网关异常" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}\t日志路径:${PATH_TMC_02}\t连接网关异常" >> $LOG_FILE


cat tmc.log | grep 'SQLRecoverableException';[ $? -eq 0 ] && \
echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${PATH_TMC_02}\n故障:数据库连接异常" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}\t日志路径:${PATH_TMC_02}\t数据库连接异常" >> $LOG_FILE

cat tmc.log | egrep 'State change|Session expired event received|maxRetries too large (999). Pinning to 29';[ $? -eq 0 ] && \
echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${PATH_TMC_02}\n故障:与Zookeeper连接异常" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}\t日志路径:${PATH_TMC_02}\t与Zookeeper连接异常" >> $LOG_FILE

#/home/rtt/application/tmc_foshan/log
cd $PATH_TMC_03

file=`ls -t | sed -n '2p'`;a=`stat -c %Y $file`;b=`date +%s`; \
[ $[ $b - $a ] -gt 4500 ] && echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${PATH_TMC_03}\n故障:服务器已经超过1小时无最新日志生成，请及时查看。" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}\t日志路径:${PATH_TMC_03}\t服务器已经超过1小时无最新日志生成，请及时查看。" >> $LOG_FILE

cat tmc.log | grep 'Connection refused'; [ $? -eq 0 ] && \
echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${PATH_TMC_03}\n故障:连接网关异常" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}\t日志路径:${PATH_TMC_03}\t连接网关异常" >> $LOG_FILE


cat tmc.log | grep 'SQLRecoverableException';[ $? -eq 0 ] && \
echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${PATH_TMC_03}\n故障:数据库连接异常" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}\t日志路径:${PATH_TMC_03}\t数据库连接异常" >> $LOG_FILE

cat tmc.log | egrep 'State change|Session expired event received|maxRetries too large (999). Pinning to 29';[ $? -eq 0 ] && \
echo -e "IP:${IP}\n主机名:${HOSTNAME}\n日志路径:${PATH_TMC_03}\n故障:与Zookeeper连接异常" | \
mail -s "服务器告警 IP:${IP}" $MAIL && echo -e "`date`\t IP:${IP}\t日志路径:${PATH_TMC_03}\t与Zookeeper连接异常" >> $LOG_FILE
