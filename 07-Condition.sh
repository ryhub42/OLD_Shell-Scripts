#!/bin/bash

ACTION=$1
SERVICE_NAME=DEMO

START_FUNC() {
  echo "Starting $SERVICE_NAME Service"
}

STOP_FUNC() {
 echo "Stopping $SERVICE_NAME Service"
}

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
 echo -e "\n\e[33mUsage: $0 action(start|stop|restart)"
 exit 1
 ;;
 esac

 if [ "$ACTION" = "start" ]; then
  START_FUNC
elif [ "$ACTION" = "stop" ]; then
  STOP_FUNC
elif [ "$ACTION" = "restart" ]; then
  STOP_FUNC
  START_FUNC
else
  USAGE
fi
