kubectl delete secret user-credential
cat srcs/activ_services | xargs -I % kubectl delete -f srcs/%/deployments/deployment.yml --wait=false 
kubectl delete pods --force --grace-period=0 --namespace default --all 
