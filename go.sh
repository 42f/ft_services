#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
DARK='\033[1;93m'
RESET='\033[0m'

echo -e "${RED}Deploying pods and services...${RESET}"

up (){
	kubectl get pods --ignore-not-found --field-selector status.phase=Running | grep -i $1 | grep Running
}

launch () {
	kubectl apply -f srcs/$1/deployments/deployment.yml  -f srcs/$1/deployments/service.yml
	printf "${DARK}Waitin for $1${RESET}\n"
	until up $1
	do	
		printf "${DARK}.${RESET}"
		sleep 0.4
	done
}

show_address () {
	printf "\n\n${GREEN}--> ${RED}$1${RESET}${GREEN} address:${RESET}\n"
	minikube service $2 --url
}

services=( `cat srcs/activ_services`)

for t in "${services[@]}"
do
launch $t
done


printf "\n\n${GREEN}ALL SET${RESET}\n"

show_address Dashboard grafana
show_address "Nginx port 80" nginx-80
show_address "Nginx port 443" nginx-443
show_address WordPress wordpress

