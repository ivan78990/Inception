FROM	alpine:3.14

LABEL	app="wordpress-php"

RUN		apk update

RUN     apk add  php7\
        php-curl\
        php7-fpm  \
        php7-phar \
        php-json  \
        php-mbstring  \
        php-zlib  \
        php-curl \
        php-gd  \
        php-mysqli  \
        wget

RUN        wget https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


RUN     chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp  \
        && mkdir -p /run/php

COPY	./entrypoint.sh /

WORKDIR	/var/www/html/wordpress

EXPOSE  9000

CMD	[ "/entrypoint.sh" ]