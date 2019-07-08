# k8s-jenkins

## Status Icon
* :white_check_mark: Complete
* :question: Partially done
* :x: Fail

## Checklist
1. :question: Deploy Jenkins Service
    1. :white_check_mark: 2 Jenkins Masters
    1. :x: 2 Jenkins Agents
    > Memo) \
    Do you want to  one Jenkins Site with Jenkins Masters? \
    I heard that Jenkins master has to a mounted volume for JENKINS_HOME. If each Jenkins master instance 
    exist one of different node, they have to mount shared volumues.( Don't think about its really). Also 
    Jenkins agents have a connection to only one Jenkins master node. So two Jenkins masters can't share agents 
    So If you have a scenario for one Jenkins site  consisted with multiple Jenkins master instances, 
    it's not to be possible as I think
1. :x: Add a health check Jenkins Agent
   > Memo)
   I failed it. I know that Deployment provide a healty check for Pod. Alos Pod's manifest file has a section [livenessProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/). Do you want me to use them or create an independent logic to check a healthy?
1. :question: Use Nginx as an ingress for Jenkins Master
    > Memo)
    I installed it. It rewrite a connection url to one of Jenkins Masters. I already wrote related qeuestions on Number 1
1. :white_check_mark: All the pods/services should be running in a single namespace but, not default
1. :white_check_mark: Provide a shell script which when executed brings up the whole setup mentioned in the previous points.
1. :white_check_mark: Provide another shell script which destroys all the services/pods/namespace created by previous shell script.
1. :white_check_mark: Upload the solution on a Github repository

## How to use
* Create Jenkins Cluster
```shell
$> ./create-jenkins-cluster.sh
```
* Destroy a cluster
```shell
$> ./destroy-jenkins-cluster.sh
```

## Comments
* When installing **'stable/jenkins'** app, "**master.installPlugins**" has only one plugin, **kubernetes:1.14.0**. I did it because some plugin of "**kubernetes:1.14.0,workflow-aggregator:2.6,credentials-binding:1.17,git:3.9.1,workflow-job:2.31**" showed error logs when installing it. This caused unsuccessful initialization result and Jenkins release couldn't started sometime. So I wrote a manifest file to install only one plugin to minimize time for creating it.
* This is a first experience with using Kubernetes/helm. So I have trouble to use Charts configuration for Jenkins application to apply my own Jenkins configuraions to it.  So  I have to study something more about Kubernetes's teminology and background in order to design and mange my Jenkins service with container technologies.
  Also I will make a detailed guide document about the usage of each field in configuration.

## Question

* **Do you use other container  technologies ?** I prefere to use lxc-based container environment becuase multi-thread  and highly IO-intensive jobs show poor performance and quality in Docker container.