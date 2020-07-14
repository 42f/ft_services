######### BASE IMAGE

FROM alpine:3.12.0 

MAINTAINER bvalette <bvalette@student.42.fr>

#ARG USER_PASS
LABEL project=ft_service

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade && apk add tzdata supervisor openssl 			\
&& apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
#COPY KILL.SH FOR ALL FUTURES IMAGES
COPY kill.sh /bin/kill.sh
COPY telegraf.conf /etc/telegraf.conf 
#SET TIMEZOME
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime

# INSTALL DEBUG PACKAGE
RUN apk update && apk upgrade && apk add vim curl tar

