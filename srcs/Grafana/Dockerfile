########### GRAFANA IMAGE

FROM ft_service_alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

#ARG USER_PASS
LABEL project=ft_service
LABEL service=grafana

#PORTS
EXPOSE 3000

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade	\
&& apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

# ADD GRAFANA CONFIG FILE
ADD grafana.ini /etc/grafana.ini

# ADD SUPERVISOR CONFIG FILE
COPY supervisord.conf /etc/supervisord.conf

CMD ["supervisord"]
