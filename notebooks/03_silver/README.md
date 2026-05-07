# Silver Layer

This folder contains cleaned, standardized, and analytics-ready datasets created from Bronze data.
The Silver layer improves data quality, consistency, and usability for downstream analytics and reporting.

---

## Silver Tables

- **silver_market_prices**
  - Cleaned electricity price and volume data
  - Standardized event dates and regions

- **silver_weather**
  - Cleaned weather observations
  - Fixed measurement types and invalid values
  - Added structured date fields

- **silver_grid_events**
  - Cleaned grid event logs
  - Standardized severity and event types
  - Added derived field: severity_band
  - Parsed timestamps into event_day

- **silver_asset_reference**
  - Master asset lookup table
  - Standardized asset_id, region, and asset_type
  - Used as join reference for all operational datasets

- **silver_regional_operations_base**
  - Integrated dataset combining:
    - grid events
    - asset reference
    - region context
  - Used for cross-domain operational analytics

---

## Data Cleaning & Transformations

- Removed `_rescued_data` and unnecessary columns
- Standardized categorical fields (region, event_type, severity)
- Converted string timestamps into proper date/timestamp formats
- Created derived fields (event_day, severity_band)
- Handled nulls and inconsistent values
- Ensured clean join keys (asset_id, region)

---

## Integrated Dataset Purpose

`silver_regional_operations_base` is the main analytical dataset for Day 4.

It enables:
- Operational performance analysis
- Asset-level failure tracking
- Regional risk assessment
- Cross-domain reporting (grid + assets + regions)

---

## Validation Summary

- Row counts validated across Silver tables
- Null checks performed on key columns (asset_id, region, event_type)
- Join integrity verified between grid events and asset reference
- Schema consistency confirmed
- Sample data inspected for correctness

**Result:** Silver layer is clean, consistent, and analytics-ready.

---

## Why Silver Layer

The Silver layer acts as a trusted bridge between raw (Bronze) data and final (Gold) analytics models.

It ensures:
- Data quality and consistency
- Reusable business logic
- Reliable join keys for integration
- Cleaner datasets for reporting and modeling