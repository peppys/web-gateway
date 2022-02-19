FROM nginx:latest

ARG REVERSE_PROXY_TARGET=replace-me;

ADD nginx.conf.template /opt/nginx.conf.template
RUN envsubst < /opt/nginx.conf.template > /etc/nginx/nginx.conf

RUN cat /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
