# !/bin/bash

# Start our one node Kubernetes 
#minikube start --driver=docker

eval $(minikube -p minikube docker-env)
docker build -t bv/nginx srcs

# Deploy Metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# Deploy Metallb configuration
kubectl apply -f srcs/metallb_config.yaml

kubectl apply -f srcs/ftservice_nginx.yml
kubectl expose deployment nginx-deployment --type=LoadBalancer --port=80

kubectl create deployment web --image=gcr.io/google-samples/hello-app:1.0
kubectl expose deployment web --type=LoadBalancer --port=8080

curl $(minikube service web --url)
curl $(minikube service nginx-deployment --url)
















#to be activated at the end
#minikube dashboard --url
