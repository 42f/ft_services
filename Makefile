all:
	./setup.sh

clean:
	./cleanup.sh

fclean:
	./cleanup.sh
	sudo rm -rf /tmp/k8s_pvc
	docker rmi $(docker image ls -q --filter label=project=ft_service)
