#!/bin/bash
P=8099
PORT=$(netstat -ntulp | grep $P)

FLAG="OK"

PIDD=$(netstat -nlp | grep -w $P | sed -r 's#.* (.*)/.*#\1#')

echo $PIDD

if [[ $FLAG == "OK" ]]; then

#强制kill一下 防止进程没退出
  echo "Closing down ..."
  sleep 3  
  kill -9 $PIDD
  
  echo "Close off success"
fi

