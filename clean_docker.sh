# !/bin/sh

docker rmi --force $(docker images --quiet --filter "label=project=ft_service")
echo -e Y | docker system prune
