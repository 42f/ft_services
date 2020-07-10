#!/bin/bash

#eval $(minikube -p minikube docker-env)
echo "Hello ! Let's set a few infos first :"
stty -echo
printf "Password: "
read USER_PASS
stty echo
printf "\n"
echo "Thanks !"
export USER_PASS=$USER_PASS

docker build -t ft_service/ftps srcs/FTPS/

docker run -e USER_PASS_VAL=$USER_PASS -it ft_service/ftps



#docker build -t ft_service/nginx srcs/Nginx

#docker build -t ft_service/Grafana srcs/Grafana
#docker build -t ft_service/InfluxDB srcs/InfluxDB
#docker build -t ft_service/LoadBalancer srcs/LoadBalancer
#docker build -t ft_service/MySQL srcs/MySQL
#docker build -t ft_service/PhpMyAdmin srcs/PhpMyAdmin
#docker build -t ft_service/WordPress srcs/WordPress

