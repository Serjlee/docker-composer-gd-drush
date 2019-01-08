FROM composer:latest

# Install php-gd
RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libpng-dev && docker-php-ext-install gd && rm -rf /var/cache/apk/*

# Make Composer install times bearable
RUN composer global require hirak/prestissimo

# Download and install Drush launcher
RUN php -r "copy('https://github.com/drush-ops/drush-launcher/releases/download/0.4.2/drush.phar', 'drush.phar');" && chmod +x drush.phar && mv drush.phar /usr/bin/drush
