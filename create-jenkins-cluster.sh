#!/bin/bash
CURR_DIR=$(dirname ${0})
pushd $CURR_DIR

echo "INFO: Check the supported platform"
if echo $OSTYPE|grep ^darwin ; then
    echo "INFO: Platform = $(uname -a)"
else
    echo "ERROR: This script only supports MacOS Platform"
    exit 1
fi

if which helm; then
    echo "INFO: helm is located as $(which helm)"
else
    echo "INFO: Install kubernetes-helm" 
    brew install kubernetes-helm
fi

echo "INFO: Create Jenkins Cluster and NGINX"
./install.sh
echo "INFO: Waiting got 120 seconds "
sleep 120
echo "INFO: List of pods "
kubectl get pods
