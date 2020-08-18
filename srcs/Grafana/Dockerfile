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
COPY grafana.ini /etc/grafana.ini
COPY datasources-provision.yml /usr/share/grafana/conf/provisioning/datasources/default.yml

# ADD SUPERVISOR CONFIG FILE
COPY supervisord.conf /etc/supervisord.conf

# PROVISIONING DASHBOARD BASE
COPY dashboard-provision.yml /usr/share/grafana/conf/provisioning/dashboards

COPY dashboards.tar.gz /var/lib/grafana/dashboards/
RUN cd /var/lib/grafana/dashboards && tar -xf dashboards.tar.gz

CMD ["supervisord"]

