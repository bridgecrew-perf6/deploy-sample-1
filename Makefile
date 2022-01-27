clean-new:
	docker run -it --rm --user "$(id -u):$(id -g)" -v "$PWD":/usr/src/app -w /usr/src/app rails rails new --skip-bundle --api --database postgresql .

clean-bundle-install:
	docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.7.5 bundle install

build:
	docker-compose build

up:
	docker-compose up

test:
	docker-compose run --rm webapp bash  -c "RAILS_ENV=test bin/rake"

clear-protect:
	sudo chown -R $USER:$USER .

local-ping:
	curl -I localhost

rails-console:
	docker-compose run --rm webapp bin/rails c
