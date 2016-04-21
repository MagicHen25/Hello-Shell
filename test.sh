#!/bin/sh
source /etc/profile
int=1
while(( $int<=5 ))
do
        mem_total=`free -m | grep Mem: | awk '{print $2}'`
        mem_used_small=`free -m | grep - | awk '{print $3}'`
        mem_used_big=`free -m | grep Mem: | awk '{print $3}'`
        cpu_idle=`mpstat | sed -n '4p' | awk '{print $12}'`
        sleep 9
        echo -e "${mem_used_small},${mem_used_big},${mem_total},${cpu_idle}" >>/home/rtt/chenl/cpumem/out.csv
        let "int++"
done
