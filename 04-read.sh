#!/bin/bash
#read -p 'Enter your name: ' user_name
#read -p 'How old are you?: ' user_age
read -p 'Enter your name:' user_name
read -p 'How old are you?:' user_age
#echo "following command will be executed=> useradd -g $group_name $user_name"

if [ $user_age -eq 6 ]; then
    echo -e "Hello \e[35m$user_name\e[0m, you must be in \e[31mFirst grade!\e[0m. How do you like it??"
elif [ $user_age -lt 6 ]; then
 echo -e "You must be kidding!"
else
 echo -e "what??? No way...."
 sleep 2
 echo -e "\e[33mSecond Grader!!"
fi
echo -e "\e[32mHave a lovely day $user_name\e[0m"
