FROM nginx:1.17-alpine

ENV ENVIRONMENT_NAME development
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /
WORKDIR /usr/share/nginx/html
COPY site/output .

CMD [ "/entrypoint.sh" ]