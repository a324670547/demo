#!/bin/bash
#设置java环境
APP_NAME=hello
JAVA_HOME=/usr/local/jdk
LSOF_HOME=/usr/sbin/
APP=`ps -ef | grep java| grep $APP_NAME.jar`
echo $APP
#======关闭上次启动的 jar==========
#设置关闭的端口
port=9001
#获取此端口运行的进程
pid=`$LSOF_HOME/lsof -t -i:$port `
#判断如果进程号不为空则关闭进程
#if $APP -z "$pid";then
if [ $APP_NAME -gt 0 ]; then
   echo "$APP_NAME 工程未启动！"
else
  kill -9 $pid
  echo "$APP_NAME 工程进程$pid 关闭成功！"
fi
#======启动新的 jar==========
#设置工程路径
project_path=/apps
cd $project_path
#nohup后台启动，输出日志到hello.log
nohup $JAVA_HOME/jre/bin/java -jar $APP_NAME.jar >$APP_NAME.log &
#打印日志
sleep 10
tail $APP_NAME.log

