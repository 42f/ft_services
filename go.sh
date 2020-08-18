#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
DARK='\033[1;93m'
RESET='\033[0m'

echo -e "\n\n${GREEN}Please set credentials for user accounts inside containers:\n(hint: pick something easy for evaluation purposes${RESET}"
printf "User name: "
read USER_NAME
stty -echo
printf "Password: "
read USER_PASS
#stty echo
echo -e "\nThanks !\n"

kubectl describe secrets | grep user-credential
if [ $? -eq 0 ]; then
	kubectl delete secret user-credential
fi

kubectl create secret generic user-credential --from-literal=pass=$USER_PASS --from-literal=name=$USER_NAME

echo -e "\n\n${GREEN}Deploying pods and services...${RESET}\n\n"

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
	if [[ "$2" == *"https"*  ]]; then
		printf "☝️ use curl --insecure to check\n"
		minikube service $2 --url --https=true
	elif [[ "$2" == *"ftps"*  ]]; then
		printf "☝️ [set ssl:verify-certificate false] in lftprc given the ftps fact container uses a selfsigned certificate\n"
		printf "☝️ lftp -u $USER_NAME,[PASSWORD] [ADDRESS]\n"
		minikube service $2 --url | head -1
	elif [[ "$2" == *"ssh"*  ]]; then
		printf "☝️ ssh $USER_NAME@[IP] -p [PORT]\n"
		minikube service $2 --url --https=false
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


printf "${GREEN}For evaluation, start by going on nginx webpagge : 192.168.99.100 and access all other web based services${RESET}\n"
show_address "Nginx" nginx
show_address "Nginx-https" nginx-https
show_address "Nginx-ssh" nginx-ssh
show_address "Dashboard" grafana
show_address "WordPress" wordpress
show_address "PhpMyADMIN" phpmyadmin
show_address "FTPS" ftps


