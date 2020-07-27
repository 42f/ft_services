#!/bin/sh

echo -e "$SECRET_PASS\n$SECRET_PASS" | adduser -h /home/ssh $SECRET_NAME

supervisord
