#!/bin/sh

echo -e "$USER_PASS_VAL\n$USER_PASS_VAL" | adduser -h /mnt/ftps_data ftp42 && export USER_PASS_VAL=0

supervisord

