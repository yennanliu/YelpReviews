# [YelpReviews](https://www.kaggle.com/yelp-dataset/yelp-dataset)

### Quick start
<details>
<summary>Quick start</summary>

```bash
# STEP 1) db migration 
$ alembic init --template generic ddl
# update db creds
$ nano +18 alembic.ini
# upgrade 
$ alembic upgrade head

# STEP 2) Download / transform data
# via kaggle 
$ bash script/download_all_json.sh 
# json -> csv 
$ bash script/transform_all_json_2_csv.sh 

# STEP 3) dump data into mysql 
# dev 
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