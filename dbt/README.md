# dbt Layer – Gaming Analytics Project

This folder contains the transformation layer of the project, built using dbt.

## Tech Stack
- dbt
- Snowflake


## Overview

The dbt project is responsible for transforming raw data from Snowflake into clean, analysis-ready datasets.

The transformations follow a layered approach:

- **Staging (`stg_`)**  
  Cleans and standardizes raw data from source tables.

- **Core (Fact & Dimension tables)**  
  - `fct_*`: transactional data (events, purchases)  
  - `dim_*`: descriptive data (users)

- **Metrics**  
  Business-level aggregations such as:
  - Daily Active Users (DAU)
  - Revenue

## Data Flow
RAW → STAGING → MARTS


## Key Features

- Source definitions using `dbt source`
- Modular transformations using `ref()`
- Schema separation (RAW / STAGING / MARTS)
- Custom macro for schema naming

## How to Run

```bash
dbt run
dbt test
dbt docs generate
```