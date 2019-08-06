#!/bin/sh

# This script is used as the entrypoint for the local development image.

sed -i "s/ENVIRONMENT_NAME/$ENVIRONMENT_NAME/g" /etc/nginx/nginx.conf

cat /etc/nginx/nginx.conf

nginx -g "daemon off;"
