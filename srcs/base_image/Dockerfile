FROM alpine:3.12.0 

MAINTAINER bvalette <bvalette@student.42.fr>

#ARG USER_PASS
LABEL project=ft_service

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade && apk add supervisor openssl 

# INSTALL DEBUG PACKAGE
RUN apk update && apk upgrade && apk add vim

