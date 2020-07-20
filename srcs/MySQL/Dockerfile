########### MYSQL IMAGE

FROM ft_service_alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

LABEL project=ft_service
LABEL service=mysql

EXPOSE 3306 

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade && apk add --no-cache mysql

# ADD SUPERVISOR CONFIG FILE
COPY supervisord.conf /etc/supervisord.conf

VOLUME /var/lib/mysql

# DEFAULT COMMAND :
CMD ["supervisord"]
