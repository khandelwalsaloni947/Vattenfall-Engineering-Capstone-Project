# Vattenfall Week 9 Capstone

## Project Theme

**Vattenfall — Energy Operations and Market Intelligence Lakehouse**

This project simulates a real-world Databricks-based data engineering solution. It integrates multiple data sources such as energy market prices, weather data, grid telemetry, and incident events to build a governed lakehouse architecture.

The goal is to transform raw data into structured, analytics-ready datasets using a Medallion Architecture (Bronze, Silver, Gold), enabling reporting, analytics, and business insights.

## Lakehouse Architecture

The project follows a **Medallion Architecture**:

* **Bronze Layer**
  Raw data ingestion using Databricks Auto Loader with minimal transformation.

* **Silver Layer**
  Data cleaning, validation, and standardization.

* **Gold Layer**
  Aggregated, business-level datasets for reporting and analytics.



## Data Domains

The following domains are ingested and processed independently:

* Energy Prices
* Weather Data
* Grid Telemetry
* Incident Events

Each domain follows a consistent ingestion and transformation pattern across layers.



## Day 1 Focus (Foundation)

Day 1 focused on building a strong engineering foundation:

* Defining project structure and repository layout
* Planning Bronze layer ingestion strategy
* Organizing raw data sources
* Designing governed storage structure
* Setting up documentation and configuration approach


## Day 2 Focus (Bronze Implementation)

Day 2 focuses on implementing the Bronze layer:

* Landing zone and checkpoint structure
* Auto Loader-based ingestion pipelines
* Creation of Bronze Delta tables
* Domain-based ingestion notebooks
* Basic data validation and logging

---

## Bronze Layer Strategy

* Data is ingested using **Databricks Auto Loader (cloudFiles)**
* Streaming ingestion is used (`readStream` / `writeStream`)
* Raw files are read from the landing zone
* Checkpoints are maintained for fault tolerance
* Data is written in **Delta format**
* Minimal transformations are applied
* Metadata columns are added:

  * `ingestion_time`
  * `source_file`



## Storage Structure

The project follows a governed storage layout:

/mnt/project/
-landing/        # Raw input files (by domain)
- checkpoint/     # Streaming checkpoints (by domain)
- bronze/         # Bronze Delta tables (by domain)



## Repository Structure

root/
- config/              # Configuration files (paths, parameters)
- docs/                # Architecture and design documentation
- sample_data/         # Raw input datasets (organized by domain)
- sql/                 # SQL queries for transformations
- src/                 # Reusable code modules
- notebooks/           # Databricks notebooks (Bronze ingestion, etc.)
- .github/workflows/   # CI/CD workflows
- README.md            # Project overview and documentation



## How to Use This Repository

This repository is structured to reflect a real-world data engineering project:

* Follow the Medallion Architecture for data flow
* Use notebooks for ingestion and transformations
* Keep logic modular and reusable
* Maintain clear separation between layers and domains
* Use configuration files to avoid hardcoding



## Week Identity

This week represents a transition from learning to real-world implementation. The focus is on building a production-style data platform with proper structure, governance, and scalability.



## Summary

By the end of this project, the repository will represent a scalable and well-structured lakehouse solution with:

* Clear data architecture
* Automated ingestion pipelines
* Organized data domains
* Production-style engineering practices

---
