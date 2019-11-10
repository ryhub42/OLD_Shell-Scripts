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
 echo -e "\n\t\t\t\e[35m $1 \e[0m\n"

}

echo "WEB SERVER SETUP"
echo -n "Install Web Server"
yum install nginx &>$LOG
if [ $? -eq 0 ]; then
 echo " - SUCCESS"
else
 echo " - FAILURE"
 exit 1
fi