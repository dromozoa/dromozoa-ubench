#! /bin/sh -e

i=0
while test $i -lt 100
do
  i=`expr $i + 1`
  ./tarai 14 7 0 | tee -a tarai.txt
  sleep 1
done
