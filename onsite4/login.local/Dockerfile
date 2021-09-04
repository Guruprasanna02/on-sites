FROM php:7.4-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg\
    && docker-php-ext-install -j$(nproc) gd

COPY ./src/index.php /var/www/html/
COPY ./src/captcha.php /var/www/html/
COPY ./src/creds.php /var/www/html/
COPY ./src/arial.ttf /var/www/html/
RUN chmod -R 755 /var/www