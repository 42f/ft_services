########### PHPMYADMIN IMAGE

FROM ft_service_alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

LABEL project=ft_service
LABEL service=phpmyadmin

EXPOSE 5000

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade && apk add nginx phpmyadmin \
php7 php7-json php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl

# ADD SUPERVISOR CONFIG FILE
COPY supervisord.conf /etc/supervisord.conf
#COPY config.inc.php /etc/phpmyadmin/config.inc.php
COPY site_pma.conf /etc/nginx/conf.d/default.conf
RUN chmod 644 /usr/share/webapps/phpmyadmin/config.inc.php
# CREATE DIRECTORY TO BE ABLE TO EXECUTE NGINX
RUN mkdir /run/nginx

# DEFAULT COMMAND :
CMD ["supervisord"]
