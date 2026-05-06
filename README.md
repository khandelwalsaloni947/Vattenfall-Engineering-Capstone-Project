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




---