import pandas as pd 
import pymysql


def get_conn(mysql_config):
    """
    Connect to the database
    """
    # will replace with mysql_config soon 
    connection = pymysql.connect(host='localhost',
                 user='user',
                 password='passwd',
                 db='db',
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
        sql = "INSERT INTO tablename (`" +cols + "`) VALUES (" + "%s,"*(len(row)-1) + "%s)"
        cursor.execute(sql, tuple(row))
        connection.commit()
    except Exception as e:
        print (e, 'insert failed')
    finally:
        connection.close()

