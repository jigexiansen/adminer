.PHONY: help build run stop clean dev test lint restart logs shell release install status up down

# Variables
IMAGE_NAME = adminer
CONTAINER_NAME = adminer

# Default target
help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build the Docker image
	docker build -t $(IMAGE_NAME):latest -f docker/Dockerfile .

run: ## Run the container (use 'make run -p 8080' for web access)
ifeq ($(filter -p,$(MAKECMDGOALS)),-p)
	@port=$(filter-out run -p,$(MAKECMDGOALS)); \
	if [ -z "$$port" ]; then port=8080; fi; \
	docker run -d --name $(CONTAINER_NAME) -p $$port:80 $(IMAGE_NAME):latest; \
	echo "Container started with web access: http://localhost:$$port"
else
	docker run -d --name $(CONTAINER_NAME) $(IMAGE_NAME):latest
	@echo "Container started (internal access only)"
endif

-p %:
	@:

dev: ## Run in development mode (internal access only)
	docker-compose up -d

stop: ## Stop the container
	docker stop $(CONTAINER_NAME) || true

clean: ## Remove container and image
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true
	docker rmi $(IMAGE_NAME):latest || true

restart: ## Restart the container (use 'make restart -p 8080' for web access)
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true
ifeq ($(filter -p,$(MAKECMDGOALS)),-p)
	@port=$(filter-out restart -p,$(MAKECMDGOALS)); \
	if [ -z "$$port" ]; then port=8080; fi; \
	docker run -d --name $(CONTAINER_NAME) -p $$port:80 $(IMAGE_NAME):latest; \
	echo "Container restarted with web access: http://localhost:$$port"
else
	docker run -d --name $(CONTAINER_NAME) $(IMAGE_NAME):latest
	@echo "Container restarted (internal access only)"
endif

logs: ## Show container logs
	docker logs -f $(CONTAINER_NAME)

shell: ## Access container shell
	docker exec -it $(CONTAINER_NAME) bash

test: ## Run tests
	docker run --rm $(IMAGE_NAME):latest php -l /var/www/html/index.php

lint: ## Lint PHP files
	find src -name "*.php" -exec php -l {} \;

release: ## Build and save image as tar
	$(MAKE) build
	mkdir -p dist
	docker save $(IMAGE_NAME):latest -o dist/adminer-image.tar
	@echo "Image saved to dist/adminer-image.tar"

install: ## Load image from tar file
	@if [ ! -f dist/adminer-image.tar ]; then \
		echo "Error: dist/adminer-image.tar not found. Run 'make release' first."; \
		exit 1; \
	fi
	docker load -i dist/adminer-image.tar

status: ## Show container status
	docker ps -a | grep $(CONTAINER_NAME) || echo "Container not found"

# Development helpers
up: dev ## Alias for dev
down: ## Stop development environment
	docker-compose down 