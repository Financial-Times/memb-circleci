#!/usr/bin/env bash

while getopts s:e: option
do
 case "${option}"
 in
 s) SYSTEM_CODE=${OPTARG};;
 e) ENV=${OPTARG};;
 esac
done

testsUrl="https://${SYSTEM_CODE}-at-${ENV}.memb.ft.com/tests"

echo "Allowing 60s for application to start"
echo "url: $testsUrl"

for loop in 1 2 3 4 5 6 7 8 9 0; do

  result=$(curl -s ${testsUrl})
  echo $result
  if echo $result | grep -q ALL_OK
  then
    echo "***** SUCCESSFUL *****"
    exit 0
  else
    sleep 15
  fi
done
echo "!!!!! FAILED !!!!!"
exit 1