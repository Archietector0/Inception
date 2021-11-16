FROM	debian:buster

RUN		apt-get update -y &&	\
		apt-get upgrade -y &&	\
		apt-get -y install mariadb-server

COPY	./tools/my.cnf /etc/mysql/my.cnf
COPY	./tools/setup.sh /var/www/
RUN		chmod +x /var/www/setup.sh

EXPOSE	3306

CMD 	["/var/www/setup.sh", "mysqld"]