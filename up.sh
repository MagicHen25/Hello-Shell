#!/bin/sh
path=/home/rtt/chenl/

host_ip=`ifconfig | sed -n '20p' | awk -F '[ :]+' '{print $4}'`
file_name=${host_ip}.tar.gz
tar -czvf $file_name *

cp $file_name 
