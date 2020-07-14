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

docker volume create --name influxdb_influx --label project=ft_service --label service=influxdb
docker volume create --name influxdb_db --label project=ft_service --label service=influxdb
docker volume create --name ftps_data --label project=ft_service --label service=ftps

docker build -t ft_service_alpine srcs/base_image


docker build -t ft_service/ftps srcs/FTPS/
docker run -d --rm -it -v ftps_data:/mnt/ftps_data -e USER_PASS_VAL=$USER_PASS ft_service/ftps

#docker build -t ft_service/nginx srcs/Nginx
#docker run -it ft_service/nginx

docker build -t ft_service/influxdb srcs/InfluxDB
docker run -d --rm -it -v influxdb_db:/mnt/db -v influxdb_influx:/mnt/influx ft_service/influxdb

#docker build -t ft_service/Grafana srcs/Grafana
#docker build -t ft_service/LoadBalancer srcs/LoadBalancer
#docker build -t ft_service/MySQL srcs/MySQL
#docker build -t ft_service/PhpMyAdmin srcs/PhpMyAdmin
#docker build -t ft_service/WordPress srcs/WordPress

