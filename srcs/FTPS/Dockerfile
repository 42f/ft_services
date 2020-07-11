FROM alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

#ARG USER_PASS
LABEL project=ft_service
EXPOSE 21
EXPOSE 990

# INSTALL ALL PACKAGED
RUN apk update \
&& apk upgrade\
&& apk add vim supervisor lftp openssl \
pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

#RUN echo -e "$USER_PASS\n$USER_PASS" | adduser -h /tmp ftp42 

RUN addgroup _pure-ftpd
RUN adduser -D -G _pure-ftpd -h /var/empty -s /etc _pure-ftpd

RUN touch /tmp/FILE_FTP_SERVER_OKKKK

#RUN mkdir -p /run/openrc && touch /run/openrc/softlevel && /sbin/openrc
COPY ./pure-ftpd.conf /etc/conf.d/pure-ftpd.conf
COPY ./start.sh /bin/start.sh
COPY ./kill.sh /bin/kill.sh
ADD ./supervisor.conf /etc/supervisor.conf
RUN rm /etc/pure-ftpd.conf 	\
&& chmod 700 /bin/start.sh /bin/kill.sh	\
&& mkdir -p /etc/pure-ftpd/conf/	\
&& echo 2 > /etc/pure-ftpd/conf/TLS	\
&& mkdir -p /etc/ssl/private/		\
&& openssl req -x509 -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com"			\
-nodes -days 7300 -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem	\
&& chmod 600 /etc/ssl/private/pure-ftpd.pem

CMD ["./bin/start.sh"]
# DEFAULT COMMAND :
