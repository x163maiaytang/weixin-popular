#!/bin/bash
P=8080
PORT=$(netstat -ntulp | grep $P)

FLAG=""
PIDD=""
RETT=""
# 如果PORT不为空说明有程序占用该端口号
if [[ -n $PORT ]]; then


  	PIDD=$(netstat -nlp | grep -w $P | sed -r 's#.* (.*)/.*#\1#')
        echo $PIDD


        echo "The server is open, ready to close"
        RESULT=""
	
        while [[ $RESULT == "" || $RETT == "" ]]; do
                echo "Closing down ..."
                # 优雅关闭springboot项目
                RESULT=$(curl -X POST 127.0.0.1:$P/actuator/shutdown)


		RETT=$(echo $RESULT | grep "bye")
                sleep 2
        done

   FLAG="OK"
fi

     PORT=$(netstat -ntulp | grep $P)
while [[ -n $PORT ]]; do
     echo "Closing down ..."
     sleep 2
     PORT=$(netstat -ntulp | grep $P)
done


if [[ $FLAG == "OK" ]]; then

#强制kill一下 防止进程没退出
  echo "Closing down ..."
  sleep 3  
  kill -9 $PIDD
  
  echo "Close off success"
fi

