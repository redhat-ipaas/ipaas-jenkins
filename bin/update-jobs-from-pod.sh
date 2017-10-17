#!/bin/bash

POD=$1

if [ -z "$POD" ];then
	echo "Usage: update-jobs-from-pod.sh <pod name>"
	exit -1
fi
for f in `kubectl exec $POD ls /var/lib/jenkins/jobs`;do mkdir -p configuration/jobs/$f && kubectl cp $POD:/var/lib/jenkins/jobs/$f/config.xml configuration/jobs/$f/config.xml;done
