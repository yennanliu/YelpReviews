
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
    filename = "data/yelp_academic_dataset_business.json"
    DF = spark.read.json(filename)
    DF.printSchema()
    DF.createOrReplaceTempView("biz")
    # SQL statements can be run by using the sql methods provided by spark
    bizDF = spark.sql("SELECT * from biz limit 10")
    #bizDF.show()
    bizrdd = DF.rdd 
    #bizrdd.map(lambda x : [x['city']] ).take(10)
    cols = ['biz_id', 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'] 
    hours_df = bizrdd.map(lambda x : [x['business_id'],x['hours']])\
             .filter(lambda x : x[1]!=None)\
             .map(lambda x : 
             [x[0], 
             x[1]['Monday'],
             x[1]['Tuesday'],
             x[1]['Wednesday'],
             x[1]['Thursday'],
             x[1]['Friday'],
             x[1]['Saturday'],
             x[1]['Sunday']])\
              .toDF(cols)
    print(hours_df.show())

if __name__ == '__main__':
    main()