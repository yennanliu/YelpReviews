-- Create mysql db for yelp dataset 
CREATE DATABASE IF NOT EXISTS yelp;

-- Create yelp user table 
use yelp; 
DROP TABLE IF EXISTS user;
CREATE TABLE user  (
     user_id CHAR(50), 
     name   CHAR(50), 
     review_count INT, 
     yelping_since TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
     useful INT NULL, 
     funny INT NULL, 
     cool  INT NULL, 
     elite CHAR(100), 
     friends CHAR(255), 
     fans INT NULL, 
     average_stars FLOAT NULL, 
     compliment_hot  INT NULL, 
     compliment_more  INT NULL, 
     compliment_profile INT NULL, 
     compliment_cute  INT NULL, 
     compliment_list  INT NULL, 
     compliment_note  INT NULL, 
     compliment_plain INT NULL, 
     compliment_cool  INT NULL, 
     compliment_funny INT NULL,  
     compliment_writer INT NULL, 
     compliment_photos INT NULL, 
     PRIMARY KEY (user_id)
        );
