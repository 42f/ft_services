cat srcs/activ_services | xargs -I % kubectl delete -f srcs/%/deployments/deployment.yml  -f srcs/%/deployments/service.yml
#cat srcs/activ_services | xargs -I % kubectl delete pods --force %
