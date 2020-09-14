FROM php:7.4-fpm

# RUN apt-get update 2>/dev/null | grep packages | cut -d '.' -f 1 && apt-get install -y libmcrypt-dev vim libfreetype6-dev libjpeg62-turbo-dev libpng-dev && apt clean
# RUN pecl install mcrypt-1.0.1 && docker-php-ext-enable mcrypt

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install mysqli pdo pdo_mysql


WORKDIR /var/www
RUN chown -R www-data:www-data /var/www

