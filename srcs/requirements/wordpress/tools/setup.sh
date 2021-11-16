#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
# wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp
cd var/www/html/wordpress
wp core download --allow-root
mv /var/www/html/wordpress/wp-config.php /var/www/html/
wp core install --allow-root							\
				--url=${WP_URL}							\
				--title=${WP_TITLE}						\
				--admin_user=${WP_ADM_USER}				\
				--admin_password=${WP_ADM_PASS}			\
				--admin_email=${WP_ADM_MAIL}
wp user create --allow-root ${WP_USER} ${WP_USER_MAIL}	\
				--role=subscriber						\
				--user_pass=${WP_USER_PASS}
fi

exec "$@"