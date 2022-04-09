FROM php:8.1-cli

# Install libs
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

# Install Symfony CLI
RUN echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list
RUN apt update
RUN apt install symfony-cli

# Install Yarn
RUN npm install --global yarn

# Init config global git
RUN git config --global user.name "Maxime Doutreluingne"
RUN git config --global user.email "maxime.doutreluingne@gmail.com"

CMD tail -f /dev/null

WORKDIR /var/www/html
