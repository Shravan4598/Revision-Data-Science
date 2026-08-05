import mysql.connector
import os
from dotenv import load_dotenv

load_dotenv()
password=os.getenv("MYSQL_PASSWORD")

class DB:
    def __init__(self):
        try:
            self.conn = mysql.connector.connect(
            host="127.0.0.1",
            user="root",
            password=password,
            database="flights"
        )

            self.mycursor = self.conn.cursor()
            print("Connection Established")

 
        except mysql.connector.Error as err:
            print("Connection Error",err)

    def fetch_city_names(self):
        
        self.mycursor.execute("""SELECT DISTINCT(Source) FROM flights.flights_data
                                 UNION
                                 SELECT DISTINCT(Destination) FROM flights.flights_data
                                """)
        data=self.mycursor.fetchall()
        city=[]
        for i in data:
            city.append(i[0])
        return city


    def fetch_all_flights(self,source,destination):
        self.mycursor.execute(f"SELECT Airline,Date_of_Journey,Route,Dep_Time,Price FROM flights.flights_data WHERE Source='{source}' AND Destination='{destination}'") 
        data=self.mycursor.fetchall()
        return data

    def fetch_airline_frequency(self):
        self.mycursor.execute("SELECT Airline,COUNT(*) AS 'frequency' FROM flights.flights_data GROUP BY Airline")
        data=self.mycursor.fetchall()
        airline=[]
        frequency=[]
        for item in data:
            airline.append(item[0])
            frequency.append(item[1])

        return airline,frequency

    def busy_airport(self):
        self.mycursor.execute("""
                            SELECT Source,COUNT(*) AS 'count' FROM (SELECT Source FROM flights.flights_data
                            UNION ALL
                            SELECT Destination FROM flights.flights_data) t
                            GROUP BY Source
                            ORDER BY count DESC;
                        """)
        data=self.mycursor.fetchall()
        city=[]
        frequency=[]
        for i in data:
            city.append(i[0])
            frequency.append(i[1])
        return city,frequency
    
    def daily_flight_frequency(self):
        self.mycursor.execute("""
                            SELECT Date_of_Journey,COUNT(*) FROM flights.flights_data GROUP BY Date_of_Journey;
                            """)
        data=self.mycursor.fetchall()
        date=[]
        frequency=[]
        for i in data:
            date.append(i[0])
            frequency.append(i[1])
        return date,frequency



