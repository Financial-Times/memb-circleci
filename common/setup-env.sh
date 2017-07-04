#!/usr/bin/env bash

echo export LAST_BUILD=\"$(common/get-last-success-build.sh)\" >> $HOME/.circlerc
echo export TEST_VERSION=\"3.0.${LAST_BUILD}\" >> $HOME/.circlerc
echo export TEST_IMAGE=\"nexus.in.ft.com:5000/membership/${SYSTEM_CODE}:${TEST_VERSION}\" >> $HOME/.circlerc

cat .npmrc | sed s/NPM_AUTH/$NPM_AUTH/g > .npmrc-new; mv .npmrc-new .npmrc
docker login -e ${NPM_EMAIL} -u ${NPM_USER} -p ${NPM_PASSWORD} nexus.in.ft.com:5000
npm install -g @financial-times/release-log

curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.6.6/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl