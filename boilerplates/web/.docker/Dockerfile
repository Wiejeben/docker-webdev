FROM php:7.1-apache

# Create working directory
RUN mkdir /srv/app && chown -R www-data:www-data /srv/app
WORKDIR /srv/app

# Enable mod_rewrite for SEO URLs
RUN a2enmod rewrite

# Install system packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip unzip libmcrypt-dev libjpeg62-turbo-dev libpng12-dev libmagickwand-dev && \
    apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) mbstring pdo pdo_mysql mcrypt gd iconv && \
    pecl install xdebug-stable imagick && \
    docker-php-ext-enable xdebug imagick

RUN curl --silent --show-error https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
