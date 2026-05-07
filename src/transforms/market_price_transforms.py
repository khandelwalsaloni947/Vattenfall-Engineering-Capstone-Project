from pyspark.sql import functions as F

def clean_market_prices(df):
    return df.withColumn("report_date", F.to_date("event_date"))