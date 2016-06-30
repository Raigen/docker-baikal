FROM nginx:alpine

MAINTAINER Raigen

RUN mkdir -p /var/www

# Download & extract baikal
RUN apk --update add curl tar && \
	curl https://codeload.github.com/fruux/Baikal/tar.gz/0.4.5 | tar xzv --strip-components=1 -C /var/www && \
	apk del curl tar

# Install PHP & SQLite3
RUN apk --update --repository http://dl-cdn.alpinelinux.org/alpine/v3.4/main add php5-fpm php5-sqlite3 sqlite

VOLUME /var/www/Specific
