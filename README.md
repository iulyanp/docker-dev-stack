Docker dev stack
-----

Docker stack environment gives you everything you need for develop PHP web applications.

- Portainer
- PHP7-FPM 
- NGINX 
- MySQL 
- Memcache 
- Redis 
- RabbitMQ

### Installation

1. Create a .env from the .env.dist file. Adapt it according to your needs

```
$ cp .env.example .env
```

2. Add a new nginx vhost file for your project

Before you start the containers, you have to add a vhost file to `config/sites`  folder.
If you are using Symfony framework you can find 
[here](https://symfony.com/doc/current/setup/web_server_configuration.html#nginx) an example of the configuration 
for nginx.

> Note! You have to use the socket for php-fpm which is mapped in a volume on `/var/run/php-fpm/php-fpm.sock`

3. Update your system host file

```
# project.local is the server_name set up on the vhost
$ echo project.local >> /etc/hosts
```

### Usage

Just run `docker-compose up -d` and you'll have all the containers up and running.

### How it works

You can find in the `docker-compose` file all the services of the dev stack:
 
 - mysql: The MySQL database container
 - memcache: The Memcache container
 - redis: This is the Redis container
 - php-fpm: This is the PHP-FPM container in which the application volume is mounted
 - nginx: This is the Nginx webserver container, also in which application volume is mounted
 - rabbitmq: This is the RabbitMQ container you can use to create your queues
 - portainer: This is the container that will provide you a nice and useful web interface for Docker (visit 
 [http://localhost:8085](http://localhost:8085))

If you want to see what containers are running you can use:

```
$ docker-compose ps

  Name                 Command               State                                              Ports
-------------------------------------------------------------------------------------------------------------------------------------------------
memcache    docker-entrypoint.sh memcached   Up      0.0.0.0:11211->11211/tcp
mysql       docker-entrypoint.sh mysqld      Up      0.0.0.0:3306->3306/tcp
nginx       supervisord -n -c /etc/sup ...   Up      0.0.0.0:80->80/tcp
php-fpm     /bin/sh -c entrypoint.sh         Up
portainer   /portainer                       Up      0.0.0.0:8085->9000/tcp
rabbitmq    docker-entrypoint.sh rabbi ...   Up      0.0.0.0:8081->15672/tcp, 25672/tcp, 4369/tcp, 0.0.0.0:5671->5671/tcp, 0.0.0.0:5672->5672/tcp
redis       docker-entrypoint.sh redis ...   Up      0.0.0.0:6379->6379/tcp
```
