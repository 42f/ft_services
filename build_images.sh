#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
DARK='\033[1;93m'
RESET='\033[0m'

up (){
	docker images $1 | grep $1 > /dev/null
}

builder () {
	printf "${DARK}BUILDING:	$1		"
	docker build -qt $1 $2 > /dev/null
	printf "${GREEN}[OK]${RESET}\n"
}

builder ft_service_alpine srcs/base_image
builder ft_service/nginx srcs/Nginx 
builder ft_service/ftps srcs/FTPS/
builder ft_service/influxdb srcs/InfluxDB
builder ft_service/grafana srcs/Grafana
builder ft_service/wordpress srcs/WordPress
builder ft_service/mysql srcs/MySQL
builder ft_service/phpmyadmin srcs/PhpMyAdmin

