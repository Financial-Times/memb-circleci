#!/usr/bin/env bash

cat .npmrc-template | sed s/NPM_AUTH/$NPM_AUTH/g > .npmrc-new; mv .npmrc-new .npmrc
docker login -e ${NPM_EMAIL} -u ${NPM_USER} -p ${NPM_PASSWORD} nexus.in.ft.com:5000
npm install -g @financial-times/release-log

curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.6.6/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl