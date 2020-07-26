#!/bin/sh
#export USER=ftp42
#echo -e "42\n42" | adduser -h /mnt/ftp ftp42
echo -e "$SECRET_PASS\n$SECRET_PASS" | adduser -h /mnt/ftp $SECRET_NAME

touch /mnt/ftp/Hellow_from_ftp_volume
mkdir -p /mnt/ftp/ftp_boring_dir
touch /mnt/ftp/ftp_boring_dir/kikoo
#echo -e "$SECRET_NAME acceeded on $(date)" > /mnt/ftp/connection_logs.log

supervisord
