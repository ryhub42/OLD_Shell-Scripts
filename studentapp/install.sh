#!/bin/bash

## Purpose : Setup student application with web + app + db components
## Project : STudentApp Monolithic
## Author  : Copied

##Description: This script installs and configures all web, app and db components 

LOG=/tmp/student.log
rm -f $LOG

echo "WEB SERVER SETUP"
echo "Install Web Server"
yum install nginx &>$LOG
if [ $? -eq 0 ]; then
 echo " - SUCCESS"
else
 echo " - FAILURE"
 exit 1
fi
