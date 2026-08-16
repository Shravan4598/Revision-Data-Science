

USE laptop_data;

SELECT * FROM laptopdata;

-- 1. Create backup

CREATE TABLE laptop_backup LIKE laptopdata;

SELECT * FROM laptop_backup;

INSERT INTO laptop_backup SELECT * FROM laptopdata;

SELECT * FROM laptop_backup;

-- 2. Check number of rows

SELECT COUNT(*) FROM laptopdata; -- 1272

SELECT COUNT(*) FROM laptop_backup; -- 1272

-- 3. Check memory consumption for reference

SELECT * FROM information_schema.TABLES
WHERE TABLE_SCHEMA="laptop_data"
AND TABLE_NAME="laptopdata";

SELECT  DATA_LENGTH,DATA_LENGTH/1024 FROM information_schema.TABLES
WHERE TABLE_SCHEMA="laptop_data"            -- 262144 = 256.0000 KB
AND TABLE_NAME="laptopdata";

SELECT  DATA_LENGTH,DATA_LENGTH/1024 FROM information_schema.TABLES
WHERE TABLE_SCHEMA="laptop_data"            -- 262144 = 256.0000 KB
AND TABLE_NAME="laptop_backup";

-- 4. Drop non important cols

-- In the data  Unnamed: 0 column is not important so we will drop it

SELECT * FROM laptopdata;

ALTER TABLE laptopdata DROP COLUMN `Unnamed: 0`;

SELECT * FROM laptopdata;

-- Drop the rows having all null values

SELECT `index` FROM laptopdata
WHERE Company IS NULL AND TypeName IS NULL AND Inches IS NULL
AND ScreenResolution IS NULL AND Cpu IS NULL AND Ram IS NULL
AND Memory IS NULL AND Gpu IS NULL AND OpSys IS NULL AND
WEIGHT IS NULL AND Price IS NULL;

DELETE FROM laptopdata WHERE `index` IN (SELECT `index` FROM laptopdata
WHERE Company IS NULL AND TypeName IS NULL AND Inches IS NULL
AND ScreenResolution IS NULL AND Cpu IS NULL AND Ram IS NULL
AND Memory IS NULL AND Gpu IS NULL AND OpSys IS NULL AND
WEIGHT IS NULL AND Price IS NULL);

SELECT COUNT(*) FROM laptopdata; -- 1272

-- Drop duplicates


-- Checking missing value in each column
SELECT * FROM laptopdata;
SELECT DISTINCT(Company) FROM laptopdata; -- No null values
SELECT DISTINCT(Inches) FROM laptopdata; -- No null values
SELECT DISTINCT(ScreenResolution) FROM laptopdata; -- No null values
SELECT DISTINCT(Cpu) FROM laptopdata; -- No null values
SELECT DISTINCT(Ram) FROM laptopdata; -- No null values
SELECT DISTINCT(Memory) FROM laptopdata; -- 1 null values -->?
SELECT DISTINCT(Gpu) FROM laptopdata; -- No null values
SELECT DISTINCT(OpSys) FROM laptopdata; -- No null values
SELECT DISTINCT(Weight) FROM laptopdata; -- No null values
SELECT DISTINCT(Price) FROM laptopdata; -- No null values

-- Change the datatype of the inches column

ALTER TABLE laptopdata MODIFY COLUMN Inches DECIMAL(10,1);
SELECT * FROM laptopdata;

-- Clean RAM -> change col data type
-- 8GB --> 8, 4GB --> 4, 16GB --> 16

SELECT REPLACE(Ram,"GB","") FROM laptopdata;
SELECT * FROM laptopdata;

-- UPDATE laptopdata SET Ram = REPLACE(Ram, 'GB', '');
-- UPDATE laptopdata SET Ram = TRIM(REPLACE(Ram, 'GB', ''));

SET SQL_SAFE_UPDATES = 0;

UPDATE laptopdata SET Ram = TRIM(REPLACE(Ram, 'GB', ''));

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE laptopdata MODIFY COLUMN Ram INTEGER;

SELECT * FROM laptopdata;

-- Clean weight -> change col type

SET SQL_SAFE_UPDATES = 0;

UPDATE laptopdata SET  Weight= TRIM(REPLACE(Weight, 'kg', ''));

SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;

UPDATE laptopdata
SET Weight = NULL
WHERE Weight = '?';

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE laptopdata MODIFY COLUMN Weight DECIMAL(10,1);



-- ROUND price col and change to integer

SET SQL_SAFE_UPDATES = 0;
UPDATE laptopdata SET Price = ROUND(Price);

ALTER TABLE laptopdata MODIFY COLUMN Price INTEGER;

SELECT * FROM laptopdata;

SELECT  DATA_LENGTH,DATA_LENGTH/1024 FROM information_schema.TABLES
WHERE TABLE_SCHEMA="laptop_data"            -- 262144 = 256.0000 KB
AND TABLE_NAME="laptopdata";

-- Change the OpSys col

SELECT DISTINCT(OpSys) FROM laptopdata;
SELECT OpSys,
CASE
    WHEN OpSys LIKE '%mac%' THEN 'macos'
    WHEN OpSys LIKE 'windows%' THEN 'windows'
    WHEN OpSys LIKE '%linux%' THEN 'linux'
    WHEN OpSys = 'No OS' THEN 'N/A'
    ELSE 'other'
END AS "os_brand"
FROM laptopdata;

UPDATE laptopdata
SET OpSys =
    CASE
        WHEN OpSys LIKE '%mac%' THEN 'macos'
        WHEN OpSys LIKE 'windows%' THEN 'windows'
        WHEN OpSys LIKE '%linux%' THEN 'linux'
        WHEN OpSys = 'No OS' THEN 'N/A'
        ELSE 'other'
    END;

-- Gpu

SELECT Gpu FROM laptopdata;
SELECT DISTINCT(Gpu) FROM laptopdata;

ALTER TABLE laptopdata
ADD COLUMN gpu_brand VARCHAR(255) AFTER Gpu,
ADD COLUMN gpu_name VARCHAR(255) AFTER gpu_brand;

SELECT Gpu, SUBSTRING_INDEX(Gpu," ",1) FROM laptopdata;

SELECT Gpu, SUBSTRING_INDEX(Gpu, ' ', 1) AS gpu_brand
FROM laptopdata;

UPDATE laptopdata
SET gpu_brand = SUBSTRING_INDEX(Gpu, ' ', 1);

UPDATE laptopdata
SET gpu_name = TRIM(REPLACE(Gpu, gpu_brand, ''));

SELECT * FROM laptopdata;

ALTER TABLE laptopdata DROP COLUMN Gpu;

-- Cpu
-- 1.CPU Brand
-- 2. Processor
-- 3. CPU Speed

SELECT Cpu from laptopdata;
SELECT DISTINCT(Cpu) from laptopdata;

ALTER TABLE laptopdata
ADD COLUMN CPU_Brand_Name VARCHAR(255) AFTER Cpu,
ADD COLUMN Processor VARCHAR(255) AFTER CPU_Brand_Name,
ADD COLUMN CPU_Speed VARCHAR(255) AFTER Processor;

UPDATE laptopdata
SET
    CPU_Brand_Name = SUBSTRING_INDEX(Cpu, ' ', 1),
    CPU_Speed = SUBSTRING_INDEX(Cpu, ' ', -1),
    Processor = TRIM(
        REPLACE(
            REPLACE(Cpu, SUBSTRING_INDEX(Cpu, ' ', 1), ''),
            SUBSTRING_INDEX(Cpu, ' ', -1),
            ''
        )
    );

ALTER TABLE laptopdata DROP COLUMN Cpu;


UPDATE laptopdata
SET CPU_Speed = TRIM(REPLACE(CPU_Speed, 'GHz', ''));

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE laptopdata
MODIFY COLUMN CPU_Speed DECIMAL(10,1);


SELECT * FROM laptopdata;


-- Memory
-- 1.Memory Size
-- 2. Memory Type

SELECT Memory FROM laptopdata;

ALTER TABLE laptopdata 
ADD COLUMN Memory_Size VARCHAR(255) AFTER Memory,
ADD COLUMN Memory_Type VARCHAR(255) AFTER Memory_Size;

SELECT SUBSTRING_INDEX(Memory," ",1) FROM laptopdata;
SELECT SUBSTRING_INDEX(Memory," ",-1) FROM laptopdata;
SELECT DISTINCT(SUBSTRING_INDEX(Memory," ",-1)) FROM laptopdata;

SET SQL_SAFE_UPDATES = 0;
UPDATE laptopdata
SET Memory_Size= SUBSTRING_INDEX(Memory," ",1);

UPDATE laptopdata
SET Memory_Type= SUBSTRING_INDEX(Memory," ",-1);


SELECT * FROM laptopdata;

-- ScreenResolution

-- Height
-- Width
-- TouchScreen --> Yes(1) and No(0)

SELECT ScreenResolution FROM laptopdata;

ALTER TABLE laptopdata 
ADD COLUMN height VARCHAR(10) AFTER ScreenResolution,
ADD COLUMN width VARCHAR(10) AFTER height,
ADD COLUMN touch_screen VARCHAR(10) AFTER width;

SELECT SUBSTRING_INDEX(ScreenResolution," ",-1) FROM laptopdata;

SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(ScreenResolution," ",-1),"x",1) FROM laptopdata;
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(ScreenResolution," ",-1),"x",-1) FROM laptopdata;

UPDATE laptopdata SET height=SUBSTRING_INDEX(SUBSTRING_INDEX(ScreenResolution," ",-1),"x",1),
width=SUBSTRING_INDEX(SUBSTRING_INDEX(ScreenResolution," ",-1),"x",-1);

ALTER TABLE laptopdata
MODIFY COLUMN height INTEGER;
ALTER TABLE laptopdata
MODIFY COLUMN width INTEGER;

SELECT ScreenResolution LIKE "%Touch%" FROM laptopdata;
UPDATE laptopdata SET touch_screen=(ScreenResolution LIKE "%Touch%");
ALTER TABLE laptopdata MODIFY COLUMN  touch_screen INTEGER;

ALTER TABLE laptopdata DROP COLUMN ScreenResolution;

SELECT * FROM laptopdata;

-- Processor

SELECT Processor FROM laptopdata;

SELECT SUBSTRING_INDEX(Processor," ",2) FROM laptopdata;

UPDATE laptopdata SET Processor=SUBSTRING_INDEX(Processor," ",2);
SELECT DISTINCT(Processor) FROM laptopdata;

SELECT * FROM laptopdata;

-- Memory
-- 1. type ---> SSD,HDD,Hybrid
-- 2. Primary Storage ---> 128,256,1024
-- 3. Secondary Storage ---> 0,1024,1TB


ALTER TABLE laptopdata 
ADD COLUMN MemoryType VARCHAR(255) AFTER Memory,
ADD COLUMN Primary_Storage VARCHAR(255) AFTER MemoryType,
ADD COLUMN Secondary_Storage VARCHAR(255) AFTER Primary_Storage;


SELECT Memory,
CASE
    WHEN Memory LIKE '%SSD%' AND Memory LIKE '%HDD%' THEN 'Hybrid'
    WHEN Memory LIKE '%SSD%' THEN 'SSD'
    WHEN Memory LIKE '%HDD%' THEN 'HDD'
    WHEN Memory LIKE '%Flash Storage%' THEN 'Flash Storage'
    WHEN Memory LIKE '%Hybrid%' THEN 'Hybrid'
    WHEN Memory LIKE '%Flash Storage%' AND Memory LIKE '%HDD%' THEN 'Hybrid'
    ELSE NULL
END AS MemoryType
FROM laptopdata;

UPDATE laptopdata SET MemoryType=CASE
    WHEN Memory LIKE '%SSD%' AND Memory LIKE '%HDD%' THEN 'Hybrid'
    WHEN Memory LIKE '%SSD%' THEN 'SSD'
    WHEN Memory LIKE '%HDD%' THEN 'HDD'
    WHEN Memory LIKE '%Flash Storage%' THEN 'Flash Storage'
    WHEN Memory LIKE '%Hybrid%' THEN 'Hybrid'
    WHEN Memory LIKE '%Flash Storage%' AND Memory LIKE '%HDD%' THEN 'Hybrid'
    ELSE NULL
END;

SELECT * FROM laptopdata;


SELECT Memory,
       TRIM(REPLACE(REPLACE(SUBSTRING_INDEX(Memory, '+', 1), 'SSD', ''), 'HDD', '')) AS Memory_1,
       CASE
           WHEN Memory LIKE '%+%' THEN
               TRIM(REPLACE(REPLACE(SUBSTRING_INDEX(Memory, '+', -1), 'SSD', ''), 'HDD', ''))
           ELSE 0
       END AS Memory_2
FROM laptopdata;

UPDATE laptopdata
SET
    Primary_Storage = TRIM(
        REPLACE(
            REPLACE(SUBSTRING_INDEX(Memory, '+', 1), 'SSD', ''),
            'HDD', ''
        )
    ),
    Secondary_Storage = CASE
        WHEN Memory LIKE '%+%' THEN
            TRIM(
                REPLACE(
                    REPLACE(SUBSTRING_INDEX(Memory, '+', -1), 'SSD', ''),
                    'HDD', ''
                )
            )
        ELSE 0
    END;
    
SELECT * FROM laptopdata;

ALTER TABLE laptopdata
DROP COLUMN Memory_Size,
DROP COLUMN Memory_Type,
DROP COLUMN Memory;

-- Disable Safe Update Mode
SET SQL_SAFE_UPDATES = 0;

-- Convert TB to GB and remove the units
SET SQL_SAFE_UPDATES = 0;

UPDATE laptopdata
SET
    Primary_Storage = CASE
        WHEN Primary_Storage = '?' THEN NULL
        WHEN Primary_Storage LIKE '%TB%' THEN
            CAST(
                REPLACE(
                    REPLACE(Primary_Storage, 'TB', ''),
                    'Hybrid', ''
                ) AS DECIMAL(10,2)
            ) * 1024
        WHEN Primary_Storage LIKE '%GB%' THEN
            CAST(
                REPLACE(
                    REPLACE(
                        REPLACE(Primary_Storage, 'GB', ''),
                        'Flash Storage', ''
                    ),
                    'Hybrid', ''
                ) AS DECIMAL(10,2)
            )
        ELSE Primary_Storage
    END,

    Secondary_Storage = CASE
        WHEN Secondary_Storage = '0' THEN 0
        WHEN Secondary_Storage = '?' THEN NULL
        WHEN Secondary_Storage LIKE '%TB%' THEN
            CAST(
                REPLACE(
                    REPLACE(Secondary_Storage, 'TB', ''),
                    'Hybrid', ''
                ) AS DECIMAL(10,2)
            ) * 1024
        WHEN Secondary_Storage LIKE '%GB%' THEN
            CAST(
                REPLACE(
                    REPLACE(
                        REPLACE(Secondary_Storage, 'GB', ''),
                        'Flash Storage', ''
                    ),
                    'Hybrid', ''
                ) AS DECIMAL(10,2)
            )
        ELSE Secondary_Storage
    END;

SET SQL_SAFE_UPDATES = 1;

-- Convert columns to integer
ALTER TABLE laptopdata
MODIFY COLUMN Primary_Storage INT,
MODIFY COLUMN Secondary_Storage INT;

ALTER TABLE laptopdata DROP COLUMN gpu_name;

SELECT * FROM laptopdata;


