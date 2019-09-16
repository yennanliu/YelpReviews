#!/bin/sh
#################################################################
# SCRIPTS DUMP ALL CSV TO MYSQL    
#################################################################
python script/csv_2_mysql.py data/yelp_academic_dataset_business.csv  business
python script/csv_2_mysql.py data/yelp_academic_dataset_checkin.csv  checkin
#python script/csv_2_mysql.py data/yelp_academic_dataset_review.csv  review
# only dump review sample (1 M sub set), since it is a ~ 4G csv 
python script/csv_2_mysql.py data/yelp_academic_dataset_review_sample.csv  review  
python script/csv_2_mysql.py data/yelp_academic_dataset_tip.csv  tip
python script/csv_2_mysql.py data/yelp_academic_dataset_user.csv  user
