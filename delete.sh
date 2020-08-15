kubectl delete secret user-credential
kubectl delete service --all
kubectl delete statefulsets.apps --all

# !attention these commands remove volumes, must be used in cleaning script instead
#cat srcs/activ_services | xargs -I % kubectl delete -f srcs/%/deployments/deployment.yml
#cat srcs/activ_services | xargs -I % kubectl delete -f srcs/%/deployments/deployment.yml --wait=false 
#kubectl delete pods --force --grace-period=0 --namespace default --all 
