#!/bin/sh
#################################################################
# SCRIPTS RUN ETL etl_user_friend_count VIA DOCKER 
#################################################################
docker run  --mount \
type=bind,\
source="$(pwd)"/.,\
target=/YelpReviews \
-i -t spark_env \
/bin/bash \
-c 'cd ../../YelpReviews && spark-submit etl/etl_user_friend_count.py'
