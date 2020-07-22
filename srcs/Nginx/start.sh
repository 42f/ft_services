#!/bin/sh

#echo -e "$USER_PASS_VAL\n$USER_PASS_VAL" | adduser -h /home/ssh ssh42 
echo -e "42\n42" | adduser -h /home/ssh ssh42 

supervisord
