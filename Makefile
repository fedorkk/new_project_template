# Makefile

SHELL := /bin/zsh # could be changed to your shell

# All tasks should be added here, otherwise Make tries to create the folder with the same name and skip the task if the folder exists
.PHONY: env db dev console stop server prepare test yarn front

dev: env db

prepare: env db yarn
	bundle install
	bundle exec rake db:prepare
	bundle exec rake webpacker:install
	bundle exec rake assets:clobber
	- bundle exec rake webpacker:compile

yarn:
	yarn add bootstrap@5.0.0-beta2
	yarn add @popperjs/core@2.0.0-alpha.1
	yarn add chart.js

env:
  source ./.env.development

db:
	docker-compose -f docker-compose-local.yml up -d

console:
	bundle exec rails c

server:
	bundle exec rails s

test:
	bundle exec rspec

stop:
	docker-compose -f docker-compose-local.yml down

front:
  bundle exec ./bin/webpack-dev-server
