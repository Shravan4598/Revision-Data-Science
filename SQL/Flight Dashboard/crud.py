import os
import mysql.connector
from dotenv import load_dotenv

load_dotenv()
password = os.getenv("MYSQL_PASSWORD")

try:
    conn = mysql.connector.connect(
        host="127.0.0.1",
        user="root",
        password=password,
        database="flight"
    )

    mycursor = conn.cursor()
    print("Connection Established")

    # mycursor.execute("CREATE DATABASE flight")
    # conn.commit()

except mysql.connector.Error as err:
    print("Connection Error")
    print(err)

#Create
mycursor.execute("""
CREATE TABLE IF NOT EXISTS airport(
airport_id INTEGER PRIMARY KEY,
code VARCHAR(10) NOT NULL,
city VARCHAR(50) NOT NULL,
name VARCHAR(100) NOT NULL
)
""")

mycursor.execute(
 """
 INSERT INTO airport VALUES
 (1,'DEL','New Delhi','IGIA'),
 (2,'CCU','Kolkata','NSCA'),
 (3,'BOM','Mumbai','CSMA')
 """)
conn.commit()


# Retrieve
mycursor.execute("SELECT * FROM airport WHERE airport_id>1")
data=mycursor.fetchall()
print(data)

for i in data:
    print(i)

for i in data:
    print(i[3])

# update
mycursor.execute("UPDATE airport SET city='Bombay' WHERE airport_id=3")
conn.commit()

mycursor.execute("SELECT * FROM airport WHERE airport_id>1")
data=mycursor.fetchall()
print(data)

for i in data:
    print(i)

for i in data:
    print(i[3])


# delete
mycursor.execute("DELETE FROM airport WHERE airport_id=3")
conn.commit()
mycursor.execute("SELECT * FROM airport")
data=mycursor.fetchall()
print(data)

