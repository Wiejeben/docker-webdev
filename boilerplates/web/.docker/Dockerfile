FROM php:7.1-fpm

# Prepare
RUN apt-get update

# PDO
RUN docker-php-ext-install pdo pdo_mysql

# Xdebug
RUN pecl install xdebug-stable && docker-php-ext-enable xdebug

# Imagick
RUN apt-get install -y libmagickwand-dev && pecl install imagick && docker-php-ext-enable imagick

# ZIP
RUN apt-get install -y zlib1g-dev && docker-php-ext-install zip

# Intl
RUN apt-get install -y zlib1g-dev libicu-dev g++ && docker-php-ext-configure intl && docker-php-ext-install intl

# Mcrypt
RUN apt-get install -y libmcrypt-dev && docker-php-ext-install mcrypt

# Redis
RUN pecl install redis && rm -rf /tmp/pear && docker-php-ext-enable redis

# Cleanup
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Setup working directory
RUN mkdir /srv/app && chown -R www-data:www-data /srv/app
WORKDIR /srv/app
