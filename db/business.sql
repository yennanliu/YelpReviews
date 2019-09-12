-- Create mysql db for yelp dataset 
CREATE DATABASE IF NOT EXISTS yelp;

-- Create yelp business table 
use yelp; 
DROP TABLE IF EXISTS business;
CREATE TABLE business  (
     business_id CHAR(50), 
     name   CHAR(50), 
     address CHAR(100), 
     city CHAR(10), 
     state CHAR(10), 
     postal_code INT,
     latitude  FLOAT NULL,
     longitude FLOAT NULL, 
     stars INT, 
     review_count INT, 
     is_open BOOLEAN, 
     attributes CHAR(100),  
     categories CHAR(100), 
     hours FLOAT NULL, 
     PRIMARY KEY (business_id)
        );