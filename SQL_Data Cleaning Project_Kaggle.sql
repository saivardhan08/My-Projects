
-- ----------------------------------SQL Data Cleaning Project----------------------------------------

-- Data source: https://www.kaggle.com/datasets/swaptr/layoffs-2022

-- Worked on: MYSQL Workbench

-- Imported the raw CSV file into a new table named layoffs under a new schema named world_layoffs



-- lets take a look at the raw data --

SELECT *     
FROM world_layoffs.layoffs;

-- -- Action plan -- ---

-- 1 Remove Duplicates
-- 2 Standardize the Data
-- 3 Null Values and Blank Values
-- 4 Remove any Columns and rows (only if required)

-- lets begin --


-- Creating a staging table to work on, and inserting the data into it from main layoffs table --


CREATE TABLE layoffs_staging LIKE layoffs;            

INSERT layoffs_staging -- this query inserts all the data from layoffs table >> layoffs_staging table
SELECT *
FROM layoffs;

SELECT 
    *
FROM
    layoffs_staging;



-- ------------ # 1. Removing duplicates # --------------------

-- creating a row number column using a window function and used CTE to identify duplicates --

WITH duplicates AS ( 
SELECT 
    *,
    ROW_NUMBER() 
    OVER(PARTITION BY company, industry, total_laid_off, percentage_laid_off,`date`) 
    AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicates
WHERE row_num > 1;

-- ----------------------------------------------------------------------------------------------

-- now since we cannot delete or update a CTE lets create another staging_2 table and insert..
-- the CTE data into it.

CREATE TABLE `layoffs_staging_2` (
    `company` TEXT,
    `location` TEXT,
    `industry` TEXT,
    `total_laid_off` INT DEFAULT NULL,
    `percentage_laid_off` TEXT,
    `date` TEXT,
    `stage` TEXT,
    `country` TEXT,
    `funds_raised_millions` INT DEFAULT NULL,
    `row_num` INT
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

-- -------------------------------- -------------------------------------------------------------
INSERT layoffs_staging_2
SELECT 
    *,
    ROW_NUMBER() 
    OVER(PARTITION BY company, industry, total_laid_off, percentage_laid_off,`date`) 
    AS row_num
FROM layoffs_staging;
-- ----------------------------------------------------------------------------------------------

SELECT 
    *
FROM
    layoffs_staging_2
WHERE
    row_num > 1;

-- Now run the DELETE statement to delete all the rows that are > than 1 --

DELETE FROM layoffs_staging_2 
WHERE
    row_num > 1;

-- Check --- the table should not return any data
SELECT 
    *
FROM
    layoffs_staging_2
WHERE
    row_num > 1;

SELECT 
    *
FROM
    layoffs_staging_2;


-- ------------ # 2. Standardize the Data # --------------------

SELECT 
    company, TRIM(company)
FROM
    layoffs_staging_2;


-- --------------- Update the table with trimmed columns ---------

UPDATE layoffs_staging_2 
SET 
    company = TRIM(company),
    location = TRIM(location),
    industry = TRIM(industry),
    total_laid_off = TRIM(total_laid_off),
    percentage_laid_off = TRIM(percentage_laid_off),
    date = TRIM(date),
    stage = TRIM(stage),
    country = TRIM(country),
    funds_raised_millions = TRIM(funds_raised_millions);

-- ---- identifying inconsistencies and normalising the data ---------------

SELECT DISTINCT
    industry
FROM
    layoffs_staging_2
ORDER BY 1;

-- found multiple versions of industry name "Crypto" while their should be only one unique identifier----------


SELECT 
    industry
FROM
    layoffs_staging_2
WHERE
    industry LIKE '%Crypto%'
ORDER BY 1;


-- ------------------- Updating the rows to "Crypto"----------------


UPDATE layoffs_staging_2 
SET 
    industry = 'Crypto'
WHERE
    industry LIKE '%Crypto%';

SELECT DISTINCT
    industry
FROM
    layoffs_staging_2
ORDER BY 1;

-- -------------------------------------------------------------------------------
-- ------------ removing the trailing charecters ----------------------------------

SELECT DISTINCT
    country
FROM
    layoffs_staging_2
ORDER BY 1;

UPDATE layoffs_staging_2 
SET 
    country = TRIM(TRAILING '.' FROM country);

-- ------------------------------------------------------------------------------------
-- converting str values to date format and updating the table for date column -----

SELECT 
    date
FROM
    layoffs_staging_2
ORDER BY 1;

UPDATE layoffs_staging_2 
SET 
    date = STR_TO_DATE(date, '%m/%d/%Y');


-- since we converted the str date values into proper a date format, now it's time to change the 
-- column date type from "text" >> "Date" using Alter table

ALTER TABLE layoffs_staging_2
MODIFY COLUMN date DATE;

-- ----------------------------------------------------------------------------------------
-- --------------------------looks good so far --------------------------------------------

SELECT 
    *
FROM
    layoffs_staging_2;

-- ---------------------------------------------------------------------------------------
-- ----------------identifying null's and empty cells and updating them as null-----------

SELECT 
    *
FROM
    layoffs_staging_2
WHERE
    industry IS NULL OR industry = '';
    
-- ---------------------------------------------------------------------

UPDATE layoffs_staging_2 
SET 
    industry = NULL
WHERE
    industry IS NULL OR industry = '';
    
--  figuring out and checking the join logic to use  ---------

SELECT 
    t1.company, t1.industry, t2.industry
FROM
    layoffs_staging_2 t1
        JOIN
    layoffs_staging_2 t2 ON t1.company = t2.company
WHERE
    t1.industry IS NOT NULL
        AND t2.industry IS NULL;
        
  -- ----------------- Updating the table for missing industry values using SELF JOIN ---------------------      

UPDATE layoffs_staging_2 t2
        JOIN
    layoffs_staging_2 t1 ON t1.company = t2.company 
SET 
    t2.industry = t1.industry
WHERE
    t1.industry IS NOT NULL
        AND t2.industry IS NULL;
        
-- ------------------ Updated -------------------------------
          
SELECT 
    *
FROM
    layoffs_staging_2;

-- --------------------------------------------------
-- Identifying and Deleting non usefull rows 

SELECT 
    *
FROM
    layoffs_staging_2
WHERE
    total_laid_off IS NULL
        AND percentage_laid_off IS NULL;
 
-- these are the rows where do have any kind of layoff data so lets delete rows as these are not use full for further analysis
 
DELETE FROM layoffs_staging_2 
WHERE
    total_laid_off IS NULL
    AND percentage_laid_off IS NULL;

-- -----------------------------------------------------------------
-- Now its time to drop the row_num column which we have created at the beginning to identify duplicates.

ALTER TABLE layoffs_staging_2
DROP COLUMN row_num;

-- with that we are done with data cleaning

SELECT 
    *
FROM
    layoffs_staging_2
ORDER BY date;

-- --------------------------------------- Thank you for viewing --------------------------------











 