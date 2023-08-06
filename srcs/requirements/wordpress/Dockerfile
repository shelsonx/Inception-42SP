FROM debian:bullseye

WORKDIR /var/www/html/

RUN apt update -y && apt upgrade -y && apt install -y \
    php-fpm \
    php-mysql \
    mariadb-client -y \
    wget

RUN sed -i.default "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
    /etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress/* . && \
    rm -rf wordpress && \
    rm -rf latest.tar.gz

RUN mkdir -p /run/php

RUN ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/script.sh /tmp/script.sh
RUN chmod 777 /tmp/script.sh

CMD ["/bin/sh", "-c", "/tmp/script.sh && php-fpm -F"]
