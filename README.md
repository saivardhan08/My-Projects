# SQL Data Cleaning & EDA Project

## Project Overview
This project involves cleaning and standardizing a dataset on layoffs in 2022, sourced from [Kaggle](https://www.kaggle.com/datasets/swaptr/layoffs-2022). 
The data cleaning process was conducted using MySQL Workbench and focused on ensuring accuracy, consistency, and usability for further analysis.

## Data Source
- Dataset: [Layoffs 2022](https://www.kaggle.com/datasets/swaptr/layoffs-2022)
- Format: CSV
- Imported into: MySQL schema named `world_layoffs`, table `layoffs`

## Key Objectives
1. Remove duplicate records.
2. Standardize and normalize data values.
3. Handle missing or null values appropriately.
4. Optimize the dataset for analysis by removing irrelevant columns and rows.

## Tools and Environment
- **Database**: MySQL Workbench
- **Key SQL Techniques**: CTEs, Window Functions, Joins, Updates, Data Type Modifications, and Self Joins.

## Cleaning Process

### 1. Removing Duplicates
- Identified duplicates using a CTE and `ROW_NUMBER()` function.
- Created a staging table to manage and remove duplicate entries effectively.

### 2. Standardizing Data
- Trimmed unnecessary spaces from text fields.
- Unified inconsistent values (e.g., multiple versions of "Crypto" standardized).
- Converted string date values to a proper `DATE` format and updated the column type.

### 3. Handling Null and Blank Values
- Replaced empty or invalid fields with `NULL`.
- Used self-joins to populate missing industry values based on related company data.

### 4. Optimizing the Dataset
- Identified and deleted rows with insufficient layoff data (both `total_laid_off` and `percentage_laid_off` as NULL).
- Dropped helper columns (e.g., `row_num`) after completing operations.

## Outcome
- Cleaned and standardized dataset is stored in `layoffs_staging_2` table.
- Data is ready for visualization and analysis.

## Key SQL Features Demonstrated
- Use of Common Table Expressions (CTEs) for identifying duplicates.
- Application of window functions (`ROW_NUMBER()`).
- String operations (`TRIM`, `LIKE`, etc.) for standardization.
- Self-joins for filling missing data.
- Conversion and handling of data types (e.g., `STR_TO_DATE` for date conversion).


# Exploratory Data Analysis (EDA) on Layoff Data

## Project Overview
This project focuses on conducting Exploratory Data Analysis (EDA) on a dataset detailing global layoffs. By leveraging SQL, insights such as trends, distributions, and patterns in layoffs across companies, industries, and countries were uncovered. This analysis provides valuable information about workforce reductions and their broader implications.

---

## Objectives
1. Analyze layoffs by companies, industries, and countries.
2. Identify trends in layoffs by year, month, and stage.
3. Rank companies with the most layoffs annually.
4. Calculate rolling totals to track cumulative layoffs.

---

## Key Insights and Analysis Steps

### 1. **Highest Layoffs in a Day**
- **Query**: Identify the maximum layoffs and percentage of workforce reductions that occurred in a single day.
- **Purpose**: Highlight significant one-day workforce impacts.

### 2. **Companies with 100% Layoffs**
- **Query**: List companies that laid off their entire workforce.
- **Purpose**: Understand extreme cases of workforce reduction.

### 3. **Total Layoffs by Company**
- **Query**: Calculate the sum of layoffs by each company over the dataset's timeline.
- **Purpose**: Evaluate companies contributing most to workforce reductions.

### 4. **Industry-Wise Layoffs**
- **Query**: Summarize total layoffs across industries.
- **Purpose**: Identify sectors most affected by layoffs.

### 5. **Country-Wise Layoffs**
- **Query**: Compute total layoffs by country.
- **Purpose**: Assess geographic concentration of layoffs.

### 6. **Yearly Layoff Trends**
- **Query**: Aggregate layoffs by year.
- **Purpose**: Analyze layoffs’ evolution over time.

### 7. **Stage-Wise Layoffs**
- **Query**: Categorize layoffs by company funding or growth stage.
- **Purpose**: Understand layoffs in different organizational life cycles.

### 8. **Monthly Layoff Trends with Rolling Totals**
- **Query**: Calculate rolling sums of layoffs by month.
- **Purpose**: Track cumulative workforce reductions over time.

### 9. **Annual Ranking of Companies with Most Layoffs**
- **Query**: Rank companies based on layoffs for each year, displaying the top 8 annually.
- **Purpose**: Spotlight major contributors to workforce changes.

---

## Tools and Techniques
- **SQL Queries**: Used for aggregation, ranking, and filtering data.
- **Window Functions**: Applied for calculating rolling sums and dense rankings.
- **CTEs (Common Table Expressions)**: Structured complex queries for better readability and maintainability.

---

## Results
The analysis provided critical insights into the dynamics of layoffs, highlighting major companies, industries, and countries affected. 
It also offered an understanding of temporal trends, enabling strategic decision-making for stakeholders.



Thank you for exploring this project! For any feedback or collaboration, feel free to reach out.
