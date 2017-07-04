#!/usr/bin/env bash

# Gets the last successful build numbers from the master branch

curl -s https://circleci.com/api/v1.1/project/github/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME?circle-token=$CIRCLE_API_TOKEN |\
jq '[.[] | select((.status=="success" or .status=="fixed") and .branch=="master")] | max_by(.build_num).build_num'
