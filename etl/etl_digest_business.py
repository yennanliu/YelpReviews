import sys
sys.path.append("./utility/")
import os
import pyspark
from pyspark.sql import SQLContext
from pyspark import SparkContext
from pyspark.sql.session import SparkSession

os.environ['PYSPARK_SUBMIT_ARGS'] = '--packages com.amazonaws:aws-java-sdk-pom:1.7.4,org.apache.hadoop:hadoop-aws:2.7.6 pyspark-shell'
sc = SparkContext.getOrCreate()
sqlContext = pyspark.sql.SQLContext(sc)
spark = SparkSession(sc)

def main():
    """
    ETL get business' open hours  (dict -> dataframe columns) 
    ETL get business' attribution (dict -> dataframe columns) 
    : input  :  json 
    : output :  spark dataframe
    """
    filename = "data/yelp_academic_dataset_business.json"
    DF = spark.read.json(filename)
    DF.printSchema()
    DF.createOrReplaceTempView("biz")
    # SQL statements can be run by using the sql methods provided by spark
    #bizDF = spark.sql("SELECT * from biz limit 10")
    bizDF = spark.sql("SELECT * from biz")
    #bizDF.show()
    bizrdd = DF.rdd 
    # >>>> get business work hours 
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
    # >>>> get business attribution 
    attr_ = bizrdd.map(lambda x : x['attributes'])\
                  .map(lambda x : x.asDict())\
                  .take(1)
    attr_col = list([ i.keys() for i in attr_ ][0])
    attr_rdd = bizrdd.map(lambda x : x['attributes'])\
          .filter(lambda x : x != None)\
          .map(lambda x : x.asDict())
    # workaround here : enlarge sampleRatio in order to sample more RDD to "guess" dataframe schema,
    # the formal method is : define schema explicitly 
    # https://stackoverflow.com/questions/36902665/saving-a-list-of-rows-to-a-hive-table-in-pyspark
    attr_df = attr_rdd.toDF(attr_col,sampleRatio=0.2)
    print (attr_df.show())

if __name__ == '__main__':
    main()