FROM php:7.1-fpm-alpine

# Copy scripts and configuration
COPY start-container.sh /usr/local/bin/start-container
COPY php.ini /usr/local/etc/php/conf.d/php.ini

# Setup working directory
RUN mkdir /srv/app && chown -R www-data:www-data /srv/app
WORKDIR /srv/app

# PDO
RUN docker-php-ext-install pdo pdo_mysql

# Mcrypt
RUN apk add --no-cache libmcrypt-dev && docker-php-ext-install mcrypt

# ZIP
RUN apk add --no-cache zlib-dev && docker-php-ext-install zip

# Intl
RUN apk add --no-cache icu-dev && docker-php-ext-configure intl && docker-php-ext-install intl

# Imagick
RUN set -x \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool \
    && pecl install imagick-stable \
    && docker-php-ext-enable imagick \
    && apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
    && apk del .phpize-deps

# Redis
RUN set -x \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install redis \
    && rm -rf /tmp/pear \
    && apk del .phpize-deps

# Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Xdebug
RUN set -x \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install xdebug-stable \
    && apk del .phpize-deps

CMD ["start-container"]