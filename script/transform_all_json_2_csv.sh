#!/bin/sh
#################################################################
# SCRIPTS TRANSFORM ALL JSON TO CSV    
#################################################################
python script/json_2_csv.py data/yelp_academic_dataset_business.json
python script/json_2_csv.py data/yelp_academic_dataset_checkin.json
python script/json_2_csv.py data/yelp_academic_dataset_user.json
python script/json_2_csv.py data/yelp_academic_dataset_review.json
python script/json_2_csv.py data/yelp_academic_dataset_tip.json


