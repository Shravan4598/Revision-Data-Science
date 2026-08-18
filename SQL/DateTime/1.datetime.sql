-- 1. Create and select the database
CREATE DATABASE uber_db;
USE uber_db;

-- 2. Create the table 'uber_data'
-- We use DATETIME for start_time and end_time because DATETIME supports a wider range ('1000-01-01 00:00:00' to '9999-12-31 23:59:59') compared to TIMESTAMP.
-- We use TIMESTAMP for the record_created column to utilize its Auto-update feature, capturing the current time automatically whenever a row is inserted or updated.
CREATE TABLE uber_data (
    trip_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_name VARCHAR(50),
    start_time DATETIME,
    end_time DATETIME,
    fare DECIMAL(5,2),
    record_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 3. Insert 5 rows of data
-- Rows 1-3 use Implicit Type Conversion, where MySQL automatically converts the standard 'YYYY-MM-DD HH:MM:SS' string format into a DATETIME value.
-- Rows 4-5 use Explicit Type Conversion via the STR_TO_DATE() function to parse custom string formats into DATETIME.
INSERT INTO uber_data (driver_name, start_time, end_time, fare) VALUES
('Alice', '2023-10-01 08:30:00', '2023-10-01 09:15:00', 15.50),
('Bob', '2023-10-01 10:00:00', '2023-10-01 10:45:30', 20.00),
('Charlie', '2023-10-02 14:20:00', '2023-10-02 15:00:00', 12.75),
('Diana', STR_TO_DATE('03/10/2023 6:00 PM', '%d/%m/%Y %h:%i %p'), STR_TO_DATE('03/10/2023 6:45 PM', '%d/%m/%Y %h:%i %p'), 18.00),
('Eve', STR_TO_DATE('04-10-2023 09:00:00', '%d-%m-%Y %H:%i:%s'), STR_TO_DATE('04-10-2023 09:30:00', '%d-%m-%Y %H:%i:%s'), 10.25);

SELECT * FROM uber_data;



-- DATE_FORMAT(): Formats the date portion (e.g., '2023-October-01')
SELECT 
    start_time,
    DATE_FORMAT(start_time, '%Y-%M-%d') AS formatted_date 
FROM uber_data;

-- TIME_FORMAT(): Formats the time portion (e.g., '08:30 AM')
SELECT 
    start_time,
    TIME_FORMAT(start_time, '%h:%i %p') AS formatted_time 
FROM uber_data;


-- 1. Implicit Type Conversion: 
-- MySQL automatically understands the standard 'YYYY-MM-DD HH:MM:SS' string format.
INSERT INTO uber_data (driver_name, start_time) 
VALUES ('Frank', '2023-10-06 18:45:00');

-- 2. Explicit Type Conversion -> STR_TO_DATE(): 
-- Using a function to tell MySQL exactly how to read a non-standard string format.
INSERT INTO uber_data (driver_name, start_time) 
VALUES ('Grace', STR_TO_DATE('06-Oct-2023 6:45 PM', '%d-%b-%Y %h:%i %p'));



-- 1. DATEDIFF(): Calculates the difference in days between two date values.
-- E.g., How many days have passed between the trip and October 31st?
SELECT 
    trip_id,
    DATEDIFF('2023-10-31', start_time) AS days_until_halloween
FROM uber_data;

-- 2. TIMEDIFF(): Calculates the exact time difference (HH:MM:SS) between two datetime values.
-- E.g., The exact duration of the ride.
SELECT 
    trip_id,
    TIMEDIFF(end_time, start_time) AS ride_duration
FROM uber_data;

-- 3. DATE_ADD() and DATE_SUB(): Adds or subtracts a specified interval (days, months, minutes, etc.).
-- E.g., Estimating the driver's arrival time (15 mins before start) and a feedback email (1 day after start).
SELECT 
    trip_id,
    DATE_SUB(start_time, INTERVAL 15 MINUTE) AS driver_arrival,
    DATE_ADD(start_time, INTERVAL 1 DAY) AS send_feedback_email
FROM uber_data;

-- 4. ADDTIME() and SUBTIME(): Adds or subtracts a specific time string ('HH:MM:SS').
-- E.g., Adding exactly 1 hour and 15 minutes to the start time.
SELECT 
    trip_id,
    ADDTIME(start_time, '01:15:00') AS time_plus_1h15m,
    SUBTIME(start_time, '00:30:00') AS time_minus_30m
FROM uber_data;

CREATE TABLE data_type_showcase (
    id INT PRIMARY KEY AUTO_INCREMENT,
    
    -- DATETIME: 
    -- 1. Range: Supports '1000-01-01' to '9999-12-31'
    -- 2. Storage: Uses 8 bytes
    -- 4. Precision: We can add '(6)' to store up to microseconds
    trip_scheduled_for DATETIME(6), 
    
    -- TIMESTAMP:
    -- 1. Range: Only supports '1970-01-01' to '2038-01-19'
    -- 2. Storage: Uses 4 bytes (lighter)
    -- 3. Behaviour: Converts to UTC on insertion and back to local time on retrieval
    -- 5. Auto-update: Uses ON UPDATE CURRENT_TIMESTAMP to track the exact moment the row changes
    last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
);


SELECT * FROM uber_data;
