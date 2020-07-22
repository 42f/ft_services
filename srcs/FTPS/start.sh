#!/bin/sh

echo -e "42\n42" | adduser -h /mnt/ftps_data ftp42
#echo -e "$USER_PASS_VAL\n$USER_PASS_VAL" | adduser -h /mnt/ftps_data ftp42

supervisord

