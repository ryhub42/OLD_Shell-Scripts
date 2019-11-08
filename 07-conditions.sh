#!/bin/bash

ACTION =$1

 START_FUNC(){
     echo Starting $SERVICE_NAME service
 }

STOP_FUNC(){
    echo Stopping $SERVICE_NAME service
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
echo -e \n\e[33mUsage: $0 action(start|stop|restart)
exit 1
;;
esac

