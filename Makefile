LOGIN	= sjhony-x
SCRIPT_CLEAN = ./srcs/requirements/wordpress/tools/clean.sh

all: up

clean:
		@docker-compose -f srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

fclean: clean
		-@sh $(SCRIPT_CLEAN) 2>/dev/null || true
		-@sudo rm -rf /home/$(LOGIN) 2>/dev/null || true
		-@sudo sed -i.default "s/127.0.0.1 sjhony-x.42.fr//" /etc/hosts

up:		config
		@sudo docker-compose -f ./srcs/docker-compose.yml up --build --detach
down:
		@sudo docker-compose -f ./srcs/docker-compose.yml down

config:
	@sudo mkdir -p /home/$(LOGIN)/data/mariadb
	@sudo mkdir -p /home/$(LOGIN)/data/wordpress
	@grep $(LOGIN).42.fr /etc/hosts || echo "127.0.0.1 $(LOGIN).42.fr" | sudo tee --append /etc/hosts

display:
	docker ps -a
	docker images -a
	docker volume ls
	docker network ls --filter name=inception

.PHONY: all clean fclean config
