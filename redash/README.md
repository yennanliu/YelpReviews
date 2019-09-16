## Redash as BI tool 

## Quick start 
```bash
cd ~ && git clone https://github.com/yennanliu/YelpReviews.git
cd ~ && cd YelpReviews/redash 
docker-compose run --rm server create_db -p 3306:3306 -p 5000:5000 \
  --name container --net host container
docker-compose up -d

```