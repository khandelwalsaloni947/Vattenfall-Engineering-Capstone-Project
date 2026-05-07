# Vattenfall Energy Operations & Market Intelligence Capstone

## 📌 Project Overview
This project implements a modern data engineering pipeline using Databricks and Unity Catalog.

The objective is to ingest, process, and analyze energy market and operational data across multiple domains.

## 🏗️ Architecture
The pipeline follows a Medallion Architecture:

- Bronze Layer → Raw ingestion using Auto Loader / Batch
- Silver Layer → Cleaned and structured data
- Gold Layer → Business-level analytics

## 📂 Domains
- market_prices
- weather
- grid_events
- reference

## ⚙️ Technologies Used
- Databricks
- PySpark
- Delta Lake
- Unity Catalog
- Auto Loader

## 🟫 Bronze Layer (Day 2)
The Bronze layer is responsible for ingesting raw data while preserving source fidelity.

### Key Features:
- Domain-based ingestion pipelines
- Auto Loader for streaming ingestion
- Batch ingestion for reference data
- Metadata tracking (ingestion_ts, source_system)
- Schema management and checkpointing

### Storage Design:
- Landing: `/Volumes/{catalog}/raw/landing/{domain}/`
- Checkpoints: `/Volumes/{catalog}/raw/checkpoints/{domain}/`

## ✅ Validation
Bronze layer validation ensures:
- Tables are created
- Data is successfully ingested
- Schema integrity is maintained
- Metadata is present
- Domain boundaries are preserved

Validation is implemented using:
- Databricks notebooks
- SQL validation scripts (`/sql/bronze_validation.sql`)

## 📅 Day 2 Summary

Implemented Bronze ingestion pipelines for all domains
- Designed governed landing and checkpoint structure
- Used Auto Loader for streaming ingestion
- Implemented batch ingestion for reference data
- Created Delta Bronze tables
- Added ingestion metadata
- Performed validation using notebooks and SQL
- Documented full Bronze architecture

## 🚀 Next Steps
- Build Silver Layer transformations
- Implement data quality rules
- Create Gold analytics tables



# Day 3 Submission — Silver Layer Build

## Completed Work

Today’s work focused on building the Silver layer from Bronze data across multiple domains:

### Silver Tables Created
- silver_market_prices
- silver_weather
- silver_grid_events
- silver_asset_reference
- silver_regional_operations_base (integrated dataset)

---

## Key Transformations Performed

- Cleaned and standardized raw Bronze datasets
- Fixed data types (timestamps, dates, numeric fields)
- Removed `_rescued_data` and irrelevant columns
- Normalized categorical fields (region, severity, event_type)
- Created derived fields like:
  - event_day
  - severity_band (UDF-based classification)
- Ensured consistent join keys (asset_id, region)

---

## Integrated Dataset

`siver_regional_operations_base` combines:
- Grid events
- Asset reference data
- Regional context

It enables cross-domain analysis such as:
- Asset failure tracking
- Regional operational risk analysis
- Event severity impact assessment

---

## Validation Performed

- Row count checks across all Silver tables
- Null value validation on key columns
- Schema inspection for consistency
- Join validation between grid events and assets
- Sample data verification

---

## Outcome

The Silver layer is now:
- Clean
- Consistent
- Join-ready
- Analytics-ready

This completes Day 3 milestone successfully.



---