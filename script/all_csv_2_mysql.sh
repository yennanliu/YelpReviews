#!/bin/sh
#################################################################
# SCRIPTS DUMP ALL CSV TO MYSQL    
#################################################################
python script/csv_2_mysql.py data/yelp_academic_dataset_business.csv  business
python script/csv_2_mysql.py data/yelp_academic_dataset_checkin.csv  checkin
python script/csv_2_mysql.py data/yelp_academic_dataset_review.csv  review 
python script/csv_2_mysql.py data/yelp_academic_dataset_tip.csv  tip
python script/csv_2_mysql.py data/yelp_academic_dataset_user.csv  user
