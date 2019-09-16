import sys
sys.path.append("./script/")
import pandas as pd 
import pymysql
# UDF 
from utility import * 


def get_conn(mysql_config):
    """
    Connect to the database
    """
    # will replace with mysql_config soon 
    connection = pymysql.connect(host=mysql_config['host'],
                 user=mysql_config['user'],
                 password=mysql_config['password'],
                 db=mysql_config['dbname'],
                 charset='utf8mb4',
                 cursorclass=pymysql.cursors.DictCursor)
    return connection

def insert_to_table(df,tablename,connection):
    """
    insert data to mysql 
    """
    cols = "`,`".join([str(i) for i in df.columns.tolist()])
    for i,row in df.iterrows():
        try:
            with connection.cursor() as cursor:
                sql = "INSERT INTO {} (`" +cols + "`) VALUES (" + "%s,"*(len(row)-1) + "%s)"
                sql = sql.format(tablename)
                #print (sql)
                print ('insert ok')
                cursor.execute(sql, tuple(row))
                connection.commit()
        except Exception as e:
            print (e, 'insert failed')
    connection.close()
    cursor.close()


# mysql_config = parse_config('config/mysql.config')
# print (mysql_config)
# conn = get_conn(mysql_config)
# df = pd.read_csv('data/business_sample.csv')
# del df['Unnamed: 0']
# insert_to_table(df.head(10),'business2', conn )
