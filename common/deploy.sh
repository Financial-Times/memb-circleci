#!/usr/bin/env bash

while getopts s:e:v: option
do
 case "${option}"
 in
 s) SYSTEM_CODE=${OPTARG};;
 e) ENV=${OPTARG};;
 v) NEW_VERSION=${OPTARG};;
 esac
done

echo "SYSTEM_CODE=$SYSTEM_CODE"
echo "ENV=$ENV"
echo "NEW_VERSION=$NEW_VERSION"

# switches the active context in kubeconfig to be the same as the ENV provided
sudo kubectl config use-context $SYSTEM_CODE-context --kubeconfig .circle/kubeconfig

# applies the kubernetes files in the common kubernetes folder
kubectl apply -f kubernetes/env/$SYSTEM_CODE/ --kubeconfig .circle/kubeconfig

# applies the kubernetes files in the env specific kubernetes folder
kubectl apply -f kubernetes/ --kubeconfig .circle/kubeconfig

# sets the current image to be used TODO support sidecar containers
kubectl set image deployment/SYSTEM_CODE SYSTEM_CODE=$NEW_VERSION --kubeconfig .circle/kubeconfig

# tracks the status of the deployment
kubectl rollout status deployment/SYSTEM_CODE --kubeconfig .circle/kubeconfig
