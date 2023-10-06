# Description

This is a small template that I use for creating new Ruby projects. It helps setting up database, redis and sidekiq in Docker using docker-compose. 
Make is used as an aliases list for the project. For example `make dev` calls related tasks `env` that exports ENV variables for further tasks and `db` that calls `docker-compose` with a specific file. You can add new tasks or remove not required.
Unfortunately, Make can't save ENV variables for the parent process (your shell), so the `source .env.development` call is required to have the same variables in your own shell. Another way is using dotenv gem or any autoenv plugin for your shell.

## Setup

1. Fetch
2. Creaate rails project
3. Copy files to the project folder (`database.yml.example` should change `config/database.yml`)
4. Adjust settings
5. Use

## Usage

 - `make dev` - setup docker containers
 - `make prepare` - call bundle and yarn install, creates database.
 - `make yarn` - add bootstrap to yarn. It's an example task, if you don't need a bootstrap, you can remove it.
 - `make env` - setup ENV variables for other tasks. Does nothing when called alone.
 - `make db` - start database in the docker container (partial task without `env` can be broken, should be used as a part of `dev` task)
 - `make console` - starts rails console
 - `make server` - starts rails server locally.
 - `make docker_server` - starts rails server in the docker container.
 - `make test` - starts rspec
 - `make stop` - stops docker containers
 - `make front` - starts webpacker dev server locally.

Keep in mind, that these files are just a template that should be adjusted for your needs. If you use another shell than `zsh`, it should be changed in the `Makefile`. Also, you can update ruby, rails and bundler versions in the Dockerfile, ad additional packages, commands, e.t.c. It also makes sense to remove not required commands from the `Makefile` and add your own. In other words, change everything and don't expect a silver bullet for any needs.
