#!/bin/bash
env=$1
if [ ! -n "$1" ];then
env=default 
fi
nohup java -jar -server -Xms256m -Xmx1g -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=256m -XX:NewRatio=3 -XX:+UseConcMarkSweepGC -XX:ErrorFile=./hs_errp.log -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=./heap_dump_errp.hprof -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Xloggc:./gc.log -Dloader.path=.,3rd-lib weixin-popular-2.8.24-classes.jar --spring.profiles.active=$env&

tail -f nohup.out
