# See https://github.com/docker-library/php/blob/master/7.1/fpm/Dockerfile
FROM php:7.3-fpm-stretch
ARG TIMEZONE

MAINTAINER Makhtar <maxtar.diakhate@gmail.com>

RUN apt-get update && apt-get install -y \
    openssl \
    git \
    unzip \
    libsodium-dev \
    zlib1g-dev \
     libicu-dev \
      g++ \
        libzip-dev \
    libjpeg-dev\
     libfreetype6-dev \
    libpng-dev \
    ffmpeg

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& composer --version

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone \
&& printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini \
&& "date"

RUN echo "upload_max_filesize = 8M" > /usr/local/etc/php/conf.d/upload_max_filesize.ini
RUN echo "post_max_size = 8M" > /usr/local/etc/php/conf.d/post_max_size.ini
RUN echo "memory_limit = 1024M" > /usr/local/etc/php/conf.d/memory_limit.ini

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install gd
RUN docker-php-ext-install sodium
RUN docker-php-ext-install zip
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

RUN echo 'alias sf="php bin/console"' >> ~/.bashrc


USER www-data
WORKDIR /app
