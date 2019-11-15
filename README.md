# Customised laradock

This repository is a customised fork of [https://github.com/laradock/laradock](https://github.com/laradock/laradock)

Most of the notes here have been worked out from the laradocs documentation. [https://laradock.io/getting-started/#requirements](https://laradock.io/getting-started/#requirements)

## Track changes

In I will keep this up to date with the main laradock branch. However you should track your own changes on a fork of this repo.

get steps to track remote repo here.

## Install / Setup

Follow these steps to get this up and running. This is configured to run multiple sites from one laradock not a single project.

### Ubuntu

Install docker [https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04](https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04)

##### Step 1 Update Local Database

Update the local database with the command:

`sudo apt-get update`

##### Step 2 Download Dependencies

You’ll need to run these commands to allow your operating system to access the Docker repositories over HTTPS.

In the terminal window, type:

`sudo apt-get install apt-transport-https ca-certificates curl software-properties-common`

##### Step 3 Add Docker’s GPG Key

The GPG key is a security feature.

To ensure that the software you’re installing is authentic enter:

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –`

##### Step 4 Install docker repo

To install the Docker repository, enter the command:

`sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"`
 
The command *$(lsb_release –cs)* scans and returns the codename of your Ubuntu installation – in this case, Bionic. Also, the final word of the command – stable– is the type of Docker release.

example installation of the docker repository in terminal 
A stable release is tested and confirmed to work, but updates are released less frequently. You may substitute edge if you’d like more frequent updates, at the cost of potential instability. There are other repositories, but they are riskier – more info can be found on the [https://docs.docker.com/v17.09/engine/installation/linux/docker-ce/ubuntu/#set-up-the-repository](Docker web page).

##### Step 5: Update Repositories
Update the repositories you just added:

`sudo apt-get update`

##### Step 6: Install Latest Version of Docker
To install the latest version of docker:

`sudo apt-get install docker-ce`

make sure its the 18.x version. I needed to do 

`sudo apt-get install docker-ce=18.06.3~ce~3-0~ubuntu`

##### Step 7 start at boot

The Docker service needs to be setup to run at startup. To do so, type in each command followed by enter:

`sudo systemctl start docker`
`sudo systemctl enable docker`

### Requirements

* Git [https://git-scm.com/downloads](https://git-scm.com/downloads)
* Docker >= 17.12 [https://www.docker.com/products/docker/](https://www.docker.com/products/docker/)

Make sure you have docker and docker-compose installed. See information here [https://www.docker.com/products/docker/])


Clone this repository to the same directory as you have your laravel sites. eg `/home/user/Code`

`git clone git@bitbucket.org/lionslair/laradock.git`

cd into the cloned directory. Due to some bug you need to run the first command as root. You may find that there are three files in nginx/ssl owned as root. Chown these to your user and you will not need to do the step below. Just add nginx to the full up command below.

`docker-compose up -d caddy mysql adminer redis elasticsearch kibana php-worker laravel-horizon selenium workspace nginx`


*If you find there are issues building the nginx container use*

`sudo docker-compose build --no-cache nginx`


## Sites

### NGNIX

Configure sites in `./laradock/nginx/sites/`

copy `laravel.conf.example` to `yoursite.conf`

### Caddy

Configure sites in `./caddy/caddy/Caddyfile`

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
`alias lara='cd ~/Code/laradock; docker-compose up -d nginx mysql adminer redis elasticsearch kibana php-worker laravel-horizon selenium workspace'`

with caddy
`alias lara='cd ~/Code/laradock; docker-compose up -d caddy mysql adminer redis elasticsearch kibana php-worker laravel-horizon selenium workspace'`

`alias lara-bash='cd ~/Code/laradock; docker-compose exec --user=laradock workspace bash'`

#### Restart

with ngnix
`alias lara-restart='cd ~/Code/laradock; docker-compose restart nginx mysql adminer redis elasticsearch kibana php-worker laravel-horizon selenium workspace'`

with caddy
`alias lara-restart='cd ~/Code/laradock; docker-compose restart caddy mysql adminer redis elasticsearch kibana php-worker laravel-horizon selenium workspace'`

#### Stop

`alias lara-stop='cd ~/Code/laradock; docker-compose stop'`

#### Redis

`alias lara-redis='cd ~/Code/laradock; docker-compose exec redis bash'`

#### Mysql

`alias lara-mysql='cd ~/Code/laradock; docker-compose exec mysql bash'`

#### Restart workers

`alias lara-workers-restart='cd ~/Code/laradock; docker-compose restart php-worker laravel-horizon'`

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
Adminer http://localhost:8080/

## Docker commands

Remove all docker containers in order to rebuild by running

`docker-compose down`

Then run lara again and all will be rebuilt.

In order to rebuild a container run

`docker-compose build --no-cache laravel-horizon`

It is best to then restart that container or sometimes do `lara-stop` then `lara` again
