
all : up

up : 
	docker-compose -f srcs/docker-compose.yml up -d

down : 
	docker-compose -f ./srcs/docker-compose.yml down

stop : 
	docker-compose -f ./srcs/docker-compose.yml stop

start : 
	docker-compose -f ./srcs/docker-compose.yml start

cleanf:
	sudo rm -rf /Users/aechaoub/data/*/*

clear_all:
	docker system prune -a

clean:
	docker stop $$(docker ps -aq)
	docker rm $$(docker ps -aq)

burn:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null