#!/bin/sh

if ! cat /run/db

  then

    touch /run/db

    openrc default
    rc-service mariadb setup
    rc-service mariadb start

    sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
    sed -i "s|.*skip-networking.*|skip-networking=false|g" /etc/my.cnf.d/mariadb-server.cnf

    mysql -e "CREATE DATABASE ${MYSQL_DATABASE};" -u root --skip-password
    mysql -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH GRANT OPTION ;" -u root --skip-password
    mysql -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH GRANT OPTION ;" -u root --skip-password
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}'; " -u root --skip-password
    mysql -e "FLUSH PRIVILEGES ;" -u root -p${MYSQL_ADMIN_PASSWORD} 

    rc-service mariadb stop

fi
    mkdir -p /run/mysqld
    exec mysqld -u root