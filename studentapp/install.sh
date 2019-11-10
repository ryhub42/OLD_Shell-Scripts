#!/bin/bash

## Purpose : Setup student application with web + app + db components
## Project : STudentApp Monolithic
## Author  : Copied

##Description: This script installs and configures all web, app and db components 

## Global Variables
LOG=/tmp/student.log
rm -f $LOG

## Functions
Head() {
 echo -e "\n\t\t\t\e[4;1;35m $1 \e[0m\n"
}

Print(){
 echo -e "  $1 "
}

STAT_CHECK(){
 if [ $1 -eq 0 ]; then
  echo " - SUCCESS"
 else
  echo " - FAILURE"
  exit 1
 fi
}

Head "WEB SERVER SETUP"
Print "Install Web Server"
yum install nginx -y &>>$LOG
STAT_CHECK $?
