# Planiada - Self-Hosted Plane.so

This repository contains the configuration to self-host [Plane](https://plane.so/), an open-source project management tool, using Docker Compose.

## Prerequisites

- **Docker**
- **Docker Compose**
- **Make**

## Getting Started

1. **Clone the repository** (if you haven't already):
   ```bash
   git clone <your-repo-url>
   cd planiada
   ```

2. **Configure Environment Variables**:
   Copy the sample environment file and modify it according to your needs.
   ```bash
   cp .env.sample .env
   ```
   **Important Settings in `.env`**:
   - `APP_DOMAIN`: Ensure this is set to your server's domain or `localhost` for local usage.
   - `SECRET_KEY`: Generate a random secret string.
   - `LIVE_SERVER_SECRET_KEY`: Set a secure secret key for the live server.
   - Database, Redis, and RabbitMQ settings (default values should work for a local deployment).

3. **Start the Application**:
   Use the Makefile to manage the Docker containers.

   ```bash
   make up
   ```
   Once started, you can access Plane at the URL specified by `WEB_URL` (default: `http://localhost`).

## Makefile Commands

A `Makefile` is included to streamline the management of the Plane instance. Available commands:

- `make up` - Start all Plane services in detached mode.
- `make down` - Stop and remove all Plane containers.
- `make restart` - Restart all Plane services.
- `make logs` - View logs from all services (press `Ctrl+C` to exit).
- `make ps` - List running Plane containers.
- `make update` - Pull the latest images and restart the services.
- `make clean` - Stop services and remove their volumes (**WARNING: All data will be lost!**).

## Custom Deployment Script (`setup.sh`)

There is also a custom `setup.sh` script included in the repository that provides an interactive CLI for downloading updates, migrating data, backing up configurations, and managing services. However, for a streamlined Docker Compose workflow, the `Makefile` commands are recommended.
