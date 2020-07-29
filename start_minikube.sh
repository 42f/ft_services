#!/bin/bash

minikube delete

#test to replace chown command
iexport CHANGE_MINIKUBE_NONE_USER=true

sudo minikube start --driver=none
./srcs/LoadBalancer/deploy_metallb.sh

#sudo chown -R user42 $HOME/.kube $HOME/.minikube

#to be activated at the end
#minikube dashboard --url

