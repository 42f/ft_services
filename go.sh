#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
DARK='\033[1;93m'
RESET='\033[0m'

echo -e "${RED}Deploying pods and services...${RESET}"

up (){
	kubectl get pods --ignore-not-found --field-selector status.phase=Running | grep $1 | grep Running
}

launch () {
kubectl apply -f srcs/$1/deployments/deployment.yml  -f srcs/$1/deployments/service.yml
until up $2
do	
	echo -e "${DARK}Waitin for $1${RESET}"
	sleep 0.4
done
}

launch "InfluxDB" "influxdb-0" 
launch "Nginx" "nginx-0" 
launch "FTPS" "ftps-0" 
launch "Grafana" "grafana-0" 
echo -e "${GREEN}ALL SET, here is the dashboard address :${RESET}"
minikube service grafana --url
