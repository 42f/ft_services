#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
DARK='\033[1;93m'
RESET='\033[0m'

eval $(minikube -p minikube docker-env)
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

docker build -t ft_service_alpine srcs/base_image

docker build -t ft_service/nginx srcs/Nginx
docker build -t ft_service/ftps srcs/FTPS/
docker build -t ft_service/influxdb srcs/InfluxDB
docker build -t ft_service/grafana srcs/Grafana
docker build -t ft_service/wordpress srcs/WordPress
docker build -t ft_service/mysql srcs/MySQL

#docker build -t ft_service/phpmyadmin srcs/PhpMyAdmin

#docker run -it ft_service/nginx
#docker run -d --rm -it --name ftps -v ftps_data:/mnt/ftps_data -e USER_PASS_VAL=$USER_PASS ft_service/ftps
#docker run -d --rm -it --name influxdb -v influxdb_db:/mnt/db -v influxdb_influx:/mnt/influx ft_service/influxdb
#docker run  --rm -it --name grafana ft_service/grafana sh

