#!/bin/bash

cd ~/Code/laradock; docker-compose up -d caddy mysql adminer redis elasticsearch kibana laravel-horizon selenium workspace php-worker
