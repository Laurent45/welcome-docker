
COMPOSE=--file srcs/docker-compose.yml

all: 
	docker compose ${COMPOSE} up -d

clean: 
	docker compose ${COMPOSE} stop

fclean:	
	docker compose ${COMPOSE} down

re:	fclean all	

.PHONY:	all clean fclean re
