# YelpReviews

### Quick start
```bash
# db migration 
alembic init --template generic alembic
# update db creds
nano +18 alembic.ini
# upgrade 
alembic upgrade head
# downgrade 
alembic downgrade -1
# create the other table 
alembic revision -m "create checkin"


```

### Ref
- Yelp dataset 
	- https://www.kaggle.com/yelp-dataset/yelp-dataset
	- https://www.yelp.com/dataset/documentation/main
	- https://github.com/Yelp/dataset-examples
- Superset connect to s3 transformed athena
	- https://dev.classmethod.jp/cloud/aws/query-and-visualize-data-from-amazon-athena-with-superset/
	- https://medium.com/payscale-tech/how-to-get-apache-superset-to-connect-to-athena-6d9b56bec7fb
