-- Create mysql db for yelp dataset 
CREATE DATABASE IF NOT EXISTS yelp;

-- Create yelp business table 
use yelp; 
DROP TABLE IF EXISTS business;
CREATE TABLE business  (
     business_id CHAR(50), 
     name   LONGTEXT,
     address CHAR(100), 
     city CHAR(100), 
     state CHAR(20), 
     postal_code CHAR(50),
     latitude  CHAR(20), 
     longitude CHAR(20), 
     stars INT, 
     review_count INT, 
     is_open BOOLEAN, 
     attributes LONGTEXT,
     categories LONGTEXT,
     hours LONGTEXT,
     PRIMARY KEY (business_id)
        );