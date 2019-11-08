#!/bin/bash

#function func_name() {}

SAMPLE() {
    echo You are inside the function
}

SAMPLE1 (){
    echo First Argument = $1
}

SAMPLE
SAMPLE1 abc