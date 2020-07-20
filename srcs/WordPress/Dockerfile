########### WORDPRESS IMAGE

FROM ft_service_alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

LABEL project=ft_service
LABEL service=wordpress

EXPOSE 5050

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade && apk add nginx \
php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl
# ADD CONFIG FILE FOR NGNINX
COPY site.conf /etc/nginx/conf.d/default.conf

# ADD SUPERVISOR CONFIG FILE
COPY supervisord.conf /etc/supervisord.conf

# DOWNLOAD WORDPRESS
ADD wordpress_latest.tar.gz /var/www/

# CREATE DIRECTORY TO BE ABLE TO EXECUTE NGINX
RUN mkdir /run/nginx

# DEFAULT COMMAND :
CMD ["supervisord"]
