#!/bin/bash
VALUES="val1 val2 val3"

for var in $VALUES ; do
 echo $var
 sleep 1
done

i=20

while[ $i gt 0 ]; do
date
sleep 2
i=$(($i-2))
done