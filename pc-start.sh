#!/bin/bash

ACTION=$1
USER_NAME=petclinic
START_ORDER="config-server discovery-server api-gateway vets-service visits-service customers-service"
STOP_ORDER="customers-service visits-service vets-service api-gateway discovery-server config-server"

##Start Function
START_F() {
 for service in $START_ORDER ; do 
  echo "Starting $service Service"
  su - $USER_NAME -c "nohup java -jar /home/$USER_NAME/spring-petclinic-$service.jar &>/home/$USER_NAME/$service.log"
  &"
  sleep 1
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

