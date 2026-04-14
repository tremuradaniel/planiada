.PHONY: help up down restart logs ps update clean

# Default target
help:
	@echo "Available commands:"
	@echo "  make up       - Start all Plane services in detached mode"
	@echo "  make down     - Stop and remove all Plane containers"
	@echo "  make restart  - Restart all Plane services"
	@echo "  make logs     - View logs from all services (press Ctrl+C to exit)"
	@echo "  make ps       - List running Plane containers"
	@echo "  make update   - Pull the latest images and restart the services"
	@echo "  make clean    - Stop services and remove their volumes (WARNING: Data will be lost!)"

up:
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart

logs:
	docker compose logs -f

ps:
	docker compose ps

update:
	docker compose pull
	docker compose up -d

clean:
	@echo "WARNING: This will destroy all Plane data! Press Ctrl+C within 5 seconds to cancel."
	@sleep 5
	docker compose down -v
