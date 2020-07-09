FROM alpine

MAINTAINER bvalette <bvalette@student.42.fr>

EXPOSE 21

# INSTALL ALL PACKAGED
RUN apk update \
&& apk upgrade\
&& apk add vim openrc lftp \
pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

VOLUME /sys/fs/cgroup
RUN mkdir -p /run/openrc && touch /run/openrc/softlevel && /sbin/openrc


# DEFAULT COMMAND :
CMD ["pure-ftpd"]
