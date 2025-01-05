# Exploratory Data Analysis (EDA) on Layoff Data

## Project Overview
This project focuses on conducting Exploratory Data Analysis (EDA) on a dataset detailing global layoffs. By leveraging SQL, insights such as trends, distributions, and patterns in layoffs across companies, industries, and countries were uncovered. This analysis provides valuable information about workforce reductions and their broader implications.

---

## Data Source
- **Dataset**: [Layoffs 2022](https://www.kaggle.com/datasets/swaptr/layoffs-2022)
- **Platform**: MySQL Workbench

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
The analysis provided critical insights into the dynamics of layoffs, highlighting major companies, industries, and countries affected. It also offered an understanding of temporal trends, enabling strategic decision-making for stakeholders.

---

## How to Use the Code
1. Import the provided dataset into MySQL Workbench.
2. Create a schema and a table to hold the raw data.
3. Run the provided SQL queries sequentially to reproduce the analysis.
4. Customize queries to explore additional dimensions of the dataset.

---

## Conclusion
This project demonstrates the power of SQL in deriving actionable insights from raw data. By identifying trends and patterns, organizations can better understand and respond to workforce challenges.

