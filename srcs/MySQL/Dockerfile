########### MYSQL IMAGE

FROM ft_service_alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

LABEL project=ft_service
LABEL service=mysql

EXPOSE 3306 

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-common mariadb-client openrc mysql-client	\
	&& mkdir -p /run/openrc && touch /run/openrc/softlevel											\ 
	&& /etc/init.d/mariadb setup				

COPY create_db.sql /tmp/
COPY config_mariadb.sh /bin/config_mariadb.sh
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN chmod 700 /bin/config_mariadb.sh && ./bin/config_mariadb.sh

#CONFIGURE PHPMYADMIN DB


# ADD SUPERVISOR CONFIG FILE
COPY supervisord.conf /etc/supervisord.conf

# DEFAULT COMMAND :
CMD ["supervisord"]
