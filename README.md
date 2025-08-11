# Diabetes Prediction Dataset — SQL Data Cleaning & Analysis

## Project Overview

This project involves cleaning and analyzing a diabetes prediction dataset using SQL. The main goals are:

- Clean raw CSV data by defining proper column names and data types.  
- Check for missing data in key columns.  
- Perform exploratory data analysis with SQL queries to understand trends and relationships in the data.  

The dataset includes patient demographic, medical history, and lab results, along with a diabetes outcome label.

---

## Database Structure

The cleaned dataset is stored in the table:

`diabetes_prediction_dataset_cleaned`

| Column Name          | Data Type | Description                           |
|----------------------|-----------|-----------------------------------|
| gender               | TEXT      | Patient gender (Male/Female)       |
| age                  | REAL      | Patient age                       |
| hypertension         | INTEGER   | Hypertension status (0/1)          |
| heart_disease        | INTEGER   | Heart disease status (0/1)         |
| smoking_history      | TEXT      | Smoking status (Never, Former, etc)|
| bmi                  | REAL      | Body Mass Index                   |
| HbA1c_level          | REAL      | HbA1c lab test result              |
| blood_glucose_level  | REAL      | Blood glucose lab test result      |
| diabetes_outcome     | INTEGER   | Diabetes diagnosis (0 = No, 1 = Yes)|

---

## SQL Workflow Summary

- Created the cleaned table with appropriate data types.  
- Inserted data from the original raw table, casting data types as needed.  
- Verified data insertion and checked for missing/null values.  
- Performed key analyses, such as:  
  - Diabetes prevalence by gender.  
  - Average BMI by diabetes status.  
  - Distribution of smoking history categories.  
  - Average lab results by diabetes outcome.  
  - Diabetes cases segmented by smoking history.

---

## Usage

To reproduce the analysis:

1. Load your raw diabetes CSV data into a SQL table named `diabetes_prediction_dataset`.  
2. Run the SQL script to create and populate `diabetes_prediction_dataset_cleaned`.  
3. Execute the provided queries for insights.

---

## Notes

- Data cleaning involved casting types from the raw table to ensure proper analysis.  
- Missing data checks help ensure data quality before analysis.

---

Feel free to reach out if you have any questions!
