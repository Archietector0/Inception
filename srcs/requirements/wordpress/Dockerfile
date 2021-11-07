FROM	debian:buster

RUN		apt-get update -y &&	\ 
		apt-get upgrade -y &&	\ 
		apt-get -y install		\ 
		php7.3					\ 
		php-fpm					\ 
		php-cli					\ 
		wget					\ 
		curl					\ 
		php-mysql				\ 
		php-mbstring			\ 
		php-xml					\ 
		sendmail				\
		wordpress				\
		vim

RUN mv usr/share/wordpress /var/www/html/wordpress


RUN		chown -R www-data:www-data /var/www/html 






