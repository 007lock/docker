FROM php:7.2-cli-alpine
MAINTAINER Simon NG <007lock@gmail.com>

#----------------------------------------------------
# Base Alpine edge image w/s6 Overlay, Nginx and PHP7
#----------------------------------------------------

##/
 # Install PHP
 #/
RUN apk --no-cache --update add --virtual build-dependencies \
    build-base gcc autoconf musl-dev \
    libzip-dev libpng-dev icu-dev \
    pcre-dev libjpeg-turbo-dev libxml2-dev \
    zlib-dev \
    && NPROC=$(getconf _NPROCESSORS_ONLN) \
    && docker-php-ext-install -j${NPROC} gd zip intl pdo_mysql mysqli bcmath opcache \
    && pecl install opencensus-alpha \
    && docker-php-ext-enable opencensus \
    && apk del build-dependencies \
    && rm -rf /var/cache/apk/* \
    && apk --no-cache --update add bash \
    curl \
    git \
    openssh \
    libzip \
    libpng \
    icu \
    pcre \
    libjpeg-turbo \
    libxml2 \
    zlib \
    musl

##/
 # Install composer & Envoy
 #/
ENV COMPOSER_HOME=/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH $COMPOSER_HOME/vendor/bin:$PATH

RUN mkdir /composer \
    && curl -sS https://getcomposer.org/installer | php \
    && mkdir -p /opt/composer \
    && mv composer.phar /usr/bin/composer \
    && composer global require laravel/envoy

##/
 # Set WORKDIR
 #/
RUN mkdir /envoy

WORKDIR /envoy

##/
 # Copy files
 #/
COPY rootfs /

##/
 # Set the s6 overlay init
 #/
ENTRYPOINT ["/entrypoint/envoy"]
