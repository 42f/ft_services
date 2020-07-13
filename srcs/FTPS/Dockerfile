FROM alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

#ARG USER_PASS
LABEL project=ft_service
LABEL service=ftps

#PORTS
EXPOSE 21

# INSTALL ALL PACKAGED
RUN apk update \
&& apk upgrade\
&& apk add vim supervisor openssl vsftpd

# CONF FILES
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./start.sh /bin/start.sh

# KILL.SH: shuts down supervisor if any process managed by it happen to fail
COPY ./kill.sh /bin/kill.sh
COPY ./supervisord.conf /etc/supervisord.conf

RUN mkdir /home/ftp && touch /home/ftp/Hello_from_ftp.txt		\
&& chmod 700 /bin/start.sh /bin/kill.sh							\
&& mkdir -p /etc/ssl/private/									\
&& openssl req -x509 -subj "/C=FR/ST=PARIS/L=Paris/O=42_Corp/OU=bvalette/CN=bvalette@student.42.fr"			\
-nodes -days 7300 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem		\
&& chmod 600 /etc/ssl/private/vsftpd.pem

CMD ["./bin/start.sh"]
