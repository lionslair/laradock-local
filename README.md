# Customised laradock

This repository is a customised fork of [https://github.com/laradock/laradock](https://github.com/laradock/laradock)

Most of the notes here have been worked out from the lardocs documentation. [https://laradock.io/getting-started/#requirements](https://laradock.io/getting-started/#requirements)

## Install / Setup

Follow these steps to get this up and running. This is configured to run multiple sites from one laradock not a single project.


### Requirements

* Git [https://git-scm.com/downloads](https://git-scm.com/downloads)
* Docker >= 17.12 [https://www.docker.com/products/docker/](https://www.docker.com/products/docker/)

Make sure you have docker and docker-compose installed. See information here [https://www.docker.com/products/docker/])


Clone this repository to the same directory as you have your laravel sites. eg `/home/user/Code`

`git clone git@github.com:lionslair/laradock.git`

cd into the cloned directory. Due to some bug you need to run the first command as root. You may find that there are three files in nginx/ssl owned as root. Chown these to your user and you will not need to do the step below. Just add nginx to the full up command below.

`sudo docker-compose build --no-cache nginx`

then run the rest of the build

`docker-compose up -d nginx mysql adminer redis elasticsearch kibana php-worker laravel-horizon selenium workspace nginx`


## Sites

Configure sites in `./laradock/nginx/sites/`

copy `laravel.conf.example` to `yoursite.conf`

edit as needed.

## Hosts file

Ensure to add the website hosts to your /etc/hosts file

127.0.0.1 site1.test
127.0.0.1 site2.test

Also add these for convenience

127.0.0.1       mysql
127.0.0.1       elasticsearch
127.0.0.1       redis
127.0.0.1       kibana

## Databases

Add new databases to `mysql/docker-entrypoint-initdb.d/createdb.sql`

To execute this file do `docker-compose exec mysql bash`

and then run the file `mysql -u root -proot < ./docker-entrypoint-initdb.d/createdb.sql`

## Horizon

copy `laravel-horizon/supervisord.d/laravel-horizon.conf.example to a new file`

## Dusk

In order to run dusk tests you need to ensure the following exists at the end of the *selenium* config in docker-compose.yml

```
depends_on:
  - nginx
links:
  - nginx:q.test
  - nginx:screensavers.test
  - nginx:greeta.test
  - nginx:taskey.test
```

Take note each time you add a new site you will need to add it to the links reference [https://github.com/laradock/laradock/issues/907](https://github.com/laradock/laradock/issues/907)

## aliases

I have created some aliases for my system to make starting, stopping and ssh a little easier.

`alias lara='cd ~/Code/laradock; docker-compose up -d nginx mysql adminer redis elasticsearch kibana php-worker laravel-horizon selenium workspace'`

`alias lara-bash='cd ~/Code/laradock; docker-compose exec --user=laradock workspace bash'`

`alias lara-restart='cd ~/Code/laradock; docker-compose restart nginx mysql adminer redis elasticsearch kibana php-worker laravel-horizon selenium workspace'`

`alias lara-stop='cd ~/Code/laradock; docker-compose stop'`

`alias lara-redis='cd ~/Code/laradock; docker-compose exec redis bash'`

`alias lara-mysql='cd ~/Code/laradock; docker-compose exec mysql bash'`

## OTHER

on your local machine also run this as root

`echo 'vm.max_map_count=262144' >> /etc/sysctl.conf`

`echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf`

`sysctl -p`

## Local UI

Kibana http://localhost:5601
Adminer http://localhost:8080/
