all:
	./setup.sh

re:
	./delete.sh
	./build_images.sh
	./go.sh

clean:
	./cleanup.sh

fclean:
	./cleanup.sh
	sudo rm -rf /tmp/k8s_pvc
	minikube delete
	docker rmi --force $$(docker image ls -q --filter label=project=ft_service)
