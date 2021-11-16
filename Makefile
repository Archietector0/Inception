all:
	sudo docker-compose -f srcs/docker-compose.yaml up

down:
	sudo docker-compose -f srcs/docker-compose.yaml down

rm_vol:
	sudo docker volume rm srcs_wp
	sudo docker volume rm srcs_db	
rm_vol2:
	sudo rm -rf /Users/natalaviktorovna/Desktop/Data/wp/*
	sudo rm -rf /Users/natalaviktorovna/Desktop/Data/db/*

nhost:
	mkdir -p ~/data/wp ~/data/db
	sudo cp /Users/natalaviktorovna/Desktop/Inception3/srcs/requirements/hosts /etc/

cache:
	sudo docker-compose -f srcs/docker-compose.yaml down --rmi all -v
	sudo docker-compose -f srcs/docker-compose.yaml build --no-cache
	sudo docker-compose -f srcs/docker-compose.yaml up
re:
	sudo docker-compose -f srcs/docker-compose.yaml up --build