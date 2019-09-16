# [YelpReviews](https://www.kaggle.com/yelp-dataset/yelp-dataset)

### Prerequisites
<details>
<summary>Prerequisites</summary>

1. Fork the repo :  `git clone https://github.com/yennanliu/YelpReviews.git`
2. Download [Kaggle dataset](https://www.kaggle.com/yelp-dataset/yelp-dataset) and and save at [data file](https://github.com/yennanliu/YelpReviews/tree/master/data)
3. Download/launch mysql server local, and create a database `yelp` (for development)
4. Set up AWS RDS mysql database (for prodution, `optional`)
5. Modify [mysql db config](https://github.com/yennanliu/YelpReviews/blob/master/config/mysql.config) with yours 
6. Modify [RDS mysql db config](https://github.com/yennanliu/YelpReviews/blob/master/config/mysql_rds.config) with yours  (`optional`)
7. Modify DB connection (e.g. `sqlalchemy.url = <your_mysql_url>`)in [alembic.ini](https://github.com/yennanliu/YelpReviews/blob/master/alembic.ini) with yours 
</details>

### Quick start
<details>
<summary>Quick start</summary>

```bash
# STEP 0) install libraries 
$ cd ~ && cd YelpReviews && git install -r requirements.txt 
# STEP 1) db migration 
$ alembic init --template generic ddl &&  alembic upgrade head
# STEP 2) data preprocess 
$ bash script/transform_all_json_2_csv.sh  # json to csv 
# csv -> mysql 
# STEP 3) spark etl
docker build spark/. -t spark_env 
# access spark shell 
#docker run --mount type=bind,source="$(pwd)"/.,target=/YelpReviews -it <container_id>  bash
# run etl via spark-submit
docker run --mount type=bind,source="$(pwd)"/.,target=/YelpReviews -it <container_id>  /bin/bash -c 'cd ../../YelpReviews && spark-submit etl/etl_digest_business.py'
```
</details>


### Ref
<details>
<summary>Ref</summary>

- Yelp dataset 
	- https://www.kaggle.com/yelp-dataset/yelp-dataset
	- https://www.yelp.com/dataset/documentation/main
	- https://github.com/Yelp/dataset-examples
- Superset connect to s3 transformed athena
	- https://dev.classmethod.jp/cloud/aws/query-and-visualize-data-from-amazon-athena-with-superset/
	- https://medium.com/payscale-tech/how-to-get-apache-superset-to-connect-to-athena-6d9b56bec7fb
- alembic mysql migration 
	 - https://michaelheap.com/alembic-python-migrations-quick-start/
- Redash docker
	- https://github.com/kakakakakku/redash-hands-on
</details>