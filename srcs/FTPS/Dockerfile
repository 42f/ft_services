FROM alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

#ARG USER_PASS
LABEL project=ft_service
EXPOSE 21

# INSTALL ALL PACKAGED
RUN apk update \
&& apk upgrade\
&& apk add vim openrc lftp \
pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

#RUN echo -e "$USER_PASS\n$USER_PASS" | adduser -h /tmp ftp42 

RUN addgroup _pure-ftpd
RUN adduser -D -G _pure-ftpd -h /var/empty -s /etc _pure-ftpd

RUN touch /tmp/FILE_FTP_SERVER_OKKKK

#RUN mkdir -p /run/openrc && touch /run/openrc/softlevel && /sbin/openrc
RUN rm /etc/pure-ftpd.conf
COPY ./pure-ftpd.conf /etc/conf.d/pure-ftpd.conf
COPY ./start.sh /bin/start.sh
RUN chmod 700 /bin/start.sh

# DEFAULT COMMAND :
CMD ["/bin/start.sh"]
