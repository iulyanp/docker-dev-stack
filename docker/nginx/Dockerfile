FROM iulyanpopa/alpine-base

MAINTAINER Iulian Popa <iulyanpopa@gmail.com>

RUN apk --update add nginx supervisor

RUN mkdir -p /etc/nginx/sites-available \
    && mkdir -p /etc/nginx/sites-enabled \
    && mkdir -p /usr/share/nginx/html \
    && mkdir -p /var/log/supervisor \
    && mkdir -p /var/log/nginx \
    && chown -R docker:docker /var/log/nginx

COPY nginx.conf /etc/nginx/
COPY supervisord.conf /etc/
COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html

CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
