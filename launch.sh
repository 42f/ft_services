# !/bin/bash

eval $(minikube -p minikube docker-env)
docker build -t ft_service/FTPS srcs/FTPS
docker build -t ft_service/Grafana srcs/Grafana
docker build -t ft_service/InfluxDB srcs/InfluxDB
docker build -t ft_service/LoadBalancer srcs/LoadBalancer
docker build -t ft_service/MySQL srcs/MySQL
docker build -t ft_service/Nginx srcs/Nginx
docker build -t ft_service/PhpMyAdmin srcs/PhpMyAdmin
docker build -t ft_service/WordPress srcs/WordPress

# Deploy Metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# Deploy Metallb configuration
kubectl apply -f srcs/LoadBalancer/metallb_config.yaml

# Nginx
kubectl apply -f srcs/Nginx/sys_nginx_deployment.yml -f srcs/Nginx/sys_nginx_service.yml
curl $(minikube service nginx-deployment --url)
















#to be activated at the end
#minikube dashboard --url

