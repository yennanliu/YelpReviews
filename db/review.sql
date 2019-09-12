-- Create mysql db for yelp dataset 
CREATE DATABASE IF NOT EXISTS yelp;

-- Create yelp review table 
use yelp; 
DROP TABLE IF EXISTS review;
CREATE TABLE review  (
     review_id CHAR(50), 
     user_id CHAR(50),  
     business_id CHAR(50),  
     stars INT NULL, 
     useful INT NULL, 
     funny INT NULL, 
     cool  INT NULL, 
     text  CHAR(100), 
     date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (review_id)
        );
