import sys
sys.path.append(".")
from script.csv_2_mysql import (generate_id as generate_id_,
                                get_conn as get_conn_)



def test_generate_id():
    input_id = "4d17bc5e-bfbe-4cc9-b45b-2e879a190ce3"
    output = generate_id_(input_id)
    assert len(output) == 36

def test_get_conn():
    connection = get_conn_('config/mysql.config')
    print ("connection", connection)
    # assert connection["dbname"] == "yelp"
    # assert connection["driver"] == "com.mysql.jdbc.Driver"

if __name__ == '__main__':
    pytest.main([__file__])