import logging
import os
import pyspark
from pyspark.sql import SQLContext
from pyspark import SparkContext
from pyspark.sql.session import SparkSession

def get_SparkSession():
    #os.environ['PYSPARK_SUBMIT_ARGS'] = '--packages com.amazonaws:aws-java-sdk-pom:1.7.4,org.apache.hadoop:hadoop-aws:2.7.6 pyspark-shell'
    sc = SparkContext.getOrCreate()
    sqlContext = pyspark.sql.SQLContext(sc)
    spark = SparkSession(sc) 
    return sc, sqlContext, spark 

def suppress_py4j_logging():
    logger = logging.getLogger("py4j")
    logger.setLevel(logging.WARN)

def create_pyspark_session():
    return (SparkSession.builder
            .master("local[2]")
            .appName("my-local-pyspark-context")
            .enableHiveSupport()
            .getOrCreate())