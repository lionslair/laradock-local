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

cd into the cloned directory. Due to some bug you need to run the first command as root

`sudo docker-compose build --no-cache nginx`

then run the rest of the build

`docker-compose up -d nginx mysql adminer redis elasticsearch kibana php-worker laravel-horizon workspace`


## Sites

Configure sites in `./laradock/nginx/sites/`

copy `laravel.conf.example` to `yoursite.conf`

edit as needed.


## Databases

Add new databases to `mysql/docker-entrypoint-initdb.d/createdb.sql`

## Horizon

copy `laravel-horizon/supervisord.d/laravel-horizon.conf.example to a new file`


## aliases

I have created some aliases for my system to make starting, stopping and ssh a little easier.

`alias lara='cd ~/Code/laradock; docker-compose up -d nginx mysql adminer redis elasticsearch kibana php-worker laravel-horizon workspace'`

`alias lara-bash='cd ~/Code/laradock; docker-compose exec --user=laradock workspace bash'`

`alias lara-restart='cd ~/Code/laradock; docker-compose restart nginx mysql adminer redis elasticsearch kibana php-worker laravel-horizon workspace'`

`alias lara-stop='cd ~/Code/laradock; docker-compose stop'`

## OTHER

on your local machine also run this  as root for elasticsearch

`echo 'vm.max_map_count=262144' >> /etc/sysctl.conf`

`sysctl -p`
