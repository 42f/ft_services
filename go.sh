#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
DARK='\033[1;93m'
RESET='\033[0m'

echo -e "${GREEN}Please set credentials for user accounts inside containers:${RESET}"
printf "User name: "
read USER_NAME
stty -echo
printf "Password: "
read USER_PASS
#stty echo
printf "\n"
echo "Thanks !"

kubectl delete secret user-credential
kubectl create secret generic user-credential --from-literal=pass=$USER_PASS --from-literal=name=$USER_NAME

echo -e "${RED}Deploying pods and services...${RESET}"

up (){
	kubectl get pods --ignore-not-found --field-selector status.phase=Running | grep -i $1 | grep Running
}

launch () {
	kubectl apply -f srcs/$1/deployments/deployment.yml 
	printf "${DARK}Waitin for $1${RESET}\n"
	until up $1
	do	
		printf "${DARK}.${RESET}"
		sleep 0.4
	done
}

show_address () {
	printf "\n\n${GREEN}--> ${RED}$1${RESET}${GREEN} address:${RESET}\n"
	if [[ "$2" == *"443"*  ]]; then
		printf "☝️ use curl --insecure to check\n"
		minikube service $2 --url --https=true
	elif [[ "$2" == *"ftps"*  ]]; then
		printf "☝️ [set ssl:verify-certificate false] in ~/.lftprc given the ftps container uses a selfsigned certificate\n"
		printf "☝️ lftp -u ftp42 [ADDRESS]\n"
		minikube service $2 --url | head -1
	elif [[ "$2" == *"ssh"*  ]]; then
		printf "☝️ ssh ssh42@[IP] -p [PORT]\n"
		minikube service $2 --url --https=true
	else
		minikube service $2 --url --https=false
	fi
}

services=(`cat srcs/activ_services`)

for t in "${services[@]}"
do
launch $t
done

printf "\n\n${GREEN}ALL SET${RESET}\n"

show_address Dashboard grafana
show_address "FTPS" ftps
show_address "Nginx" nginx
show_address "WordPress" wordpress
show_address "MySQL" mysql

