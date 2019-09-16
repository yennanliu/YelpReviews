#!/bin/sh
#################################################################
# SCRIPTS RUN ETL etl_digest_business VIA DOCKER 
#################################################################
# access spark shell 
#docker run --mount type=bind,source="$(pwd)"/.,target=/YelpReviews -it <container_id>  bash
# run etl via spark-submit
#docker run --mount type=bind,source="$(pwd)"/.,target=/YelpReviews -it <image_name>  /bin/bash -c 'cd ../../YelpReviews && spark-submit etl/etl_digest_business.py'
#docker run --mount type=bind,source="$(pwd)"/.,target=/YelpReviews -i -t  spark_env  /bin/bash -c 'cd ../../YelpReviews && spark-submit etl/etl_digest_business.py'
docker run  --mount \
type=bind,\
source="$(pwd)"/.,\
target=/YelpReviews \
-i -t spark_env \
/bin/bash \
-c 'cd ../../YelpReviews && spark-submit etl/etl_digest_business.py'
