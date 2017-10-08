FROM php:7.1-apache

# Copy project specific configurations
COPY .docker/apache.conf /etc/apache2/sites-available/000-default.conf
COPY .docker/php.ini /usr/local/etc/php/conf.d/php.ini

# Enable mod_rewrite
RUN a2enmod rewrite

# Install PHP extensions
RUN docker-php-ext-install mbstring pdo pdo_mysql
RUN pecl install xdebug-stable && docker-php-ext-enable xdebug

# Install GIT and ZIP for composer
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip unzip

RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install composer
RUN curl --silent --show-error https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Create working directory
RUN mkdir /srv/app && chown -R www-data:www-data /srv/app
WORKDIR /srv/app
