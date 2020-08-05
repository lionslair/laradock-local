# Customised laradock

This repository is a customised fork of [https://github.com/laradock/laradock](https://github.com/laradock/laradock)

Most of the notes here have been worked out from the laradocs documentation. [https://laradock.io/getting-started/#requirements](https://laradock.io/getting-started/#requirements)

## Track changes

In I will keep this up to date with the main laradock branch. However you should track your own changes on a fork of this repo.

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

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –`

##### Step 4 Install docker repo

To install the Docker repository, enter the command:

`sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"`


##### Step 5: Update Repositories
Update the repositories you just added:

`sudo apt-get update`

##### Step 6: Install Latest Version of Docker
To install the latest version of docker:

`sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose`

make sure its the 18.x version. I needed to do 

`sudo apt install docker-ce=18.06.3~ce~3-0~ubuntu`

release notes

[https://docs.docker.com/engine/release-notes/#version-1903](https://docs.docker.com/engine/release-notes/#version-1903)

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

### Requirements

* Git [https://git-scm.com/downloads](https://git-scm.com/downloads)
* Docker >= 17.12 [https://www.docker.com/products/docker/](https://www.docker.com/products/docker/)

Make sure you have docker and docker-compose installed. See information here [https://www.docker.com/products/docker/])

Clone this repository to the same directory as you have your laravel sites. eg `/home/user/Code`

`git clone git@bitbucket.org/lionslair/laradock.git`

cd into the cloned directory and run the command below.

`docker-compose up -d caddy mysql adminer redis elasticsearch kibana laravel-horizon selenium workspace`


## Sites

### Caddy

*Only edit this if using caddy. You can not use Caddy and Nginx together. Caddy is the default in this setup*

Configure sites in `./caddy/caddy/Caddyfile`

edit as needed.

### NGNIX

*If you are going to use nginx you can not use SSL hosts.  There used to be a bug about building the nginx container and needing root. This seems be be solved if not try the below*

`sudo docker-compose build --no-cache nginx`

*If using nginx then your start command will be *

`docker-compose up -d nginx mysql adminer redis elasticsearch kibana laravel-horizon selenium workspace`

Configure sites in `./laradock/nginx/sites/`

copy `laravel.conf.example` to `yoursite.conf`

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

With ngnix

```
depends_on:
  - nginx
links:
  - nginx:q.test
  - nginx:screensavers.test
  - nginx:greeta.test
  - nginx:taskey.test
  - nginx:surprise.test
```

with caddy

```
depends_on:
  - caddy
links:
  - caddy:q.test
  - caddy:screensavers.test
  - caddy:greeta.test
  - caddy:taskey.test
  - caddy:surprise.test
```

Take note each time you add a new site you will need to add it to the links reference [https://github.com/laradock/laradock/issues/907](https://github.com/laradock/laradock/issues/907)

## Aliases

I have created some aliases for my system to make starting, stopping and ssh a little easier.

#### Start
with ngnix
`alias lara='cd ~/Code/laradock; docker-compose up -d nginx mysql adminer redis elasticsearch kibana php-worker laravel-horizon selenium workspace sqsv sqs-ui'`

with caddy
`alias lara='cd ~/Code/laradock; docker-compose up -d caddy mysql adminer redis elasticsearch kibana php-worker laravel-horizon selenium workspace sqs sqs-ui'`

`alias lara-bash='cd ~/Code/laradock; docker-compose exec --user=laradock workspace bash'`

#### Restart

with ngnix
`alias lara-restart='cd ~/Code/laradock; docker-compose restart nginx mysql adminer redis elasticsearch kibana laravel-horizon selenium workspace php-worker'`

with caddy
`alias lara-restart='cd ~/Code/laradock; docker-compose restart caddy mysql adminer redis elasticsearch kibana laravel-horizon selenium workspace php-worker'`

#### Stop

`alias lara-stop='cd ~/Code/laradock; docker-compose stop'`

#### Redis

`alias lara-redis='cd ~/Code/laradock; docker-compose exec redis bash'`

#### Mysql

`alias lara-mysql='cd ~/Code/laradock; docker-compose exec mysql bash'`

#### Restart workers

`alias lara-workers-restart='cd ~/Code/laradock; docker-compose restart laravel-horizon php-worker'`

#### Extra containers
You can add any of the extra containers you may want or need to run

`php-worker sqs sqs-ui`

## OTHER

on your local machine also run this as root

`echo 'vm.max_map_count=262144' >> /etc/sysctl.conf`

`echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf`

`sysctl -p`

When you start laradock it may create the horizon and websockets log files as root owner and group. Change the permission on the storage folder.

`sudo chown -R youruser:yourgroup storage/`

Laradock will not change the permissions on restart.

## Local UI

Kibana http://localhost:5601
Adminer http://localhost:8081/ (requires adminer container)
SQS http://localhost:9325/ (requires a running sqs-ui container)

## Dev Tools
Xdebug is installed by default.

follow the phpstorm instructions here [https://medium.com/@chenpohsun_12588/set-debugger-using-xdebug-with-phpstorm-laradock-454e8c2ad0d9](https://medium.com/@chenpohsun_12588/set-debugger-using-xdebug-with-phpstorm-laradock-454e8c2ad0d9)

## Docker commands

Remove all docker containers in order to rebuild by running

`docker-compose down`

then to clean up images

`docker image prune -a`

then to clean up volumes

`docker volume prune`

Then run `lara` again and all will be rebuilt.

In order to rebuild a container run

`docker-compose build --no-cache laravel-horizon`

It is best to then restart that container or sometimes do `lara-stop` then `lara` again


## Extra

We are running a local SQS type service. Repo is here https://hub.docker.com/r/roribio16/alpine-sqs (used for the UI) and https://hub.docker.com/r/localstack/localstack (used for the actual SQS mock)
- Used for Q
