#!/bin/bash

read -p 'Enter the username to add: ' user_name
read -p 'Enter the group to add: ' group_name

echo "following command will be executed=> useradd -g $group_name $user_name"