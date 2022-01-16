FROM php:8.0-apache

# keep ordered alphabetically to reduce diffs
RUN apt update && apt install -y \
    acl \
    apt-transport-https \
    build-essential \
    ca-certificates \
    coreutils \
    curl \
    file \
    gettext \
    git \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmariadb-dev \
    libpng-dev \
    libpq-dev \
    libssl-dev \
    libtool \
    libwebp-dev \
    libxpm-dev \
    libzip-dev \
    locales \
    mariadb-client \
    wget \
    xsel \
    zip

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen \
    && docker-php-ext-enable opcache \
    && docker-php-ext-configure gettext --with-gettext=/usr/include/ \
    && docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype \
    && docker-php-ext-configure zip \
    && docker-php-ext-install -j$(nproc) gettext gd exif intl pdo pdo_mysql zip mysqli bcmath

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

COPY ports.conf logs.conf /etc/apache2/conf-enabled/
RUN a2enmod rewrite unique_id
EXPOSE 8080

USER www-data:www-data
