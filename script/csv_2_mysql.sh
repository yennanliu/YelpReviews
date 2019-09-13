#!/bin/bash

# show commands being executed, per debug
set -x

# define database connectivity
_db="yelp"
_db_user="mysql_user"
_db_password="0000"

# define directory containing CSV files
_csv_directory=$(pwd)/data

# go into directory
#cd $_csv_directory

# get a list of CSV files in directory
#_csv_files=`ls -1 *.csv`
#_csv_files=`ls -1 business_sample.csv`
_csv_files=business_sample.csv



# loop through csv files
for _csv_file in ${_csv_files[@]}
do

  # remove file extension
  _csv_file_extensionless=`echo $_csv_file | sed 's/\(.*\)\..*/\1/'`

  # define table name
  #_table_name="${_csv_file_extensionless}"
  _table_name=business


  # get header columns from CSV file
  #_header_columns=`head -1 $_csv_directory/$_csv_file | tr ',' '\n' | sed 's/^"//' | sed 's/"$//' | sed 's/ /_/g'`
  #_header_columns_string=`head -1 $_csv_directory/$_csv_file | sed 's/ /_/g' | sed 's/"//g'`
  #_header_columns_string=address,attributes,business_id,categories,city,hours,is_open,latitude,longitude,name,postal_code,review_count,stars,state

  # ensure table exists
#   mysql -u $_db_user -p$_db_password $_db << eof
#     CREATE TABLE IF NOT EXISTS \`$_table_name\` (
#       id int(11) NOT NULL auto_increment,
#       PRIMARY KEY  (id)
#     ) ENGINE=MyISAM DEFAULT CHARSET=latin1
# eof

    # add column
    #mysql -u $_db_user -p$_db_password $_db --execute="alter table \`$_table_name\` add column \`$_header\` text"

  done

  # import csv into mysql
  mysqlimport --ignore-lines=1 --fields-enclosed-by='"' --fields-terminated-by=',' --lines-terminated-by="\n" --columns=$_header_columns_string -u $_db_user -p$_db_password $_db  $_csv_directory/$_csv_file

done
exit