FROM nginx:alpine

MAINTAINER Mahmoud Zalt <mahmoud@zalt.me>

ADD nginx.conf /etc/nginx/

ARG APPLICATION=hitrum
ARG PHP_UPSTREAM=php-fpm:9000
ARG WS_UPSTREAM=php-fpm:9000

# fix a problem--#397, change application source from dl-cdn.alpinelinux.org to aliyun source.
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data \
    && rm /etc/nginx/conf.d/default.conf \
    && echo "upstream ws-upstream { server ${WS_UPSTREAM}; }" > /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream { server ${PHP_UPSTREAM}; }" >> /etc/nginx/conf.d/upstream.conf

CMD ["nginx"]

EXPOSE 80 443
