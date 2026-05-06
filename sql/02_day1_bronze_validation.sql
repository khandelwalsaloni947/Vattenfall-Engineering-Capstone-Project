-- SHOW TABLES
SHOW TABLES IN vattenfall_dev.raw;

-- ROW COUNTS
SELECT 'market_prices' AS domain, COUNT(*) FROM vattenfall_dev.raw.bronze_market_prices
UNION ALL
SELECT 'weather', COUNT(*) FROM vattenfall_dev.raw.bronze_weather
UNION ALL
SELECT 'grid_events', COUNT(*) FROM vattenfall_dev.raw.bronze_grid_events
UNION ALL
SELECT 'reference', COUNT(*) FROM vattenfall_dev.raw.bronze_reference;

-- SCHEMA CHECK
DESCRIBE vattenfall_dev.raw.bronze_grid_events;

-- METADATA CHECK
SELECT ingestion_ts, source_system 
FROM vattenfall_dev.raw.bronze_grid_events
LIMIT 10;

-- DOMAIN CHECK
SELECT DISTINCT source_system 
FROM vattenfall_dev.raw.bronze_grid_events;