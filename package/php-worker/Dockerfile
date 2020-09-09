FROM php:7-cli-alpine
MAINTAINER Simon NG <007lock@gmail.com>

# Compile and install monit and confd
ENV MONIT_VERSION=5.24.0 \
    MONIT_HOME=/opt/monit \
    MONIT_URL=https://mmonit.com/monit/dist \
    SERVICE_VOLUME=/opt/tools \
    PATH=$PATH:/opt/monit/bin

RUN apk add --no-cache --update freetype freetype-dev libzip libzip-dev libpng libpng-dev icu icu-dev pcre pcre-dev libjpeg-turbo libjpeg-turbo-dev libxml2 libxml2-dev autoconf g++ imagemagick imagemagick-dev libtool zlib zlib-dev libressl libressl-dev file make bash \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && NPROC=$(getconf _NPROCESSORS_ONLN) \
    && docker-php-ext-install -j${NPROC} gd zip intl pdo iconv pdo_mysql mbstring mysqli bcmath \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && mkdir -p /opt/src; cd /opt/src \
    && curl -sS ${MONIT_URL}/monit-${MONIT_VERSION}.tar.gz | gunzip -c - | tar -xf - \
    && cd /opt/src/monit-${MONIT_VERSION} \
    && ./configure  --prefix=${MONIT_HOME} --without-pam \
    && make && make install \
    && mkdir -p ${MONIT_HOME}/etc/conf.d ${MONIT_HOME}/log \
    && apk del freetype-dev libpng-dev libzip-dev icu-dev pcre-dev libjpeg-turbo-dev libxml2-dev imagemagick-dev zlib-dev autoconf g++ libtool make libressl-dev file \
    && rm -rf /var/cache/apk/* /opt/src
    
RUN mkdir -p /var/run/laravel/
ADD monit-start.sh ${MONIT_HOME}/bin/monit-start.sh
COPY laravel.cnf ${MONIT_HOME}/etc/conf.d/laravel.cnf
RUN chmod +x ${MONIT_HOME}/bin/monit-start.sh