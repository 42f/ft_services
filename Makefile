all:
	./start_minikube.sh
	./build_images.sh

f: all
	./start_deployment.sh

re_kube:
	./clean_kubectl.sh
	./build_images.sh

re_docker:
	./clean_docker.sh
	./build_images.sh

re: re_kube re_docker f

clean:
	./clean_kubectl.sh
	./clean_images.sh


