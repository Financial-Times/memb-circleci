#!/usr/bin/env bash

while getopts s:e:v:b: option
do
 case "${option}"
 in
 s) SYSTEM_CODE=${OPTARG};;
 e) ENV=${OPTARG};;
 v) NEW_VERSION=${OPTARG};;
 b) BUILD_VERSION=${OPTARG};;
 esac
done

RAW=$(curl -s https://circleci.com/api/v1.1/project/github/Financial-Times/$SYSTEM_CODE/$BUILD_VERSION?circle-token=a627b99e01f8f36aa4d19eeddb146e592ed00398 | jq '.')

SUBJECT=$(echo "$RAW" | jq -r .all_commit_details[0].subject)
AUTHOR=$(echo "$RAW" | jq -r .all_commit_details[0].author_email)

echo "SUBJECT=$SUBJECT"
echo "AUTHOR=$AUTHOR"
echo "SYSTEM_CODE=$SYSTEM_CODE"
echo "ENV=$ENV"
echo "NEW_VERSION=$NEW_VERSION"

release-log --owner-email "$AUTHOR" --summary "$SYSTEM_CODE version $NEW_VERSION to $ENV" --description "$SUBJECT" --service "$SYSTEM_CODE" --api-key "$CR_API_KEY" --notify-channel membership