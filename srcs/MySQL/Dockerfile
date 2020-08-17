########### MYSQL IMAGE

FROM ft_service_alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

LABEL project=ft_service
LABEL service=mysql

EXPOSE 3306 

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade \
&& apk add --no-cache mariadb mariadb-common mariadb-client openrc mysql-client

COPY phpmyadmin.sql /tmp/
COPY wp.sql /tmp/
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY start.sh /bin
RUN chmod 700 /bin/start.sh 

RUN rm -rf /var/lib/mysql

# ADD SUPERVISOR CONFIG FILE
COPY supervisord.conf /etc/supervisord.conf

# DEFAULT COMMAND :
CMD ["./bin/start.sh"]

