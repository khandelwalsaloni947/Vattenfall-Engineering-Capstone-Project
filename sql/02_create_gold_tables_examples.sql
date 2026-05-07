CREATE OR REPLACE TABLE vattenfall_dev.analytics.gold_daily_market_summary AS
SELECT
  report_day,
  region,
  ROUND(AVG(price_eur_mwh), 2) AS avg_price_eur_mwh,
  ROUND(MAX(price_eur_mwh), 2) AS max_price_eur_mwh,
  ROUND(SUM(volume_mwh), 2) AS total_volume_mwh
FROM vattenfall_dev.refined.silver_market_prices
GROUP BY report_day, region;

CREATE OR REPLACE TABLE vattenfall_dev.analytics.gold_grid_incident_summary AS
SELECT
  event_day,
  region,
  severity_band,
  COUNT(*) AS incident_count,
  SUM(duration_minutes) AS total_duration_minutes,
  ROUND(AVG(duration_minutes), 2) AS avg_duration_minutes
FROM vattenfall_dev.refined.silver_grid_events
GROUP BY event_day, region, severity_band;