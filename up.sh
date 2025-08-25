#!/bin/bash

#cd ~/Code/laradock; docker compose up -d caddy mysql adminer redis elasticsearch kibana laravel-horizon selenium workspace php-worker

# disabled minio selenium php-fpm-7.4
cd ~/Code/laradock; docker compose up -d caddy mysql adminer redis laravel-horizon workspace php-worker mailhog typesense php-fpm minio
