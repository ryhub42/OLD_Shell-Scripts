#!/bin/bash

ACTION=$1
SERVICE_NAME=DEMO

 START_FUNC() {
     echo Starting $SERVICE_NAME service
 }

STOP_FUNC() {
    echo Stopping $SERVICE_NAME service
}

USAGE() {
    echo -e "\n\e[33mUsage: $0 action(Start|stop|restart)"
    exit 1
}

if [ $# -ne 1 ]; then
 echo -e "\n\e[33m Argument Missing!!\e[0m"
 USAGE
fi

case $ACTION in 
 start)
  START_FUNC
  ;; 
 stop)
  STOP_FUNC
  ;;
 restart)
  STOP_FUNC
  START_FUNC
  ;;
  *)
echo -e \n\e[33mUsage: $0 action(start|stop|restart)
exit 1
;;
esac


if ["$ACTION" = "start"]; then
  START-START_FUNC
elif ["$ACTION" = "stop"]; then
 STOP_FUNC
elif ["$ACTION" = "restart"]; then
 STOP_FUNC
 START_FUNC
else
 USAGE
fi
