# !/bin/sh

docker kill $(docker ps -aq)
docker rmi --force $(docker images --quiet --filter "label=project=ft_service")
echo -e Y | docker system prune
echo -e Y | docker volume prune
docker system df

