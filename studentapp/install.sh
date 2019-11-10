#!/bin/bash

## Purpose : Setup student application with web + app + db components
## Project : STudentApp Monolithic
## Author  : Copied

##Description: This script installs and configures all web, app and db components 

## Global Variables
LOG=/tmp/student.log
rm -f $LOG
G="\e[32m"
R="\e[31m"
N="\e[0m"

## Functions
Head() {
 echo -e "\n\t\t\t\e[1;35m $1 \e[0m\n"
}

Print(){
 echo -e -n "  $1\t\t "
}

STAT_CHECK(){
 if [ $1 -eq 0 ]; then
  echo -e " - ${G}SUCCESS${N}"
 else
  echo -e " - ${R}FAILURE${N}"
  exit 1
 fi
}

## Main Program
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
 echo -e "You should be root user to proceed!"
 exit 1
fi

Head "WEB SERVER SETUP"
Print "Install Web Server\t"
yum install nginx -y &>>$LOG
STAT_CHECK $?

Print "Clean old index files\t"
rm -rf /usr/share/nginx/html/* &>>LOG
STAT_CHECK $?

cd /usr/share/nginx/html/

Print "Download Index files\t"
curl -s https://studentapi-cit.s3-us-west-2.amazonaws.com/studentapp-frontend.tar.gz | tar -xz 
STAT_CHECK $?

Print "Update nginx proxy config"
LINE_NO=$(cat -n /etc/nginx/nginx.conf | grep 'error_page 404' | grep -v '#' | awk '{print$1}')
 sed -i -e "/^#STARTPROXYCONFIG/,/^#STOPPROXYCONFIG/ d" /etc/nginx/nginx.conf;
 sed -i -e "$LINE_NO i #STARTPROXYCONFIG\n\tlocation /student {\n\t\tproxy_pass http://localhost:8080/student;\n\t}\n#STOPPROXYCONFIG" /etc/nginx/nginx.conf
STAT_CHECK $?

Print "Starting Nginx Service"
systemctl enable nginx &>>$LOG
systemctl start nginx &>>$LOG
STAT_CHECK $?

