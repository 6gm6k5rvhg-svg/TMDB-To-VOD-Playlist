FROM php:8.3-apache

# Make sure only one Apache MPM is enabled
RUN a2dismod mpm_event || true
RUN a2enmod mpm_prefork rewrite

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    curl \
    libzip-dev \
    && docker-php-ext-install zip \
    && rm -rf /var/lib/apt/lists/*

COPY . /var/www/html/

EXPOSE 80