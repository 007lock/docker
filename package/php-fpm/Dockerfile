FROM php:7.2-fpm
MAINTAINER Simon NG <007lock@gmail.com>

RUN apt-get update \
        && apt-get install -y --no-install-recommends libzip-dev libicu-dev libmagickwand-dev libpng-dev \
    && NPROC=$(getconf _NPROCESSORS_ONLN) \
    && docker-php-ext-install -j${NPROC} gd zip iconv intl bcmath pdo pdo_mysql mbstring mysqli \
    && pecl install imagick opencensus-alpha \
    && docker-php-ext-enable imagick opencensus \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

CMD ["php-fpm"]