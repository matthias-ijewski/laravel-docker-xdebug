FROM php:7.4-fpm

RUN apt-get update &&\
    apt-get install --no-install-recommends --assume-yes --quiet ca-certificates curl git &&\
    rm -rf /var/lib/apt/lists/*

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN echo 'xdebug.remote_host = "host.docker.internal"' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo 'xdebug.default_enable = 1' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo 'xdebug.remote_autostart = 1' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo 'xdebug.remote_connect_back = 0' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo 'xdebug.remote_enable = 1' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN echo 'xdebug.remote_handler = "dbgp"' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo 'xdebug.remote_port=9007' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo 'xdebug.idekey="VSCODE"' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN docker-php-ext-install pdo pdo_mysql
