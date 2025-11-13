# 💼 Global Layoffs Data Cleaning Project (SQL)

This project focuses on cleaning and preparing a global layoffs dataset using **SQL**.  
The goal was to transform messy, duplicate-filled data into a clean, reliable dataset ready for analysis and visualization.  

---

## 🗂️ Table of Contents
1. [Project Overview](#project-overview)
2. [Objectives](#objectives)
3. [Tools Used](#tools-used)
4. [Data Cleaning Workflow](#data-cleaning-workflow)
5. [Key SQL Techniques](#key-sql-techniques)
6. [Challenges & Solutions](#challenges--solutions)
7. [Results](#results)
8. [Project Files](#project-files)
9. [How to Navigate](#how-to-navigate)
10. [Connect With Me](#connect-with-me)

---

## 📖 Project Overview
This project explores the **wave of layoffs** that have affected companies worldwide across various industries.  
The dataset contains information such as:
- Company name  
- Industry  
- Location  
- Country  
- Number and percentage of employees laid off  
- Company stage and funds raised  

The purpose of this project is to **standardize, clean, and structure** the data for accurate analysis — ensuring all duplicates, blanks, and formatting errors are properly handled.

---

## 🎯 Objectives
- Detect and remove duplicate records.  
- Standardize company, country, and industry names.  
- Handle null and blank values logically.  
- Format dates properly for time-based analysis.  
- Prepare the dataset for downstream analysis or visualization.  

---

## 🧰 Tools Used
- **SQL (MySQL Workbench)** – for data cleaning and manipulation  
- **CTEs & Window Functions** – for identifying duplicates and ranking records  
- **Excel / Power BI (optional)** – for validation and visualization  

---

## 🧹 Data Cleaning Workflow

### 1. Data Loading
- Imported raw layoffs dataset into MySQL database.
- Created a staging table (`layoffs_staging`) to avoid modifying original data.

### 2. Removing Duplicates
- Used `ROW_NUMBER()` and `DENSE_RANK()` window functions to identify duplicates.
- Verified duplicates using a CTE (`duplicate_cte`).
- Created a new table (`layoffs_staging2`) and deleted rows with duplicate identifiers.

### 3. Standardizing Data
- Trimmed extra spaces from company and country names using `TRIM()`.
- Cleaned industry names (e.g., changing “crypto” or “CryptoCurrency” → “Crypto”).
- Fixed inconsistent country formats (e.g., “United States.” → “United States”).

### 4. Formatting Dates
- Converted text-based date values into proper `DATE` format using `STR_TO_DATE()`.
- Altered the column datatype to ensure consistent date handling.

### 5. Handling Null or Blank Values
- Identified missing `industry` values and filled them by referencing matching company data.
- Removed records where both `total_laid_off` and `percentage_laid_off` were missing.

### 6. Dropping Irrelevant Columns
- Dropped helper columns (like `row_id`) after cleaning to maintain a professional dataset.

---

## 🧠 Key SQL Techniques
- **CTEs (Common Table Expressions)** – for organized duplicate checking.  
- **Window Functions** – for ranking and partitioning duplicate records.  
- **String Functions** – `TRIM()`, `LIKE`, and pattern matching for data standardization.  
- **Date Functions** – `STR_TO_DATE()` for proper date formatting.  
- **Conditional Updates & Joins** – to fill missing values intelligently.  

---

## ⚙️ Challenges & Solutions
| Challenge | Solution |
|------------|-----------|
| Inconsistent industry labels | Used pattern matching and manual corrections (`LIKE 'crypto%' → 'Crypto'`). |
| Duplicate entries with same company details | Applied `ROW_NUMBER()` partitioning and removed rows with `row_num > 1`. |
| Text-formatted date columns | Used `STR_TO_DATE()` and changed datatype to `DATE`. |
| Null industry fields | Joined on company name to fill missing industry info. |

---

## 📈 Results
After cleaning:
- The dataset became **fully standardized**, **duplicate-free**, and **ready for analysis**.  
- Null values and inconsistent text entries were resolved.  
- Data integrity was preserved for trend and industry-level layoff insights.

---

## 📁 Project Files
| File | Description |
|------|--------------|
| [layoffs_raw.csv](./layoffs_raw.csv) | Original dataset |
| [layoffs_staging.sql](./layoffs_staging.sql) | SQL scripts for staging and cleaning |
| [cleaned_layoffs.csv](./cleaned_layoffs.csv) | Final cleaned dataset |
| [README.md](./README.md) | Project documentation |

---

## 🧭 How to Navigate
- Start with the `layoffs_staging.sql` file to follow the full cleaning workflow.  
- Use the **Table of Contents** above to jump between sections.  
- Each SQL section is commented for clarity and learning.

---

## 🤝 Connect With Me
If you find this project helpful or want to collaborate, reach out!  

- **LinkedIn:** [Kennedy Ogundipe](https://www.linkedin.com/in/kehinde-ogundipe-69505b323)  
- **Email:** kennedyogundipe01@gmail.com  

---

⭐ *If you like this project, don’t forget to give it a star on GitHub!*
