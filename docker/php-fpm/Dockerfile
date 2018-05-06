FROM iulyanpopa/alpine-base

MAINTAINER Iulian Popa <iulyanpopa@gmail.com>

RUN apk --update add \
        wget \
        curl \
        git \
        vim \
        libmcrypt-dev \
        php7 \
        php7-zlib \
        php7-fpm \
        php7-common \
        php7-curl \
        php7-openssl \
        php7-json \
        php7-phar \
        php7-dom \
        php7-gd \
        php7-pdo \
        php7-pdo_sqlite \
        php7-pdo_pgsql \
        php7-pdo_dblib \
        php7-pdo_odbc \
        php7-xml \
        php7-mbstring \
        php7-ctype \
        php7-pdo_mysql \
        php7-memcached \
        php7-soap \
        php7-apcu \
        php7-exif \
        php7-iconv \
        php7-intl \
        php7-mcrypt \
        php7-opcache \
        php7-bcmath \
        php7-tokenizer \
        php7-posix \
        php7-xdebug \
        php7-dba \
        php7-sqlite3 \
        php7-amqp \
        php7-pear \
        php7-redis \
        php7-fileinfo \
        php7-imagick \
        php7-doc \
        php7-session \
        php7-imap \
        php7-pgsql \
        php7-zip \
        php7-calendar \
        php7-tidy \
        php7-ftp \
        php7-sockets \
        php7-simplexml \
        php7-xmlwriter \
        openssh-client \
        #php7-mysqli \
        #php7-phpdbg \
        #cacti-php7 \
        #xapian-bindings-php7 \
        #php7-litespeed \
        #php7-gmp \
        #php7-pcntl \
        #php7-xsl \
        #php7-mysqlnd \
        #php7-enchant \
        #php7-pspell \
        #php7-snmp \
        #php7-pear-mail_mime \
        #php7-xmlrpc \
        #php7-embed \
        #php7-xmlreader \
        #php7-pear-mdb2_driver_mysql \
        #php7-pear-auth_sasl \
        #php7-recode \
        #php7-ldap \
        #php7-pear-net_socket \
        #php7-gettext \
        #php7-mailparse \
        #php7-sysvshm \
        #php7-shmop \
        #php7-odbc \
        #php7-pear-mdb2_driver_pgsql \
        #php7-apache2 \
        #php7-cgi \
        #php7-wddx \
        #php7-pear-net_smtp \
        #php7-zmq \
        #php7-sysvmsg \
        #php7-sysvsem \
        #php7-pear-net_idna \
        #php7-bz2 \
        #php7-pear-net_smtp-doc \
        supervisor \
	&& curl -sS https://getcomposer.org/installer | php7 -- --install-dir=/usr/bin --filename=composer \
    && rm -rf /tmp/* \
	&& rm -rf /var/cache/apk/*

ADD /php /etc/php7
ADD supervisord.conf /etc/

RUN mkdir -p /var/run/php-fpm \
    && chown -R docker:docker /var/www/ \
    && chown -R docker:docker /var/run/php-fpm

RUN mkdir -p /var/log/php-fpm \
    && mkdir -p /var/log/supervisor \
    && chown -R docker:docker /var/log/php-fpm

ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN ln -s /etc/init.d/php-fpm7 /usr/bin/php-fpm7 \
    && chmod +x /usr/bin/entrypoint.sh

WORKDIR /var/www

CMD entrypoint.sh
