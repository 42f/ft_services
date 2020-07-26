#!/bin/sh
#export USER=ftp42
#echo -e "42\n42" | adduser -h /mnt/ftp ftp42
echo -e "$SECRET_FTP\n$SECRET_FTP" | adduser -h /mnt/ftp ftp42
unset SECRET_FTP

touch /mnt/ftp/Hellow_from_ftp_volume
mkdir -p /mnt/ftp/ftp_boring_dir
touch /mnt/ftp/ftp_boring_dir/kikoo

supervisord
