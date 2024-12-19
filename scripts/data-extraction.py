import requests
import pandas as pd

url = 'https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY_ADJUSTED&symbol=IBM&apikey=demo'
r = requests.get(url)
data = r.json()
df=pd.DataFrame(data['Weekly Adjusted Time Series']).T
pd.set_option('display.width', 1000)

df.columns = [col.split(' ', 1)[-1] for col in df.columns]
df=df.dropna()
pd.set_option('display.max_rows', None)

# If you want to remove column limit too
pd.set_option('display.max_columns', None)

df = df.reset_index()
df.rename(columns={df.columns[0]: 'date'}, inplace=True)

df.to_csv(r'C:\Stock Market Trends\data\stock_data.csv', index=False)

print(df)