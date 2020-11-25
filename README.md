# Customised laradock

This repository is a customised fork of [https://github.com/laradock/laradock](https://github.com/laradock/laradock) with all personal configurations made for projects I work on.

Most of the notes here have been worked out from the official laradock documentation. [https://laradock.io/getting-started/#requirements](https://laradock.io/getting-started/#requirements)

## Track changes

I keep this fork up to date with the main laradock branch. How ever you should track your own changes on a fork of this repo.

[https://dev.to/jeremy/how-to-sync-your-fork-with-the-parent-repository-3ok1](https://dev.to/jeremy/how-to-sync-your-fork-with-the-parent-repository-3ok1)

Add this repo or laradock as an upstream

`git remote add upstream https://github.com/laradock/laradock.git`

or mine

`git remote add upstream https://lionslair@bitbucket.org/lionslair/laradock.git`

get the upstream code.

`git fetch upstream`

## Install / Setup

Follow these steps to get this up and running. This is configured to run multiple sites from one laradock not a single project.

### Ubuntu

Install docker [https://docs.docker.com/install/linux/docker-ce/ubuntu/](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

##### Step 1 Update Local Database

Update the local database with the command:

`sudo apt-get update`

##### Step 2 Download Dependencies

You’ll need to run these commands to allow your operating system to access the Docker repositories over HTTPS.

In the terminal window, type:

`sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common`

##### Step 3 Add Docker’s GPG Key

The GPG key is a security feature.

To ensure that the software you’re installing is authentic enter:

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add`

##### Step 4 Install docker repo

To install the Docker repository, enter the command:

`sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"`


##### Step 5: Update Repositories
Update the repositories you just added:

`sudo apt-get update`

##### Step 6: Install Latest Version of Docker
make sure it's the 19.x *(a the time of writing)* version. you should end up with the following.

```
docker-ce-cli/focal,now 5:19.03.13~3-0~ubuntu-focal amd64
docker-ce/focal,now 5:19.03.13~3-0~ubuntu-focal amd64
``` 

To install the latest version of docker:

`sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose`

release notes

[https://docs.docker.com/engine/release-notes](https://docs.docker.com/engine/release-notes)

##### Step 7 add user to group

Make sure the docker group exists

`sudo groupadd docker`
*Should already exist*

Add your user to the docker group

`sudo usermod -a -G docker <your_user_here>`
*<your_user_here> would be nathanr in my case*

##### Step 8 start at boot

The Docker service needs to be setup to run at startup. To do so, type in each command followed by enter:

`sudo systemctl start docker`
`sudo systemctl enable docker`

## System

*IMPORTANT*

on your local machine also run this as root. *This allows exceeding of pre-configured memory limits*

`echo 'vm.max_map_count=262144' >> /etc/sysctl.conf`

`echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf`

`sysctl -p`

When you start laradock it may create the horizon and websockets log files as root owner and group. Change the permission on the storage folder.

`sudo chown -R youruser:yourgroup storage/`

*Laradock will not change the permissions on restart.* 
I have also created my own alias `storage` to do this for me.

### Laradock

* Git [https://git-scm.com/downloads](https://git-scm.com/downloads)
* Docker >= 17.12 [https://www.docker.com/products/docker/](https://www.docker.com/products/docker/) *following above this should be done*

Make sure you have docker and docker-compose installed. See information here [https://www.docker.com/products/docker/]) *following above this should be done*

Laradock should live in the same directory as all your sites. Example. If your projects reside in `/home/<username>/Code` on your system then this is the same place you want to clone laradock into.

Clone this repository to the same directory as you have your laravel sites. eg `/home/user/Code`

`git clone git@bitbucket.org/lionslair/laradock.git`

cd into the cloned directory and run the command below. eg `/home/<username>/Code/laradock`

`./up.sh`

Inside this bash script is the following. You may need to the paths and what services you want to bring up. 

```
#!/bin/bash

cd ~/Code/laradock; docker-compose up -d caddy mysql adminer redis laravel-horizon selenium workspace php-worker mailhog
```

## Sites

## Hosts file

Ensure to add the website hosts to your `/etc/hosts` file eg

```
127.0.0.1 site1.test

127.0.0.1 site2.test
```

Also add these for convenience add these

```
127.0.0.1       mysql

127.0.0.1       elasticsearch

127.0.0.1       redis

127.0.0.1       kibana

127.0.0.1       php-worker

127.0.0.1       puppeteer

127.0.0.1       mailhog
```

### Caddy (Webserver)

In order to effortlessly run local sites V2with https I have used [Caddy ](https://caddyserver.com) webserver *Currently have a PR open with Laradock to move to Caddy v2 which is what I am using.*

Configure sites you want to server in `./caddy/caddy/Caddyfile`

*You will see I have a number of sites in this file. Some will be familure, and some are past projects* edit as needed.

Configuring a new site is very simple. You can work out what is needed by reviewing already configured sites and to learn more visit [https://caddyserver.com/docs/](https://caddyserver.com/docs/).

## Databases

You can configure databases to be created and privileges automatically assigned in `mysql/docker-entrypoint-initdb.d/createdb.sql`

You can access the mysql host locally with `mysql` if you added the hosts record above.

You can use the following for db authentication.
```
DB_USERNAME=homestead
DB_PASSWORD=secret
```

or 
```
DB_USERNAME=root
DB_PASSWORD=root
```

To execute this file do `docker-compose exec mysql bash` or use the alias if setup `lara-mysql` to enter the container. *(see aliases later)*

then run the file `mysql -u root -proot < ./docker-entrypoint-initdb.d/createdb.sql` This will create the Database and assign the user access to each.

## Horizon

Laravel Horizon runs as it's own contain within the `./laravel-horizon` directory. In order to configure new Horizon 
setup's make a copy of `laravel-horizon/supervisord.d/laravel-horizon.conf.example` in the same directory. eg `laravel-horizon-flooringlab.conf`

The file is simply the supervisor config file.

## Dusk

In order to run dusk tests you need to ensure the following exists at the end of the *selenium* config in `./docker-compose.yml`
*You will see I already have a few configured*

```
depends_on:
  - caddy
links:
  - caddy:bestratedtransport.test
  - caddy:flooringlab.test
  - caddy:leeeletrix.test
  - caddy:myoffer.test
  - caddy:esg.test
  
```

Take note each time you add a new site you will need to add it to the links reference [https://github.com/laradock/laradock/issues/907](https://github.com/laradock/laradock/issues/907)

## Scheduler

Cron scheduler is configured in the workspace container. When you need a new crontab line edit this file `./workspace/crontab/laradock`

Standard crontab configuration is used. In order for this to run you will need to rebuild the container for it get applied. Run the following.

`docker-compose build --no-cache workspace`

## Aliases

I have created some aliases for my system to make starting, stopping and ssh into a little easier.

#### Start
`alias lara='cd ~/Code/laradock; ./up.sh'`

#### Access via SSH

`alias lara-bash='cd ~/Code/laradock; docker-compose exec --user=laradock workspace bash'`

#### Restart

`alias lara-restart='cd ~/Code/laradock; ./restart.sh'`

#### Stop

`alias lara-stop='cd ~/Code/laradock; ./down.sh'`

#### Redis

`alias lara-redis='cd ~/Code/laradock; docker-compose exec redis bash'`

#### Mysql

`alias lara-mysql='cd ~/Code/laradock; docker-compose exec mysql bash'`

#### Restart workers

`alias lara-workers-restart='cd ~/Code/laradock; docker-compose restart laravel-horizon php-worker'`

#### Extra containers
You can add new ones or use any of the other existing containers to your environment. For easy add them to `up.sh`, `down.sh` and `restart.sh` scripts.

Example of custom containers added are:
eg to use the sqs_extended drivers like on AWS add the below. These two should only be used when testing something specific. 

`sqs sqs-ui`

## Local UI's

Below are some of the UI's made available when using the given containers.

Mailhog: [http://mailhog:8025](http://mailhog:8025 )  *(requires mailhog container)*

Adminer [http://localhost:8081/](http://localhost:8081/) *(requires adminer container)*

Kibana [http://localhost:5601](http://localhost:5601) *(requires adminer container)*

Phpmyadmin [http://localhost:8081/](http://localhost:8081/) *(requires phpmyadmin container. You can not use phpmyadmin and adminer at the same time. I prefer adminer. You could change ports but thats up to you)*

SQS [http://localhost:9325/](http://localhost:9325/) *(requires a running sqs-ui container)*


Others have their own also but these are the ones I have used so far.

## MailHog Settings

Use these settings to use mailhog for local delivery

```
MAIL_DRIVER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
```

Web UI Mailhog:  http://mailhog:8025

## Dev Tools
Xdebug is installed by default.

follow the phpstorm instructions here [https://medium.com/@chenpohsun_12588/set-debugger-using-xdebug-with-phpstorm-laradock-454e8c2ad0d9](https://medium.com/@chenpohsun_12588/set-debugger-using-xdebug-with-phpstorm-laradock-454e8c2ad0d9)

## Docker commands

*Mostly used for cleanup or regenerating all containers*

Remove all docker containers in order to rebuild by running

`docker-compose down`

then to clean up containers

`docker container prune`

then to clean up images

`docker image prune -a`

then to clean up volumes *(Getting rid of the volumes will loose data. eg local databases. Elastic Search indexes If you need that backup first,)*

`docker volume prune`

Then run `lara` again and all will be rebuilt.

In order to rebuild a container run

`docker-compose build --no-cache laravel-horizon`

It is best to then restart that container or sometimes do `lara-restart` or run `./restart.sh`

## More notes

When adding a new site to local eg example.test

* Add the host to the Caddyfile
* Add the new crontab setting to `./workspace/crontab/laradock`

Then run `docker-compose build --no-cache caddy workspace` *will take just a few minutes*

If you have added a horizon config or normal supervisor configs to php-worker then you will want to run all four containers. eg

`docker-compose build --no-cache caddy workspace laravel-horizon php-worker`

All should be setup and working. run `lara-restart` or `./restart.sh`

## Extra

We are running a local SQS type service. Repo is here https://hub.docker.com/r/roribio16/alpine-sqs (used for the UI) and https://hub.docker.com/r/localstack/localstack (used for the actual SQS mock)
- Used for Q

## .env file setup

Below is an example of what my .env file looks like to access and work with laradock hosts *(taken from flooring lab)*

```
APP_NAME="Flooring Lab"
APP_ENV=local
APP_KEY=randomstringhere
APP_DEBUG=true
APP_URL=https://flooringlab.test
BUGHERD_ENABLED=false
DEBUGBAR_ENABLED=true

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=flooringlab
DB_USERNAME=homestead
DB_PASSWORD=secret

BROADCAST_DRIVER=log
CACHE_DRIVER=redis
QUEUE_CONNECTION=redis
SESSION_DRIVER=redis
SESSION_LIFETIME=120

REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS=noreply@flooringlab.test
MAIL_FROM_NAME="${APP_NAME}"
```


## References

Below could be a good way of adding php8 with 7 to the system. I like the implementation. Should work going up. However the worker containers would probably still run the env version.

https://medium.com/@msirius/1-n-php-versions-and-projects-via-laradock-51938b337071