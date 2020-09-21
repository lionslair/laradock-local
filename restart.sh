#!/bin/bash

#cd ~/Code/laradock; docker-compose restart caddy mysql adminer redis elasticsearch kibana laravel-horizon selenium workspace php-worker
cd ~/Code/laradock; ./down.sh
cd ~/Code/laradock; ./up.sh
