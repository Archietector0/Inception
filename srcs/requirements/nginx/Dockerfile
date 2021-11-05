FROM	debian:buster

RUN		apt-get update -y && apt-get upgrade -y && \
		apt-get -y install nginx openssl vim curl

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/server_pkey.pem \
		-out /etc/ssl/certs/server.crt \
		-subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=tbarth/CN=localhost"

COPY	./default /etc/nginx/sites-available/default

CMD		["nginx","-g", "daemon off;"]