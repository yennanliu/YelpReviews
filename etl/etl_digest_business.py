sc = spark.sparkContext

if __name__ == '__main__':
    filename = "yelp_academic_dataset_business.json"
    DF = spark.read.json(filename)
    DF.printSchema()
    DF.createOrReplaceTempView("biz")
    # SQL statements can be run by using the sql methods provided by spark
    bizDF = spark.sql("SELECT * from biz limit 10")
    bizDF.show()
    bizrdd = DF.rdd 
    #bizrdd.map(lambda x : [x['city']] ).take(10)
    bizrdd.map(lambda x : (x['city'],1) )\
          .reduceByKey(lambda a, b : a+b).take(10)