# Gaming Analytics Project

This project simulates an end-to-end data pipeline for a mobile gaming application.

## Overview
Synthetic data is generated to mimic real user behavior, including:
- User signups
- Sessions
- In-game events
- Purchases

## Tech Stack
- Python (data generation)
- dbt (data transformation)
- Snowflake (data warehouse)

## Data Model
The project includes the following datasets:
- users
- sessions
- events
- purchases

## Data Ingestion 
Data ingestion is simulated using CSV files. In a production environment, this would be handled by tools like Fivetran or Airbyte connecting operational databases or APIs to Snowflake.
Raw data is loaded into Snowflake using SQL scripts and staged CSV files that were uploaded using an internal stage via the Snowflake UI.

##  Project Structure
```
gaming-project/
├── data/
├── scripts/
├── sql/
├── notebooks/
└── README.md
```
##


## How to Run

```bash
python scripts/generate_data.py