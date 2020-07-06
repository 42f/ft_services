## FT_SERVER PROJECT : build a wordpress server

FROM alpine

MAINTAINER bvalette <bvalette@student.42.fr>

EXPOSE 80
EXPOSE 8080

# INSTALL ALL PACKAGED
RUN apk update && apk add openrc --no-cache && apk add nginx
RUN rm /etc/nginx/conf.d/default.conf
ADD ./site.conf /etc/nginx/conf.d/
RUN adduser --disabled-password -g 'Nginx www user' -h /home/mynginx mynginx
RUN echo "<h1 style="text-align:center">FT_SERVER Kikoo<br/><br/><img src="https://media.giphy.com/media/l3V0uEmPgKpjZH6ve/source.gif" width="800"></h1>" > /home/mynginx/index.html
RUN mkdir /run/nginx
RUN rc-update add nginx default
CMD ["nginx", "-g", "daemon off;"]

