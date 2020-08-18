> PROJECT:
Ft_service is a project based on k8s in which we have to deploy multiple services: nginx, wordpress, ftps, grafana, influxdb, mysql and phpmyadmin.

> USAGE:
**On Ubuntu**, simply run 	make	 to start the deployment from minikube setup to obtaining all services IPs.
	Make clean	 will only stop deployments (i.e. force delete pods and services).

`Make fclean` will remove any configuration and persistent data.

In order to deploy only a selected list of services, you can update ./srcs/activ_services 
