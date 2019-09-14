#!/bin/sh
#################################################################
# SCRIPTS TRANSFORM ALL JSON TO CSV    
#################################################################
echo '>>>> unzip json'
unzip data/yelp_academic_dataset_business.json.zip  data/yelp_academic_dataset_business.json
unzip data/yelp_academic_dataset_checkin.json.zip  data/yelp_academic_dataset_checkin.json
unzip data/yelp_academic_dataset_user.json.zip  data/yelp_academic_dataset_user.json
unzip data/yelp_academic_dataset_review.json.zip  data/yelp_academic_dataset_review.json
unzip data/yelp_academic_dataset_tip.json.zip  data/yelp_academic_dataset_tip.json

echo '>>>> json to csv'
python script/json_2_csv.py data/yelp_academic_dataset_business.json
python script/json_2_csv.py data/yelp_academic_dataset_checkin.json
python script/json_2_csv.py data/yelp_academic_dataset_user.json
python script/json_2_csv.py data/yelp_academic_dataset_review.json
python script/json_2_csv.py data/yelp_academic_dataset_tip.json


