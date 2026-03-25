import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import random
import os


np.random.seed(42)

# -------------------
# CONFIG
# -------------------
N_USERS = 50000
START_DATE = datetime(2024, 1, 1)
DAYS = 90

countries = ["US", "UK", "DE", "FR", "PT", "ES"]
channels = ["organic", "facebook_ads", "google_ads", "tiktok_ads"]

# -------------------
# USERS
# -------------------
users = []

for user_id in range(1, N_USERS + 1):
    signup_offset = np.random.randint(0, DAYS)
    signup_date = START_DATE + timedelta(days=int(signup_offset))

    users.append({
        "user_id": user_id,
        "signup_date": signup_date,
        "country": random.choice(countries),
        "acquisition_channel": random.choice(channels)
    })

users_df = pd.DataFrame(users)

# -------------------
# SESSIONS + EVENTS + PURCHASES
# -------------------
sessions = []
events = []
purchases = []

session_id = 1
event_id = 1
purchase_id = 1

for _, user in users_df.iterrows():
    active_days = np.random.geometric(p=0.2)  # churn model
    active_days = min(active_days, 30)

    for day in range(active_days):
        if np.random.rand() < 0.6:  # probability user returns
            session_date = user["signup_date"] + timedelta(days=day)

            n_sessions = np.random.randint(1, 4)

            for _ in range(n_sessions):
                start_time = session_date + timedelta(
                    hours=np.random.randint(0, 24),
                    minutes=np.random.randint(0, 60)
                )
                duration = np.random.randint(5, 60)
                end_time = start_time + timedelta(minutes=duration)

                sessions.append({
                    "session_id": session_id,
                    "user_id": user["user_id"],
                    "session_start": start_time,
                    "session_end": end_time
                })

                # EVENTS
                n_events = np.random.randint(3, 10)
                for _ in range(n_events):
                    event_type = np.random.choice(
                        ["login", "level_start", "level_complete", "purchase"],
                        p=[0.2, 0.4, 0.3, 0.1]
                    )

                    event_time = start_time + timedelta(
                        minutes=np.random.randint(0, duration)
                    )

                    events.append({
                        "event_id": event_id,
                        "user_id": user["user_id"],
                        "event_type": event_type,
                        "event_timestamp": event_time
                    })

                    # PURCHASE
                    if event_type == "purchase" and np.random.rand() < 0.3:
                        amount = np.random.choice([0.99, 1.99, 4.99, 9.99, 19.99])

                        purchases.append({
                            "purchase_id": purchase_id,
                            "user_id": user["user_id"],
                            "amount": amount,
                            "purchase_timestamp": event_time
                        })

                        purchase_id += 1

                    event_id += 1

                session_id += 1

# -------------------
# DATAFRAMES
# -------------------
sessions_df = pd.DataFrame(sessions)
events_df = pd.DataFrame(events)
purchases_df = pd.DataFrame(purchases)

# -------------------
# SAVE CSVs
# -------------------

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_PATH = os.path.join(BASE_DIR, "data")  
os.makedirs(DATA_PATH, exist_ok=True)

users_df.to_csv(os.path.join(DATA_PATH, "users.csv"), index=False)
sessions_df.to_csv(os.path.join(DATA_PATH, "sessions.csv"), index=False)
events_df.to_csv(os.path.join(DATA_PATH, "events.csv"), index=False)
purchases_df.to_csv(os.path.join(DATA_PATH, "purchases.csv"), index=False)

print("Data generated successfully!")
print("BASE_DIR:", BASE_DIR)
print("DATA_PATH:", DATA_PATH)