run:
	git pull
	docker stack rm monitoring
	docker stack deploy -c docker-compose.yml monitoring