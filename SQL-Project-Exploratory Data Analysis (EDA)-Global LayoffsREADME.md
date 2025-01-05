Project Overview
This project focuses on performing Exploratory Data Analysis (EDA) using SQL on a cleaned layoffs dataset. 
The dataset contains information about layoffs across various industries, companies, and countries, providing insights into trends and patterns. 
The analysis was executed using MySQL Workbench.

Data Source
The dataset was obtained from Kaggle and underwent a comprehensive cleaning process before being analyzed.

Project Goals
Identify trends and patterns in layoffs by company, industry, country, and timeline.
Calculate aggregate metrics such as total layoffs, rolling sums, and rankings.
Provide actionable insights into the most impacted sectors, companies, and regions.
Key Insights Derived
Top Contributors: Companies and industries with the highest layoffs.
Timeline Trends: Monthly and yearly aggregates, with rolling sums to observe cumulative impacts.
Ranking Analysis: Companies ranked based on layoffs in each year.
100% Workforce Layoffs: Identified companies with total workforce reductions.
Core SQL Queries Executed
Highest Layoffs on a Single Day
MAX() and percentage calculations to identify peak impact days.
Total Layoffs by Group
Aggregations using SUM() for company, industry, and country levels.
Monthly and Yearly Trends
Rolling sums using window functions to analyze cumulative layoffs over time.
Company Rankings
Dense ranking logic to rank companies based on layoffs annually.
Tools and Technologies
SQL Features Used:

Aggregate Functions: SUM(), MAX()
String Manipulation: SUBSTRING()
Date Functions: YEAR(), STR_TO_DATE()
Window Functions: ROLLING SUM, DENSE_RANK()
Common Table Expressions (CTEs) for modular query building.
Platform: MySQL Workbench
