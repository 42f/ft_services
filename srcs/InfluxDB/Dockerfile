######### INFLUXDB IMAGE

FROM ft_service_alpine:latest 

MAINTAINER bvalette <bvalette@student.42.fr>

LABEL project=ft_service
LABEL service=influxdb

EXPOSE 8086

# INSTALL ALL PACKAGED
RUN apk update && apk upgrade && apk add influxdb

# ADD SUPERVISOR CONFIG FILE
ADD supervisord.conf /etc/supervisord.conf

# ADD CONFIG FILE FOR NGNINX
ADD ./influxdb.conf /etc/influxdb.conf

# ADJUST TELEGRAF CONF FILE FOR THIS CONTAINER ONLY
RUN sed -i s/influxdb:8086/localhost:8086/ /etc/telegraf.conf

VOLUME /mnt/db
VOLUME /mnt/influx
# DEFAULT COMMAND :
CMD ["supervisord"]
