FROM nginx:latest

ARG REVERSE_PROXY_API_TARGET=replace-me;
ARG DNS_RESOLVER=replace-me;

ADD static /usr/share/nginx/html
ADD nginx.conf.template /opt/nginx.conf.template

RUN envsubst '$REVERSE_PROXY_API_TARGET,$DNS_RESOLVER' < /opt/nginx.conf.template > /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
