#!/bin/bash

# start on a clean setup
minikube delete

#replace chown command
export CHANGE_MINIKUBE_NONE_USER=true

# launch minikube
sudo minikube start --driver=none
sudo chown -R user42 $HOME/.kube $HOME/.minikube

# deploy metallb Load Balancer
./srcs/LoadBalancer/deploy_metallb.sh

# display infos
minikube status

# build images and start deployments
./build_images.sh
./go.sh

# open dashboard and give the url
minikube dashboard --url
