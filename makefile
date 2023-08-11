DOCKER_USERNAME ?= tclayton
APPLICATION_NAME ?= copper-project
 
build:
         docker build --tag ${DOCKER_USERNAME}/${APPLICATION_NAME} .

# You can now run just 'make build' instead of 'docker build --tag username/hello-world' .
 or
# Build the container with docker-compose
build: ## Build the release and develoment container.
	docker-compose build $(APP_NAME)

# Build and run the container
up: ## Spin up the project
	docker-compose up --build $(APP_NAME)

IMAGE_NAME = my-nginx-container

build:
    docker build -t $(IMAGE_NAME) .

run:
    docker run -d -p 80:80 -p 443:443 $(IMAGE_NAME)

stop:
    docker stop $$(docker ps -q --filter ancestor=$(IMAGE_NAME))

clean:
    docker rm $$(docker ps -a -q --filter ancestor=$(IMAGE_NAME))
    docker rmi $(IMAGE_NAME)
