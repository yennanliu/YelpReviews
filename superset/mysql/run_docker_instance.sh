#!/bin/sh
docker-compose up -d redis mysql
docker-compose up -d superset
docker-compose exec superset superset-demo