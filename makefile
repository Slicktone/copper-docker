##If using windows, install chocolatey and run 'choco install make'

DOCKER_USERNAME ?= tclayton
APP_NAME ?= copper-docker

#run 'make build' to build

#Build the container with docker-compose
build:
	docker-compose build $(APP_NAME)

#Build and run the container
up:
	docker-compose up --build -d $(APP_NAME)

run:
	docker-compose run -d -p 80:80 -p 443:443 $(APP_NAME)

stop:
	docker stop $$(docker ps -q --filter ancestor=$(APP_NAME))

clean:
	docker rm $$(docker ps -a -q --filter ancestor=$(APP_NAME))
	docker rmi $(APP_NAME)
