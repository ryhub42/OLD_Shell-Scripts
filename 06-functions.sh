#!/bin/bash

#function func_name() {}

SAMPLE() {
    echo You are inside the function
}

SAMPLE1 (){
    echo First Argument = $1
}

SAMPLE2(){
    A=100
    local a=200
}

SAMPLE
SAMPLE1 abc
SAMPLE2
echo "A = $A, a = $a"

SAMPLE3(){
    echo Hai
    return
    echo Bye
}

SAMPLE3
echo exist status of SAMPLE3 = $?
