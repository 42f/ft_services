if [ -z $1 ]; then
printf "‼️ Usage: kill.sh [container service label name]\n"
else
printf "Killing... "
docker kill $(docker ps --filter label=service=$1 -n 1 -q)
fi
