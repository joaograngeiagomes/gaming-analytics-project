# 🎮 Gaming Analytics Data Pipeline (dbt + Snowflake)

## 📌 Overview

This project simulates an end-to-end data pipeline for a gaming company, covering data ingestion, transformation, and analytics.

The goal is to transform raw event data into actionable business insights such as user engagement, revenue, and retention.

---

## 🏗️ Architecture

```
RAW → STAGING → MARTS → METRICS
```

* **RAW**: Ingested CSV data (users, events, sessions, purchases)
* **STAGING**: Cleaned and standardized data models (`stg_*`)
* **MARTS (Core)**:

  * `fct_events` – user activity events
  * `fct_purchases` – transactions
  * `dim_users` – user attributes
* **MARTS (Metrics)**:

  * `dau` – Daily Active Users
  * `revenue` – daily revenue
  * `retention` – cohort retention analysis
  * `retention_pivot` – dashboard-ready retention table

---

## ⚙️ Tech Stack

* **Snowflake** – data warehouse
* **dbt** – data transformation & modeling
* **Python (pandas)** – synthetic data generation
* **GitHub** – version control

---

## 📊 Key Analytics

### 🔹 Daily Active Users (DAU)

Tracks user engagement over time.

### 🔹 Revenue

Aggregates purchase data to measure monetization.

### 🔹 Cohort Retention

Analyzes how users return over time after their first activity.

### 🔹 7-Day Retention Pivot

Transforms retention into a matrix format for dashboards.

---

## 🔗 Data Lineage (dbt Docs)

The project includes full dbt documentation with lineage tracking:

* Source → Staging → Fact/Dim → Metrics
* Column-level documentation
* Model dependencies

---

## 🚀 How to Run

```bash
dbt run
dbt test
dbt docs generate
dbt docs serve
```

---

## 💡 Key Learnings

* Built a layered data architecture (RAW → STAGING → MARTS)
* Designed fact and dimension models
* Implemented business metrics (DAU, revenue, retention)
* Created cohort retention analysis with pivot for dashboards
* Documented models using dbt

---

## 📈 Future Improvements

* Build a dashboard (Power BI / Tableau)
* Add incremental models for scalability
* Introduce surrogate keys and SCD handling

---

## 👤 Author

João Grangeia Gomes

