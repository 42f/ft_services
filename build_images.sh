#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
DARK='\033[1;93m'
RESET='\033[0m'

#eval $(minikube -p minikube docker-env)
#echo -e "${GREEN}Please set a password for services users:${RESET}"
#stty -echo
#printf "Password: "
#read USER_PASS
##stty echo
#printf "\n"
#echo "Thanks !"
#export USER_PASS=$USER_PASS



create_volume () {
	docker volume ls --quiet --filter name=$1 | grep $1
	if [ $? -ne 0 ]
		then
			printf "‼️⚡️ ${RED} Volume $1 missing, creating it...\n${RESET}"
			docker volume create --name $1 --label project=ft_service --label service=$2
		else
			printf "👌 ${GREEN} Volume $1 fund, skiping creation...\n${RESET}"
	fi
}

create_volume mysql-db mysql
create_volume influxdb-influx influxdb
create_volume influxdb-db influxdb
create_volume ftps-data ftps

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

