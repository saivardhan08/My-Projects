# SQL Data Cleaning Project

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

## Future Scope
- Perform detailed trend analysis on layoff data.
- Build visualizations using tools like Power BI or Tableau for actionable insights.

## Instructions to Run
1. Clone or download the repository.
2. Import the dataset into your MySQL database.
3. Run the SQL queries sequentially as provided in the project script.

---

Thank you for exploring this project! For any feedback or collaboration, feel free to reach out.

