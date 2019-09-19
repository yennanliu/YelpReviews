# [YelpReviews](https://www.kaggle.com/yelp-dataset/yelp-dataset)

### INTRO 
> Build a POC data app that start from data source to final application.
Process : `data collect ` -> `data process` -> `db modeling` -> `data storage` -> `ETL` -> `data analysis / ML ` -> `data visualization`. This project will focus 
on :  1) database modeling / schema design (per business understanding, use cases) 2) data process 3) analysis that extract business insights 4) framework
design logic (why this database, why this schema, why this BI tool..)

* Tech : Python 3, Pyspark, Mysql/AWS RDS S3, Redash, Alembic, Docker 
* Data process  : [transform_all_json_2_csv.sh](https://github.com/yennanliu/YelpReviews/blob/master/script/transform_all_json_2_csv.sh)
* DB modeling  : [Alembic ddl](https://github.com/yennanliu/YelpReviews/tree/master/ddl)
* Data storage : [all_csv_2_mysql.sh](https://github.com/yennanliu/YelpReviews/blob/master/script/all_csv_2_mysql.sh)
* ETL  : [spark etl](https://github.com/yennanliu/YelpReviews/tree/master/etl)
* Analysis/data visualization  : [redash dashboard](https://app.redash.io/yen_dev/public/dashboards/xpfG9wKgb9qEcMHlGiSpjhFn8dCZuun8XbCN52GN)
* Presentation  : [YelpReview_DS_demo](https://github.com/yennanliu/YelpReviews/blob/master/doc/YelpReview_DS_demo.pdf)

### Framework
<img src ="https://github.com/yennanliu/YelpReviews/blob/master/doc/framework.png" width="800" height="400">


### DB model  
<details>
<summary>DB model</summary>

#### DB model 
<img src ="https://github.com/yennanliu/YelpReviews/blob/master/doc/db_model.png" width="800" height="400">

#### DB model V2
<img src ="https://github.com/yennanliu/YelpReviews/blob/master/doc/db_model_V2.png" width="800" height="400">

</details> 

### Visualization  
<details>
<summary>Visualization</summary>

<img src ="https://github.com/yennanliu/YelpReviews/blob/master/doc/dash.png" width="800" height="400">

</details>

### File structure 

```
├── README.md
├── alembic.ini      : configuration for alembic DB version control
├── config           : configuration  for database, RDS, s3...
├── data             : file saved Yelp dataset
├── db               : sql for redash dashboard, and analysis 
├── ddl              : alembic database migration (ddl/versions)
├── doc              : file for documentation 
├── etl              : Main ETL scripts 
├── redash           : Dockerfile redash env (BI tool)
├── requirements.txt : Needed python libraries 
├── script           : Scripts run data preprocess 
├── spark            : Dockerfile build spark env 
└── superset         : Dockerfile superset env (BI tool)

```


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
$ alembic init --template generic ddl &&  alembic upgrade head  # downgrade : $ alembic downgrade -1 
# STEP 2) data preprocess 
$ bash script/transform_all_json_2_csv.sh  # json to csv 
# csv -> mysql 
$ bash script/all_csv_2_mysql.sh
# STEP 3) spark etl
$ docker build spark/. -t spark_env 
$ bash etl/run_etl_digest_business.sh
$ bash etl/etl_user_friend_count.sh

```
</details>

### Development
<details>
<summary>Development</summary>

- `dev` 
</details> 


### TODO 
<details>
<summary>TODO</summary>

- Add tests 
- Dockerize all end to end applications (can run all functionalities offline)
- Tune spark code raise IO efficiency
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
- ML : Yelp review star prediction 
	 - https://github.com/ahegel/yelp-dataset/blob/master/Predicting%20Star%20Ratings.ipynb
- Yelp dataset db model design
	- https://paulx-cn.github.io/blog/6th_Blog/

</details>