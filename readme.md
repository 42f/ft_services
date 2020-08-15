GET IP OF CONTAINER

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -n1 -qf ancestor=ft_service/ftps)

automate ftps connection by getting external ip

lftp -u 42,42 $(kubectl get services ftps --output jsonpath='{.status.loadBalancer.ingress[0].ip}') -p 21


=============

⚠️
⚠️		change in Nginx : 128 -> 2048 !!
		volumes in deployments files
⚠️

==============

CHECKLIST PROJECT :


> SCRIPTS

‼️	move username and password input in go.sh instead of build
⚠️	make a cleanup script to delete permanent volumes's data


▸Nginx/
⚠️	change 128 -> 2048 !!
✅	https redirection
✅	SSH connectivity ?
✅	telegraph

▸FTPS/
✅	ftps
✅	telegraph

▸Grafana/
⚠️	password from script
⚠️	add all pods dashboard (missing half of them now)

▸InfluxDB/


▸LoadBalancer/


▸MySQL/
❓	See if removing -uroot and -pfoobar still work
⚠️	User k8s secret to set user and password
⚠️	Make sure data is peristant !!!

▸PhpMyAdmin/


▸WordPress/

