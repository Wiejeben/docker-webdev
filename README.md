# Docker PHP
Complete PHP Docker development environment with Nginx proxy and Portainer as central services and PHP 7.1 Apache, MySQL 5.7 with Redis for PHP development.

Containers within the root `/services` directory are meant to be global services, by default this includes `jwilder/nginx-proxy` and `portainer/portainer` to manage Docker within a remotely accessible GUI.

### Preparation
1. Install or update Docker and Docker Compose.
2. `docker network create nginx-proxy` to connect other containers to the reverse proxy.
3. Start Portainer and the nginx proxy by `docker-compose up -d` inside both `/services` directories.
4. Go to `/php` and update the `.env` file to configure the database and virtual host.
5. The `public` directory within your PHP application is what is what is going to be visible from the outside.
6. Run `docker-compose up -d` to start your PHP application.

## Disclaimer
This Docker setup is provided free of charge and you can do whatever you want with it. The author is not responsible for data loss or any other problems resulting from the use of this Docker setup.