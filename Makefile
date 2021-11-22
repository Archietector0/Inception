all:
	sudo docker-compose -f srcs/docker-compose.yaml up

down:
	sudo docker-compose -f srcs/docker-compose.yaml down

rm_vols:
	sudo docker volume rm srcs_wp
	sudo docker volume rm srcs_db	
rm_files:
	sudo rm -rf /home/archie/Desktop/Data/wp
	sudo rm -rf /home/archie/Desktop/Data/db

nhost:
	mkdir -p ~/data/wp ~/data/db
	sudo cp /home/archie/Desktop/Inception/srcs/requirements/hosts /etc/

cache:
	sudo docker-compose -f srcs/docker-compose.yaml down --rmi all -v
	sudo docker-compose -f srcs/docker-compose.yaml build --no-cache
	sudo docker-compose -f srcs/docker-compose.yaml up
re:
	sudo docker-compose -f srcs/docker-compose.yaml up --build