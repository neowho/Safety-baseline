#!bin/bash
 
# 判断 ngnix进程是否启动，如果没有启动，则启动
 
# grep -v grep 是过滤掉grep nginx这个进程
# wc -l 是统计输出多少行
nginx_process_num=$(ps -ef | grep nginx | grep -v grep | wc -l)
 
if [ $nginx_process_num -eq 0 ]; then
        systemctl start nginx
fi
