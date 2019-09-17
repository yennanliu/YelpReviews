# import pandas as pd 

# def transform_value_to_str(x):
#      return '"{}"'.format(str(x))

# def transform_byte_to_str(x):
#     try:
#         return x.decode("utf-8") 
#     except:
#         return x 

# def fix_column_type(df):
#     for i in df.columns:
#         if df[i].dtype not in ('float64', 'int64'):
#             #df[i] = df[i].map(transform_byte_to_str)
#             df[i] = df[i].map(transform_value_to_str)
#     return df 