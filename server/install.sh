#!/bin/bash

echo "Creating Docker internal networks."
docker network create nginx-proxy
docker network create mysql

echo "Starting server containers now."
docker-compose up -d