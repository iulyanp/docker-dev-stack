#!/bin/sh

deluser docker
addgroup -g ${MY_GID:-500} docker
adduser -u ${MY_UID:-500} -G docker -g 'Linux User named' -s /bin/sh -D docker

supervisord -n -c /etc/supervisord.conf
