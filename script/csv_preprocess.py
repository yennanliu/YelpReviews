import pandas as pd 

def transform_to_str(x):
     return '"{}"'.format(str(x))

def fix_column_type(df):
    for i in df.columns:
        if df[i].dtype not in ('float64', 'int64'):
            df[i] = df[i].map(transform_to_str)
    return df 


# biz  = pd.read_csv('business_sample.csv', index_col=False)
# df_ = fix_column_type(biz)
# df_.head(4)