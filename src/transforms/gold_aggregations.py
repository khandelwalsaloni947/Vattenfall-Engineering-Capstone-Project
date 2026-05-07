from pyspark.sql import DataFrame
from pyspark.sql import functions as F

def aggregate_daily_market_summary(df: DataFrame) -> DataFrame:
    return (
        df.groupBy("report_day", "region")
          .agg(
              F.round(F.avg("price_eur_mwh"), 2).alias("avg_price_eur_mwh"),
              F.round(F.max("price_eur_mwh"), 2).alias("max_price_eur_mwh"),
              F.round(F.sum("volume_mwh"), 2).alias("total_volume_mwh")
          )
    )

def aggregate_grid_incidents(df: DataFrame) -> DataFrame:
    return (
        df.groupBy("event_day", "region", "severity_band")
          .agg(
              F.count("*").alias("incident_count"),
              F.sum("duration_minutes").alias("total_duration_minutes"),
              F.round(F.avg("duration_minutes"), 2).alias("avg_duration_minutes")
          )
    )