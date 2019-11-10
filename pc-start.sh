#!/bin/bash

ACTION=$1
USER_NAME=petclinic
START_ORDER="config-server:8888 discovery-server:8761 api-gateway:8080 vets-service:8080 visits-service:8080 customers-service:8080"
STOP_ORDER="customers-service visits-service vets-service api-gateway discovery-server config-server"

START_TIMEOUT=300

##Start Function
START_F() {
 for service in $START_ORDER ; do 
  SERVICE=$(echo $service | awk -F : '{print $1}')
  PORT_NO=$(echo $service | awk -F : '{print $2}')
  echo -n "Starting $service Service"
  su - $USER_NAME -c "nohup java -jar /home/$USER_NAME/spring-petclinic-$service.jar &>/home/$USER_NAME/$service.log &"
  local i=0
   while [ $i -lt $START_TIMEOUT ]; do
   netstat -lntp | grep $PORT_NO &>/dev/null
    if [ $? -eq 0 ]; then
      echo " -STARTED"
      break
     else
      i=$(($i+15))
      if [ $i -gt $START_TIMEOUT ]; then
        echo " - FAILED"
        exit 1
      fi
      sleep 15
    fi
 done
}


## Main Program
case $ACTION in
 start)
  START_F
  ;;
 stop)
  STOP_F
  ;;
 restart)
  STOP_F
  START_F
  ;;
esac