# This dockerfile is used to serve the produced files locally, for development
FROM nginx:1.17-alpine

WORKDIR /usr/share/nginx/html
COPY site/output .
