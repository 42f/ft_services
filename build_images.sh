#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
DARK='\033[1;93m'
RESET='\033[0m'

up (){
	docker images $1 | grep $1 > /dev/null
}

builder () {
	printf "${GREEN}BUILDING:	$1		${DARK}\n"
	docker build -t $1 $2 | while read i; do echo -en "${DARK}\033[2K\r$i"; done
	printf "\n${GREEN}[OK]${RESET}\n"
}

builder ft_service_alpine srcs/base_image
builder ft_service/nginx srcs/Nginx 
builder ft_service/ftps srcs/FTPS/
builder ft_service/influxdb srcs/InfluxDB
builder ft_service/grafana srcs/Grafana
builder ft_service/wordpress srcs/WordPress
builder ft_service/mysql srcs/MySQL
builder ft_service/phpmyadmin srcs/PhpMyAdmin

