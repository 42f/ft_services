cat srcs/activ_services | xargs -I % kubectl delete -f srcs/%/deployments/deployment.yml  -f srcs/%/deployments/service.yml
kubectl delete pods --force --grace-period=0 --namespace default --all
