#!/usr/bin/env bash

while getopts s:e: option
do
 case "${option}"
 in
 s) SYSTEM_CODE=${OPTARG};;
 e) ENV=${OPTARG};;
 esac
done

testsUrl="https://${SYSTEM_CODE}-${ENV}.memb.ft.com/__health"

echo "Allowing 60s for application to start"
echo "url: $testsUrl"

for loop in 1 2 3 4 5 6 7 8 9 0; do


  result=$(curl -s -o /dev/null -w "%{http_code}" ${testsUrl})
  echo "RESULT=$result"
  if [ 200 -eq ${result} ]
  then
    echo "***** SUCCESSFUL *****"
    exit 0
  else
    sleep 15
  fi
done
echo "!!!!! FAILED !!!!!"
exit 1