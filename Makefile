include ./srcs/.env

all:	create
		docker-compose -f ./srcs/docker-compose.yml up --build -d

rul:
		sudo chown $USER /var/run/docker.sock
		export ${PATH_DB_DATA}
		export ${PATH_WP_DATA}

create:
		@sudo mkdir -p ${PATH_WP_DATA}
		@sudo mkdir -p ${PATH_DB_DATA}

ps:
		docker-compose -f ./srcs/docker-compose.yml ps -a


down:
		docker-compose -f ./srcs/docker-compose.yml down -v

rm_dir:
		sudo rm -rf /home/warchang/data/db_data
		sudo rm -rf /home/warchang/data/wp_data

fclean:	down rm_dir
		./srcs/requirements/tools/clean.sh

re:		fclean all

log:
		sudo docker-compose -f ./srcs/docker-compose.yml logs
