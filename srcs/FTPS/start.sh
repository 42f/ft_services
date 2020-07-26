#!/bin/sh
export USER=ftp42
echo -e "42\n42" | adduser -h /mnt/ftp ftp42
#echo -e "$USER_PASS_VAL\n$USER_PASS_VAL" | adduser -h /mnt/ftps_data ftp42

touch /mnt/ftp/Hellow_from_ftp_volume
mkdir -p /mnt/ftp/ftp_boring_dir
touch /mnt/ftp/ftp_boring_dir/kikoo

supervisord
