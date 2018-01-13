# Docker PHP
Complete PHP Docker development environment with NGINX proxy and Portainer as services and PHP 7.1 FPM, NGINX, MySQL 5.7 with Redis as a boilerplate for PHP projects.

Containers within the root directory are meant to be global services, by default this includes `jwilder/nginx-proxy` and `portainer/portainer` to manage Docker within a remotely accessible GUI.

### Installation
1. Run `server/install.sh` to create the nessecary Docker networks and start the MySQL, NGINX and Portainer containers.
2. Copy the application you need for your setup from `applications` to your project.
3. Update the `.env` file to work for your application.
4. Run `docker-compose up -d` to start your application.

## Disclaimer
This Docker setup is provided free of charge and you can do whatever you want with it. The author is not responsible for data loss or any other problems resulting from the use of this Docker setup.