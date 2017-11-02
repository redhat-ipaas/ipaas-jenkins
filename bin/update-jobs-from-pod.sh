#!/bin/bash

POD=$1

JENKINS_HOME=$PWD

if [ ! -d $JENKINS_HOME/configuration/jobs ] && [ -d $JENKINS_HOME/../configuration/jobs ]; then
    JENKINS_HOME=$PWD/..
fi


for f in `kubectl exec $POD ls /var/lib/jenkins/jobs`; do

    if [ ! -d $JENKINS_HOME/configuration/jobs/$f ]; then
        mkdir $JENKINS_HOME/configuration/jobs/$f
    fi
    kubectl cp $POD:/var/lib/jenkins/jobs/$f/config.xml $JENKINS_HOME/configuration/jobs/$f/config.xml;
done

