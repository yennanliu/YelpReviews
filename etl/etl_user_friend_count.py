import sys
sys.path.append("./utility/")
import os
import pyspark
import math 
from datetime import datetime
from pyspark.sql import SQLContext, Row
from pyspark import SparkContext
from pyspark.sql import functions as F
from pyspark.sql.session import SparkSession

os.environ['PYSPARK_SUBMIT_ARGS'] = '--packages com.amazonaws:aws-java-sdk-pom:1.7.4,org.apache.hadoop:hadoop-aws:2.7.6 pyspark-shell'
sc = SparkContext.getOrCreate()
sqlContext = pyspark.sql.SQLContext(sc)
spark = SparkSession(sc)

def main():
    """
    ETL get users' friend count 
    : input  :  json 
    : output :  spark dataframe
    """
    filename = "data/yelp_academic_dataset_user.json"
    DF = spark.read.json(filename)
    DF.printSchema()
    DF.createOrReplaceTempView("user")
    # SQL statements can be run by using the sql methods provided by spark
    #userDF = spark.sql("SELECT * from user limit 100")
    userDF = spark.sql("SELECT * from user")
    #userDF.show()
    user_rdd = userDF.rdd 
    friend_rdd = user_rdd.map(lambda x : [ x['user_id'], x['friends']] )\
                         .map(lambda x : [x[0], len(x[1].split(','))])
    print (friend_rdd.take(30))
    friend_df =  friend_rdd.toDF(['user_id','friend_count'])
    friend_df.show()

if __name__ == '__main__':
    main()
