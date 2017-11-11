#!/usr/bin/env sh

if [ "$XDEBUG_ENABLE" == true ] || [ "$XDEBUG_ENABLE" == 1 ]; then
    # Enable xdebug
    echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    docker-php-ext-enable xdebug
else
    # Disable xdebug
    if [ -e /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini ]; then
        rm -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    fi
fi

if [ "$REDIS_ENABLE" == true ] || [ "$REDIS_ENABLE" == 1 ]; then
    # Enable Redis
    docker-php-ext-enable redis
else
    # Disable xdebug
    if [ -e /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini ]; then
        rm -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    fi
fi

# Start FPM
php-fpm