#!/bin/sh

sed -i "s/127.0.0.1/${PHP_HOST}/" /etc/php7/php-fpm.d/www.conf

wp core download

sleep 5

wp config create \
        --dbname=${WP_DB_NAME}  \
        --dbuser=${WP_DB_USER}  \
        --dbpass=${WP_DB_PASSWORD}  \
        --dbhost=${WP_DB_HOST}  \
        --skip-check

wp core install \
        --url=${DOMAIN_NAME}  \
        --title=inception      \
        --admin_user=warchang    \
        --admin_password=${WP_DB_ADMIN_PASSWORD}  \
        --admin_email=warchang@student.21-school.ru

wp user create blogger chelovek@u.ru \
        --display_name="Anybody"  \
        --first_name=Kirill \
        --last_name=Kirillov \
        --user_pass=${WP_DB_PASSWORD}
        --role=administrator

exec php-fpm7 --nodaemonize;