#!/bin/sh

sed -i "s/ENVIRONMENT_NAME/$ENVIRONMENT_NAME/g" /etc/nginx/nginx.conf

cat /etc/nginx/nginx.conf

nginx -g "daemon off;"
