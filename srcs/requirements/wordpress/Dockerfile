FROM	debian:buster

RUN		apt-get -y update && apt-get -y upgrade && apt-get install -y apt-utils
RUN		apt-get -y install  \	
		wget                \
		php7.3 php7.3-fpm   \
		php-mysql			\
		php-fpm 			\
		php-pdo 			\
		php-gd 				\
		php-cli 			\
		php-mbstring

WORKDIR	/var/www/html

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xzvf latest.tar.gz					
RUN		rm -rf latest.tar.gz

WORKDIR	/

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp

COPY	./tools/wp-config.php /var/www/html/wordpress 


RUN		sed -ie s1/run/php/php7.3-fpm.sock190001 /etc/php/7.3/fpm/pool.d/www.conf
RUN		mkdir -p /run/php

RUN		chown -R www-data:www-data /var/www/html/wordpress && \
		chmod -R 775 /var/www/html/wordpress

COPY	./tools/setup.sh /var/www/html/wordpress
RUN		chmod 777 /var/www/html/wordpress/setup.sh

EXPOSE	9000
ENTRYPOINT [ "/var/www/html/wordpress/setup.sh" ]
CMD 	["/usr/sbin/php-fpm7.3", "--nodaemonize"]