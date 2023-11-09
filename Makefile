

run:
	docker-compose up -d --build

stop:
	docker-compose stop
rm:
	docker-compose down -v
burn:
	docker system prune -a

clean:
	sudo rm -rf /Users/aechaoub/data/*/*