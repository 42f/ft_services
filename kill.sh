printf "Killing... "
docker kill $(docker ps --filter label=service=$1 -n 1 -q)
