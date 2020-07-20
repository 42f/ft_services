########### PHPMYADMIN IMAGE

FROM ft_service_alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

LABEL project=ft_service
LABEL service=phpmyadmin

EXPOSE 5000

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade && apk add phpyadmin

# ADD SUPERVISOR CONFIG FILE
COPY supervisord.conf /etc/supervisord.conf

# DOWNLOAD WORDPRESS
ADD wordpress_latest.tar.gz /var/www/

# CREATE DIRECTORY TO BE ABLE TO EXECUTE NGINX
RUN mkdir /run/nginx

# DEFAULT COMMAND :
CMD ["supervisord"]
