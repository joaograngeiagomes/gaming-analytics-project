USE DATABASE GAMING_DB;

USE WAREHOUSE GAMING_ANALYTICS_WH;

CREATE SCHEMA raw;

CREATE OR REPLACE STAGE GAMING_DB.raw.gaming_stage;


LIST @gaming_stage; -- Data was uploaded to Snowflake using an internal stage via the Snowflake UI.


----- USERS ------

CREATE OR REPLACE TABLE users (
    user_id INT,
    signup_date TIMESTAMP,
    country STRING,
    acquisition_channel STRING
);

----- SESSIONS ------

CREATE OR REPLACE TABLE sessions (
    session_id INT,
    user_id INT,
    session_start TIMESTAMP,
    session_end TIMESTAMP
);

----- EVENTS ------

CREATE OR REPLACE TABLE events (
    event_id INT,
    user_id INT,
    event_type STRING,
    event_timestamp TIMESTAMP
);

----- PURCHASES ------

CREATE OR REPLACE TABLE purchases (
    purchase_id INT,
    user_id INT,
    amount FLOAT,
    purchase_timestamp TIMESTAMP
);

