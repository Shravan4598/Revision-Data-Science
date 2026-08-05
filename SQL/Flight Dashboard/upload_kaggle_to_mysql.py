import os
import pandas as pd
import mysql.connector

from dotenv import load_dotenv
from kaggle.api.kaggle_api_extended import KaggleApi


# ============================
# Load Environment Variables
# ============================

load_dotenv()

MYSQL_PASSWORD = os.getenv("MYSQL_PASSWORD")
KAGGLE_TOKEN = os.getenv("KAGGLE_API_TOKEN")


# ============================
# Kaggle Authentication
# ============================

os.environ["KAGGLE_API_TOKEN"] = KAGGLE_TOKEN

api = KaggleApi()
api.authenticate()

print("✅ Kaggle Authentication Successful")


# ============================
# Download Kaggle Dataset
# ============================

dataset_name = "shravankumarpandey/flight"

download_folder = "kaggle_data"

os.makedirs(download_folder, exist_ok=True)


api.dataset_download_files(
    dataset_name,
    path=download_folder,
    unzip=True
)

print("✅ Dataset Downloaded")


# ============================
# Read CSV File
# ============================

csv_file = os.path.join(
    download_folder,
    "flights.csv"
)

df = pd.read_csv(csv_file)


print("Dataset Loaded")
print("Rows:", df.shape[0])
print("Columns:", df.shape[1])

print(df.head())


# ============================
# Connect MySQL
# ============================

conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password=MYSQL_PASSWORD
)

cursor = conn.cursor()


# ============================
# Create Database
# ============================

cursor.execute(
    "CREATE DATABASE IF NOT EXISTS flights"
)

cursor.execute(
    "USE flights"
)

print("✅ Database flights ready")


# ============================
# Create Table Automatically
# ============================

table_name = "flights_data"


columns = []

for col in df.columns:

    dtype = str(df[col].dtype)

    if "int" in dtype:
        mysql_type = "INT"

    elif "float" in dtype:
        mysql_type = "DOUBLE"

    else:
        mysql_type = "VARCHAR(255)"

    columns.append(
        f"`{col}` {mysql_type}"
    )


create_table_query = f"""
CREATE TABLE IF NOT EXISTS {table_name}
(
{",".join(columns)}
)
"""


cursor.execute(create_table_query)

print("✅ Table Created")


# ============================
# Insert Data
# ============================

placeholders = ",".join(
    ["%s"] * len(df.columns)
)


insert_query = f"""
INSERT INTO {table_name}
VALUES ({placeholders})
"""


# Convert NaN to None
df = df.where(
    pd.notnull(df),
    None
)


data = list(
    df.itertuples(
        index=False,
        name=None
    )
)


# Insert in batches
batch_size = 1000


for i in range(0, len(data), batch_size):

    batch = data[i:i+batch_size]

    cursor.executemany(
        insert_query,
        batch
    )

    conn.commit()

    print(
        f"Inserted {min(i+batch_size,len(data))}/{len(data)} rows"
    )


print("🎉 Data uploaded successfully")


# ============================
# Close Connection
# ============================

cursor.close()
conn.close()

print("Connection Closed")