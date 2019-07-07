#!/bin/bash
JENKINS_PREFIX=jenkins-master
[ -n "${1}" ] && JENKINS_PREFIX=${1}
echo "INFO: Destory Agent Pods"
kubectl delete -f deploy.yaml
echo "INFO: Destory ${JENKINS_PREFIX}-1"
helm delete --purge ${JENKINS_PREFIX}-1
echo "INFO: Destory ${JENKINS_PREFIX}-2"
helm delete --purge ${JENKINS_PREFIX}-2
echo "INFO: Destory nginx-ingress"
helm delete --purge nginx-ingress 
