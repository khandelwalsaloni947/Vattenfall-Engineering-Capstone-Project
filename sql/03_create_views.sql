CREATE OR REPLACE VIEW vattenfall_dev.analytics.vw_regional_operations_dashboard AS
SELECT *
FROM vattenfall_dev.analytics.gold_regional_operations_dashboard;

CREATE OR REPLACE VIEW vattenfall_dev.analytics.vw_daily_incident_trends AS
SELECT *
FROM vattenfall_dev.analytics.gold_grid_incident_summary;