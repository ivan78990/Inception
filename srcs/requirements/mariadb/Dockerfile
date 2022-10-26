FROM	alpine:3.14

LABEL	app="mariadb"

RUN		apk update && apk add openrc mariadb mariadb-client

RUN		mkdir -p /run/openrc && touch /run/openrc/softlevel

COPY	./entrypoint.sh /

EXPOSE  3306

CMD		[ "/entrypoint.sh" ]
