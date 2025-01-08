-- SQL Project Exploratory Data Analysis ---

SELECT 
    *
FROM
    layoffs_staging_2
ORDER BY 6 DESC;

-- -- exploring the highest layoffs that occured in a day ------------------------------------

SELECT 
    MAX(total_laid_off), MAX(percentage_laid_off)
FROM
    layoffs_staging_2;

-- --- companies that have laid off the entire workforce --------------------------------------

SELECT 
    *
FROM
    layoffs_staging_2
WHERE
    percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- -- finding out the total amount of layoffs done by each company in given timeline of data --- 

SELECT 
    company,
    SUM(total_laid_off) AS total,
    CONCAT(MIN(date), ' to ', MAX(date)) AS Between_dates
FROM
    layoffs_staging_2
GROUP BY company
ORDER BY total DESC;

-- -- finding out the total amount of layoffs done by each industry ---------------------------

SELECT 
    industry,
    SUM(total_laid_off) AS total,
    CONCAT(MIN(date), ' to ', MAX(date)) AS Between_dates
FROM
    layoffs_staging_2
GROUP BY industry
ORDER BY total DESC;


-- -- finding out the total amount of layoffs done by each country ---------------------------

SELECT 
    country,
    SUM(total_laid_off) AS total,
    CONCAT(MIN(date), ' to ', MAX(date)) AS Between_dates
FROM
    layoffs_staging_2
GROUP BY country
ORDER BY total DESC;


-- -- finding out the total amount of layoffs done in each year -----------------------------

SELECT 
    YEAR(date) AS year, SUM(total_laid_off) AS total
FROM
    layoffs_staging_2
GROUP BY year
ORDER BY year DESC;


-- -- total amount of layoffs by stage ------------------------------------------------------

SELECT 
    stage, SUM(total_laid_off) AS total
FROM
    layoffs_staging_2
GROUP BY stage
ORDER BY total DESC;

-- ------------------------------------------------------------------------------------------
-- total amount of layoffs by month

SELECT 
    SUBSTRING(`date`, 1, 7) AS `month`,
    SUM(total_laid_off) AS total
FROM
    layoffs_staging_2
WHERE
    SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `month`
ORDER BY 1;

-- Using the by month output as a CTE to calculate rolling SUM by Month ----------------------

WITH rolling_sum AS 
(
SELECT 
    SUBSTRING(`date`, 1, 7) AS `month`,
    SUM(total_laid_off) AS total
FROM
    layoffs_staging_2
WHERE
    SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `month`
)


SELECT 
`month`,
total,
SUM(total) OVER(ORDER BY `month`) as roll_sum
FROM rolling_sum
ORDER BY 1;

-- ----------------------------------------------------------------------------
-- Ranking companies on most layoffs by each year -----------------------------


WITH company_year AS
(
SELECT 
    company,
    YEAR(`date`) AS `year`,
    SUM(total_laid_off) AS total_laidoff
FROM
    layoffs_staging_2
GROUP BY company , YEAR(`date`)
),
company_ranking AS
(
SELECT 
    *,
    DENSE_RANK() OVER(PARTITION BY `year` ORDER BY total_laidoff DESC) AS ranking
FROM
    company_year
WHERE `year` IS NOT NULL
)

SELECT 
    *
FROM
    company_ranking
WHERE
    ranking <= 8
ORDER BY `year` , 4;
    

-- --------------------------------------- Thank you for viewing --------------------------------









