
FROM debian:buster

# updating packages
RUN apt-get update

# software installation
RUN apt-get install -y mariadb-server

# copying mysql client commands
COPY /tools/db.sql /etc/mysql/
COPY /tools/setup.sh /

CMD bash setup.sh