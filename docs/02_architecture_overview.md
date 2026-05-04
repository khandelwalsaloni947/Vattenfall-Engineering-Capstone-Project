# Architecture Overview

## Lakehouse Layers:

- Bronze → Raw ingestion from source files
- Silver → Cleaned and validated data
- Gold → Business-ready analytics tables

## Data Flow:

Raw CSV Files → Landing Zone → Bronze Tables → Silver Transformations → Gold Outputs

## Governance:
- Unity Catalog used for structure and access control