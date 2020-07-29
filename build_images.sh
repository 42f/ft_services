#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
DARK='\033[1;93m'
RESET='\033[0m'




up (){
	docker images $1 | grep $1
}

builder () {
	printf "\n\n${GREEN}BUILDING $1 ${DARK}\n"
	docker build -t $1 $2 
	printf "${RESET}"
#	until up $1 $2
#	do	
#		printf "${DARK}.${RESET}"
#		sleep 0.4
#	done
}

builder ft_service_alpine srcs/base_image
builder ft_service/nginx srcs/Nginx 
builder ft_service/ftps srcs/FTPS/
builder ft_service/influxdb srcs/InfluxDB
builder ft_service/grafana srcs/Grafana
builder ft_service/wordpress srcs/WordPress
builder ft_service/mysql srcs/MySQL


#docker build --quiet -t ft_service/nginx srcs/Nginx
#docker build --quiet -t ft_service/ftps srcs/FTPS/
#docker build --quiet -t ft_service/influxdb srcs/InfluxDB
#docker build --quiet -t ft_service/grafana srcs/Grafana
#docker build --quiet -t ft_service/wordpress srcs/WordPress
#docker build --quiet -t ft_service/mysql srcs/MySQL

#docker build -t ft_service/phpmyadmin srcs/PhpMyAdmin

#docker run -it ft_service/nginx
#docker run -d --rm -it --name ftps -v ftps_data:/mnt/ftps_data -e USER_PASS_VAL=$USER_PASS ft_service/ftps
#docker run -d --rm -it --name influxdb -v influxdb_db:/mnt/db -v influxdb_influx:/mnt/influx ft_service/influxdb
#docker run  --rm -it --name grafana ft_service/grafana sh

