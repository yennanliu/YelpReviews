-- Create mysql db for yelp dataset 
CREATE DATABASE IF NOT EXISTS yelp;

-- Create yelp tip table 
use yelp; 
DROP TABLE IF EXISTS tip;
CREATE TABLE tip  (
     user_id CHAR(50),  
     business_id CHAR(50),   
     text  CHAR(100), 
     date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     compliment_count INT, 
     PRIMARY KEY (user_id)
        );