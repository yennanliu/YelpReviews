import sys
sys.path.append("./script/")
import pandas as pd 
import pymysql
import uuid 
# UDF 
from utility import * 

def generate_id(x):
    return str(uuid.uuid4())

def get_conn(mysql_config):
    """
    Connect to the database
    """
    connection = pymysql.connect(host=mysql_config['host'],
     user=mysql_config['user'],
     password=mysql_config['password'],
     db=mysql_config['dbname'],
     charset='utf8mb4',
     cursorclass=pymysql.cursors.DictCursor)
    return connection

def insert_to_table(df,table_name,connection):
    """
    insert data to mysql 
    """
    cols = "`,`".join([str(i) for i in df.columns.tolist()])
    for i,row in df.iterrows():
        try:
            with connection.cursor() as cursor:
                sql = "INSERT INTO {} (`" +cols + "`) VALUES (" + "%s,"*(len(row)-1) + "%s)"
                sql = sql.format(table_name)
                #print (sql)
                cursor.execute(sql, tuple(row))
                connection.commit()
                print ('insert ok')
        except Exception as e:
            print (e, 'insert failed')
    connection.close()
    cursor.close()

def main(csv_name, table_name):
    mysql_config = parse_config('config/mysql.config')
    conn = get_conn(mysql_config)
    df = pd.read_csv(csv_name, index_col=False)
    del df['Unnamed: 0']
    insert_to_table(df.head(10),table_name, conn)

if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
