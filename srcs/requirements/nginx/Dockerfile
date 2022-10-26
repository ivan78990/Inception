FROM	alpine:3.14

LABEL	app="nginx"

RUN		apk update && apk add nginx openssl

RUN		mkdir -p /run/nginx

COPY	./config/default.conf /etc/nginx/conf.d/default.conf
COPY	./config/default.conf /etc/nginx/http.d/default.conf


COPY	./entrypoint.sh /

EXPOSE	80 443

CMD	[ "/entrypoint.sh" ]