#!/bin/bash
JENKINS_PREFIX=jenkins-master
[ -n "${1}" ] && JENKINS_PREFIX=${1}
echo "INFO: Create Agent Pods"
kubectl apply -f deploy.yaml
echo "INFO: Create ${JENKINS_PREFIX}-1"
helm install --name ${JENKINS_PREFIX}-1 -f jenkins-master.yaml --set master.servicePort=1905 stable/jenkins
echo "INFO: Create ${JENKINS_PREFIX}-2"
helm install --name ${JENKINS_PREFIX}-2 -f jenkins-master.yaml --set master.servicePort=2001 stable/jenkins
echo "INFO: Install stable/nginx-ingress"
helm install stable/nginx-ingress  --name="nginx-ingress"
echo "INFO: Show releases"
helm list
