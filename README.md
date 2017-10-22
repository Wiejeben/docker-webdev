# Docker PHP
Complete PHP Docker development environment with NGINX proxy and Portainer as services and PHP 7.1 FPM, NGINX, MySQL 5.7 with Redis as a boilerplate for PHP projects.

Containers within the root directory are meant to be global services, by default this includes `jwilder/nginx-proxy` and `portainer/portainer` to manage Docker within a remotely accessible GUI.

### Preparation
1. Install or update Docker and Docker Compose.
2. `docker network create nginx-proxy` to connect other containers to the reverse proxy.
3. Start Portainer and the nginx proxy by `docker-compose up -d` inside the `service/` directory.
4. Go to `boilerplate/web/` and update the `.env` file to work for your application.
5. The `public/` directory within the boilerplate is what is what is going to be visible from the outside.
6. Run `docker-compose up -d` to start your PHP application.

## Disclaimer
This Docker setup is provided free of charge and you can do whatever you want with it. The author is not responsible for data loss or any other problems resulting from the use of this Docker setup.