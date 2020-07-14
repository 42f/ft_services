FROM ft_service_alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

LABEL project=ft_service
LABEL service=nginx

EXPOSE 80
EXPOSE 443

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade && apk add nginx

#SSL CERTIFICATE
RUN openssl req -x509 \
-subj "/C=FR/ST=PARIS/L=Paris/O=42_Corp/OU=bvalette/CN=bvalette@student.42.fr"	\
-nodes				\
-days 7300 			\
-newkey rsa:2048 	\
-keyout /etc/ssl/private/nginx-selfsigned.key		\
-out /etc/ssl/certs/nginx-selfsigned.crt 			\
&& chmod 600 /etc/ssl/private/nginx-selfsigned.key 	\
&& openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

# ADD CONFIG FILE FOR NGNINX
RUN mkdir -p /etc/nginx/includes
RUN sed -i "s/ssl_session_cache shared:SSL:2m/ssl_session_cache shared:SSL:10m/" /etc/nginx/nginx.conf 
COPY ssl-params.conf ssl-self-signed.conf /etc/nginx/includes/ 
ADD ./site.conf /etc/nginx/conf.d/default.conf

# CREATE A BASIC WEBPAGE
RUN mkdir /tmp/mynginx mynginx
RUN echo "<title>42 bvalette</title><h1 style="text-align:center">FT_SERVICE Kikoo<br/>Build on "$(date)"<br/><img src="https://media.giphy.com/media/l3V0uEmPgKpjZH6ve/source.gif" width="800"></h1>" > /tmp/mynginx/index.html

# CREATE DIRECTORY TO BE ABLE TO EXECUTE NGINX
RUN mkdir /run/nginx

# DEFAULT COMMAND :
CMD ["nginx", "-g", "daemon off;"]
