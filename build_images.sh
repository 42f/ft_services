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

docker volume create --name mysql-db --label project=ft_service --label service=mysql
docker volume create --name influxdb-influx --label project=ft_service --label service=influxdb
docker volume create --name influxdb-db --label project=ft_service --label service=influxdb
docker volume create --name ftps-data --label project=ft_service --label service=ftps

docker build -t ft_service_alpine srcs/base_image


docker build -t ft_service/nginx srcs/Nginx
docker build -t ft_service/ftps srcs/FTPS/
docker build -t ft_service/influxdb srcs/InfluxDB
docker build -t ft_service/grafana srcs/Grafana
docker build -t ft_service/wordpress srcs/WordPress
#docker build -t ft_service/mysql srcs/MySQL
#docker build -t ft_service/phpmyadmin srcs/PhpMyAdmin

#docker run -it ft_service/nginx
#docker run -d --rm -it --name ftps -v ftps_data:/mnt/ftps_data -e USER_PASS_VAL=$USER_PASS ft_service/ftps
#docker run -d --rm -it --name influxdb -v influxdb_db:/mnt/db -v influxdb_influx:/mnt/influx ft_service/influxdb
#docker run  --rm -it --name grafana ft_service/grafana sh

