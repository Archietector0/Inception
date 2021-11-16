#!/bin/bash

if [ ! -d /var/lib/mysql/wordpress/ ]; then
service mysql start
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"| mysql -u root
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"| mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;"| mysql -u root
echo "FLUSH PRIVILEGES;"| mysql -u root
mysqladmin -u root password $MARIADB_ROOT_PASSWORD
service mysql stop
else
mkdir /var/run/mysqld
mkfifo var/run/mysqld/mysqld.sock
touch /var/run/mysqld/mysqld.pid
chown -R mysql /var/run/mysqld
fi
chown -R mysql:mysql /var/lib/mysql

exec "$@"