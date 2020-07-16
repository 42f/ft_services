#!/bin/bash

minikube status | grep Running

if [ $? -ne 0 ]
then
	minikube start --driver=docker
fi

eval $(minikube -p minikube docker-env)

./srcs/LoadBalancer/deploy_metallb.sh


kubectl apply -f srcs/Nginx/sys_nginx_deployment.yml -f srcs/Nginx/sys_nginx_service.yml

#to be activated at the end
#minikube dashboard --url

