FROM	debian:buster

RUN 	apt-get update -y && apt-get upgrade -y

RUN 	apt-get install -y	\
		nginx				\
		vim					\
		openssl				\
		wget				

RUN 	rm -rf ./etc/nginx/sites-available/default
RUN 	rm -rf ./etc/nginx/sites-enabled/default
COPY 	/tools/nginx.conf ./etc/nginx/sites-available
RUN 	ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf


# Создание папок для хранения ключей и сертификатов
RUN		mkdir /etc/nginx/ssl
RUN		mkdir /etc/nginx/ssl/certs
RUN		mkdir /etc/nginx/ssl/private

# Выпуск сертификатов
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048		\
		-keyout /etc/nginx/ssl/private/tbarth.key 				\
		-out /etc/nginx/ssl/certs/tbarth.crt					\
		-subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=tbarth/CN=localhost"

RUN		chmod -R 755 /etc/nginx/ssl/*

EXPOSE	443

CMD		["nginx","-g", "daemon off;"]