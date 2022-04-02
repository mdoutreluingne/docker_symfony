FROM php:8.1-fpm-alpine

# Install more libs (nodejs, npm, ...)
RUN apt-get update \
    &&  apt-get install -y --no-install-recommends \
    locales apt-utils git libicu-dev g++ libpng-dev libxml2-dev libzip-dev libonig-dev libxslt-dev unzip libpq-dev nodejs npm wget \
    apt-transport-https lsb-release ca-certificates

# Install pdo
RUN docker-php-ext-configure \
    intl \
    &&  docker-php-ext-install \
    pdo pdo_mysql pdo_pgsql opcache intl zip calendar dom mbstring gd xsl

RUN pecl install apcu && docker-php-ext-enable apcu

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    &&  mv composer.phar /usr/local/bin/composer

# Symfony CLI
RUN curl -sS https://get.symfony.com/cli/installer | bash \
    &&  mv /root/.symfony/bin/symfony /usr/local/bin

# Init config global git
RUN git config --global user.name "Maxime Doutreluingne"
RUN git config --global user.email "maxime.doutreluingne@gmail.com"

WORKDIR /var/www/html
