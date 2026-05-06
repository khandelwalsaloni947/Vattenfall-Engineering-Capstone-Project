# Day 2 — Bronze Layer Implementation

## Overview
Day 2 focuses on building the Bronze layer using Databricks and Unity Catalog.

The goal is to ingest raw data from multiple domains while preserving source fidelity and enabling scalable downstream processing.

---

## 🟫 Bronze Tables Created

| Table | Description |
|------|------------|
| bronze_market_prices | Energy market pricing data including price types and volumes |
| bronze_weather | Weather observations for energy demand correlation |
| bronze_grid_events | Operational grid events including severity and asset-level incidents |
| bronze_reference | Static reference and lookup data |

---

## 📂 Data Contents

### bronze_market_prices
- pricing data (day-ahead, intraday, balancing)
- timestamps and regions
- energy volumes and prices

### bronze_weather
- temperature, humidity, wind
- time-based environmental observations

### bronze_grid_events
- event_id (unique identifier)
- event_ts (event timestamp)
- asset_id (grid asset)
- event_type and severity
- duration_minutes
- source_system

### bronze_reference
- lookup datasets (static mappings)
- business reference values

---

## 🗂️ Storage Design

### Landing Paths
- `/landing/market_prices/`
- `/landing/weather/`
- `/landing/grid_events/`
- `/landing/reference/`

### Checkpoint Paths
- `/checkpoints/market_prices/`
- `/checkpoints/weather/`
- `/checkpoints/grid_events/`
- `/checkpoints/reference/`

---

## ⚙️ Ingestion Strategy

| Domain | Method |
|------|------|
| market_prices | Auto Loader (streaming) |
| weather | Auto Loader (streaming) |
| grid_events | Auto Loader (streaming) |
| reference | Batch load |

---

## 🧾 Metadata Handling

Each Bronze table includes:

- ingestion_ts → ingestion timestamp
- source_system → domain identifier

These fields support traceability and debugging.

---

## ✅ Validation Performed

The following validations were executed:

### 1. Table Existence
- Verified all Bronze tables are created in Unity Catalog

### 2. Row Counts
- Ensured data is successfully ingested

### 3. Schema Validation
- Confirmed expected schema per domain
- Removed unexpected columns from earlier runs

### 4. Metadata Validation
- ingestion_ts present
- source_system present

### 5. Domain Integrity
- Each table contains only its domain data
- No cross-domain mixing observed

### 6. SQL Validation
- Created reusable SQL validation script:
  `/sql/bronze_validation.sql`

---

## 🧠 Key Engineering Decisions

- Used Auto Loader for scalable ingestion
- Used batch load for static reference data
- Maintained strict domain separation
- Reset schema/checkpoints when needed to avoid corruption
- Enforced clean Bronze schema for downstream reliability

---

## 🚀 Outcome

The Bronze layer is now:

- stable
- scalable
- well-structured
- validated
- ready for Silver transformations

---