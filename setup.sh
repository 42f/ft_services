# !/bin/bash


./start_minikube.sh
./srcs/LoadBalancer/deploy_metallb.sh
./build_images.sh
./go.sh
