#!/usr/bin/env bash

# initial setup - create persistent storage
mkdir -p /app/logs

if ! [[ -d "/app/nginx" ]]; then
    mv /etc/nginx /app/
fi
ln -nsf /app/nginx /etc/nginx

if ! [[ -d "/app/www" ]]; then
    mv /var/www /app/
fi
ln -nsf /app/www /var/www



# Find the version of PHP-FPM installed, and execute it
PHP_FPM=$(ls -A /usr/sbin/php-fpm*)
if [[ $(ls -A $PHP_FPM) ]]; then
    echo "Found PHP FPM: $PHP_FPM"

    # execute php-fpm
    $(ls -A $PHP_FPM) --daemonize

    # link the php-fpm versioned socket (future proof)
    PHP_FPM_SOCK=$(ls -A /run/php/php*-fpm.sock)
    ln -sf $PHP_FPM_SOCK /run/php/php-fpm.sock
fi

# Finally invole the nginx engine
exec /usr/sbin/nginx

