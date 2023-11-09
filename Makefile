

run:
	docker-compose up -d --build

stop:
	docker-compose stop
rm:
	docker-compose down -v
burn:
	docker system prune -a