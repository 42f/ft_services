#!/bin/bash


minikube delete

#test to replace chown command
export CHANGE_MINIKUBE_NONE_USER=true

sudo minikube start --driver=none
sudo chown -R user42 $HOME/.kube $HOME/.minikube
./srcs/LoadBalancer/deploy_metallb.sh
minikube status

#to be activated at the end
#minikube dashboard --url

