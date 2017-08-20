# docker-php
Complete PHP Docker development environment with automated Nginx proxy, PHP 7.1  Apache, MySQL 5.7 and Portainer.

Containers within the root `/services` directory are meant to be global services, by default this includes the nginx proxy (by `jwilder/nginx-proxy`) and Portainer (by `portainer/portainer`) to manage Docker within a remotely accessible GUI.

### Preperation
1. Install or update Docker and Docker Compose.
2. `docker network create nginx-proxy` to connect other containers to the reverse proxy.
3. Start Portainer and the nginx proxy by `docker-compose up -d` inside both directories.
4. Go to `/applications/php` and update the MySQL environmental variables to set your database credentials.
5. Add your application code to the existing `src` directory, the `public` directory is what is going to be visible on your website.
6. Run `docker-compose up -d` to start your PHP application.

#### Database
The host of your database application will be just `mysql`.

### Default configurations
In order to change your endpoints you must edit `docker-compose.yml` and change the domain in `VIRTUAL_HOST`.

- Portainer will be running on `portainer.dev`
- The PHP application will be running on `php.dev`

PHP, MySQL and Apache configurations can be found inside the `services` directory inside the `application/php` directory.

## Disclaimer
This Docker setup is provided free of charge and you can do whatever you want with it. The author is not responsible for data loss or any other problems resulting from the use of this Docker setup.