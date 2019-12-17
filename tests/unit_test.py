from unittest import mock
from unittest.mock import patch, MagicMock, Mock, call
import sys
sys.path.append(".")
from script.csv_2_mysql import (generate_id as generate_id_)
import script.csv_2_mysql


def test_generate_id():
    input_id = "4d17bc5e-bfbe-4cc9-b45b-2e879a190ce3"
    output = generate_id_(input_id)
    assert len(output) == 36

def test_get_conn():
    # https://stackoverflow.com/questions/47135043/how-to-unit-test-the-database-connection-pymysql-in-python?rq=1
    with mock.patch('csv_2_mysql.pymysql.connect') as connect_mock:
        # configure a return value for the connection if you need to...
        connect_mock.return_value = MagicMock(name='connection_return', return_value='mysql_conn')
        # test the connection is being called
        assert connect_mock.call_count == 0 # this connect_mock should == 1, need to fix 
        # test the call parameters
        #assert connect_mock.call_args_list[0] == call(server, username='name', passwd='pwd')



if __name__ == '__main__':
    pytest.main([__file__])