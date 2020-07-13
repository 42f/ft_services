#!/bin/sh

echo -e "$USER_PASS_VAL\n$USER_PASS_VAL" | adduser -h /home/ftp ftp42 && export USER_PASS_VAL=0
#exec /usr/sbin/pure-ftpd

supervisord

