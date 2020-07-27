#!/bin/bash

minikube delete
minikube start --vm-driver=none
sudo chown -R user42 $HOME/.kube $HOME/.minikube
eval $(minikube -p minikube docker-env)

#to be activated at the end
#minikube dashboard --url

