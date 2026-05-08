# Regional Operations Dashboard — Requirements & Notes

## 1. Source Tables / Views
The dashboard pulls data from the following **Gold tables**:

| Table/View | Purpose |
|------------|---------|
| `gold_regional_operations_dashboard` | Daily region-level overview combining grid events, weather risk, and market prices |
| `gold_daily_market_summary` | Provides daily market KPIs by region |
| `gold_weather_impact_summary` | Provides daily weather metrics and risk signals by region |
| `gold_grid_events_summary` | Provides detailed grid incident counts and durations (optional for drill-down) |

**Views created for analyst consumption:**

| View Name | Source Table(s) | Purpose |
|-----------|-----------------|---------|
| `vw_regional_operations_dashboard` | `gold_regional_operations_dashboard` | Simplified view of key KPIs for daily dashboard |
| `vw_daily_incident_trends` | `gold_grid_events_summary` | Shows trends in grid incidents over time |
| `vw_market_weather_overview` | `gold_daily_market_summary`, `gold_weather_impact_summary` | Combines market and weather KPIs for correlation analysis |

---

## 2. Grain & Dimensions

| Dimension | Description |
|-----------|-------------|
| `report_day` | Date of the measurement (daily granularity) |
| `region` | Geographical region for which KPIs are aggregated |

**Grain:** `report_day x region`  
All metrics are aggregated at **daily per region** level.

---

## 3. Key KPIs / Metrics

| KPI | Table | Description |
|-----|-------|-------------|
| `incident_count` | `gold_regional_operations_dashboard` | Total grid incidents per day per region |
| `elevated_incident_count` | `gold_regional_operations_dashboard` | Number of high-severity incidents per day per region |
| `avg_market_price` | `gold_regional_operations_dashboard` / `gold_daily_market_summary` | Daily average market price per region |
| `weather_risk_signal` | `gold_regional_operations_dashboard` / `gold_weather_impact_summary` | Daily weather risk indicator (High/Medium/Low) |
| `max_market_price` | `gold_daily_market_summary` | Maximum market price observed in the day |
| `total_market_volume` | `gold_daily_market_summary` | Sum of market volume (MWh) per region |
| `high_alert_count` | `gold_weather_impact_summary` | Number of high-risk weather alerts per region |

---

## 4. Filtering & Aggregation Logic
- **Default filters:** Only include valid regions and non-null report days.
- **Aggregation logic:** 
  - `incident_count` and `elevated_incident_count` are summed per `report_day x region`.
  - `avg_market_price` is computed as weighted average by volume (if available).
  - Weather signals are derived from alert counts:
    - High alert → 1
    - Medium alert → 0
    - Low alert → 0
- **Analyst Drill-Downs:** 
  - By `region`
  - By `severity_band` for grid events
  - By `market_type` for market prices

---

## 5. Notes / Governance
- Gold tables are stored in **Unity Catalog**: `vattenfall_dev.gold.*`
- Views are created in the same catalog/schema for consumption.
- Access control:
  - Analysts: `SELECT` on views
  - Data engineers: `SELECT, INSERT, UPDATE` on Gold tables
- This ensures **read-only consumption for analytics** while protecting source transformations.