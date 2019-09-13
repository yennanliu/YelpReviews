-- Create mysql db for yelp dataset 
CREATE DATABASE IF NOT EXISTS yelp;

-- Create yelp checkin table 
use yelp; 
DROP TABLE IF EXISTS checkin;
CREATE TABLE checkin  (
     business_id CHAR(50), 
     date  LONGTEXT, 
     PRIMARY KEY (business_id)
        );