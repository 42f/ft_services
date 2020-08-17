########### FTPS IMAGE

FROM ft_service_alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

#ARG USER_PASS
LABEL project=ft_service
LABEL service=ftps

#PORTS
EXPOSE 21 30000

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade && apk add vsftpd

# CONF FILES
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY start.sh /bin/start.sh

RUN chmod 700 /bin/start.sh										\
&& mkdir -p /etc/ssl/private/									\
&& openssl req -x509 -subj "/C=FR/ST=PARIS/L=Paris/O=42_Corp/OU=bvalette/CN=192.168.99.101"  				\
-nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt 	\
&& chmod 600 /etc/ssl/private/vsftpd.key

# ADD SUPERVISOR CONFIG FILE
COPY supervisord.conf /etc/supervisord.conf

VOLUME /mnt/ftps-data

CMD ["./bin/start.sh"]
