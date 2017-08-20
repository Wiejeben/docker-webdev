FROM php:apache

# Enable mod_rewrite
RUN a2enmod rewrite

# Install mcrypt, mbstring, iconv, gd, ImageMagick and pdo_mysql
RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        libmagickwand-dev

# Install Xdebug
RUN pecl install xdebug-2.5.0 imagick
RUN docker-php-ext-enable xdebug imagick

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) mcrypt mbstring pdo_mysql gd iconv

# Clean
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

WORKDIR /application