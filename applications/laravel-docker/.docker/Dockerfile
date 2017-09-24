FROM php:7.1-apache

# Copy project specific VirtualHost file
COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

# Create working directory
RUN mkdir /srv/app && chown -R www-data:www-data /srv/app
WORKDIR /srv/app

# Enable mod_rewrite
RUN a2enmod rewrite

# Install PHP extensions
RUN docker-php-ext-install mbstring pdo pdo_mysql

# Install GIT and ZIP for composer
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip unzip

# Install composer
RUN curl --silent --show-error https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer