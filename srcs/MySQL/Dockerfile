############ MYSQL IMAHE


MAINTAINER bvalette <bvalette@student.42.fr>

EXPOSE 80
EXPOSE 8080

# INSTALL ALL PACKAGED
RUN apk update && apk add openrc --no-cache && apk add nginx

# ADD CONFIG FILE FOR NGNINX
ADD ./site.conf /etc/nginx/conf.d/default.conf

# CREATE A BASIC WEBPAGE
RUN mkdir /tmp/mynginx mynginx
RUN echo "<title>42 bvalette</title><h1 style="text-align:center">FT_SERVICE Kikoo<br/>Build on "$(date)"<br/><img src="https://media.giphy.com/media/l3V0uEmPgKpjZH6ve/source.gif" width="800"></h1>" > /tmp/mynginx/index.html

# CREATE DIRECTORY TO BE ABLE TO EXECUTE NGINX
RUN mkdir /run/nginx

# DEFAULT COMMAND :
CMD ["nginx", "-g", "daemon off;"]
