########### FTPS IMAGE

FROM ft_service_alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

#ARG USER_PASS
LABEL project=ft_service
LABEL service=ftps

#PORTS
EXPOSE 20 21 30000

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade && apk add vsftpd

# CONF FILES
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY start.sh /bin/start.sh

# ADD SUPERVISOR CONFIG FILE
COPY supervisord.conf /etc/supervisord.conf

RUN mkdir /home/ftp && touch /home/ftp/Hello_from_ftp.txt		\
&& chmod 700 /bin/start.sh										\
&& mkdir -p /etc/ssl/private/									\
&& openssl req -x509 -subj "/C=FR/ST=PARIS/L=Paris/O=42_Corp/OU=bvalette/CN=127.17.0.2"  				\
-nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt 	\
&& chmod 600 /etc/ssl/private/vsftpd.key

RUN mkdir -p /var/run/vsftpd/empty && mkdir /ftp

VOLUME /mnt/ftps-data

CMD ["./bin/start.sh"]
