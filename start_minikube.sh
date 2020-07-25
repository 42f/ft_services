#!/bin/bash

minikube status | grep Running

if [ $? -ne 0 ]
then
	minikube start --driver=docker
fi

eval $(minikube -p minikube docker-env)

./srcs/LoadBalancer/deploy_metallb.sh

#to be activated at the end
#minikube dashboard --url

