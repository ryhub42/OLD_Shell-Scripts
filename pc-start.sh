#!/bin/bash

ACTION=$1

##Start Function
START_FUNC() {
    
}


## Main Program
case $ACTION in
 start)
  START_F
  ;;
 stop
  STOP_F
  ;;
 restart)
  STOP_F
  START_F
  ;;
esac