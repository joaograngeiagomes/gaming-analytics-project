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

##  Project Structure

gaming-project/
├── data/
├── scripts/
│ └── generate_data.py
├── notebooks/
└── README.md

##


## How to Run

```bash
python scripts/generate_data.py