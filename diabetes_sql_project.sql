-- Create a new cleaned table with proper column names and data types
CREATE TABLE IF NOT EXISTS diabetes_prediction_dataset_cleaned (
    gender TEXT,
    age REAL,
    hypertension INTEGER,
    heart_disease INTEGER,
    smoking_history TEXT,
    bmi REAL,
    HbA1c_level REAL,
    blood_glucose_level REAL,
    diabetes_outcome INTEGER
);

-- Insert data from the old table into the cleaned table, casting columns as needed
INSERT INTO diabetes_prediction_dataset_cleaned (
    gender,
    age,
    hypertension,
    heart_disease,
    smoking_history,
    bmi,
    HbA1c_level,
    blood_glucose_level,
    diabetes_outcome
)
SELECT
    CAST(c1 AS TEXT),           -- gender
    CAST(c2 AS REAL),           -- age
    CAST(c3 AS INTEGER),        -- hypertension
    CAST(c4 AS INTEGER),        -- heart_disease
    CAST(c5 AS TEXT),           -- smoking_history
    CAST(c6 AS REAL),           -- bmi
    CAST(c7 AS REAL),           -- HbA1c_level
    CAST(c8 AS REAL),           -- blood_glucose_level
    CAST(c9 AS INTEGER)         -- diabetes_outcome
FROM diabetes_prediction_dataset;

-- Optional: Verify inserted data (show first 5 rows)
SELECT * FROM diabetes_prediction_dataset_cleaned LIMIT 5;

-- Optional: the code below shows if any cells from the columns are missing. Null is the output if nothing is missing.
SELECT
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS missing_age,
    SUM(CASE WHEN hypertension IS NULL THEN 1 ELSE 0 END) AS missing_hypertension,
    SUM(CASE WHEN heart_disease IS NULL THEN 1 ELSE 0 END) AS missing_heart_disease,
    SUM(CASE WHEN smoking_history IS NULL THEN 1 ELSE 0 END) AS missing_smoking_history,
    SUM(CASE WHEN bmi IS NULL THEN 1 ELSE 0 END) AS missing_bmi,
    SUM(CASE WHEN HbA1c_level IS NULL THEN 1 ELSE 0 END) AS missing_HbA1c_level,
    SUM(CASE WHEN blood_glucose_level IS NULL THEN 1 ELSE 0 END) AS missing_blood_glucose_level,
    SUM(CASE WHEN diabetes_outcome IS NULL THEN 1 ELSE 0 END) AS missing_diabetes_outcome
FROM diabetes_prediction_final_cleaned;

-- Optional enquiry : This shows the percentage of each gender that gets diabetes, 

SELECT
    gender,
    COUNT(*) AS total_patients,
    SUM(diabetes_outcome) AS diabetes_cases,
    ROUND((SUM(diabetes_outcome) * 100.0) / COUNT(*), 2) AS diabetes_percentage
FROM diabetes_prediction_dataset_cleaned
GROUP BY gender;

--  Count total patients in dataset
SELECT COUNT(*) AS total_patients FROM diabetes_prediction_final_cleaned;

--  Average BMI grouped by diabetes outcome
SELECT 
    diabetes_outcome,
    ROUND(AVG(bmi), 2) AS avg_bmi
FROM diabetes_prediction_final_cleaned
GROUP BY diabetes_outcome;

--  Distribution of smoking history categories
SELECT 
    smoking_history,
    COUNT(*) AS count
FROM diabetes_prediction_final_cleaned
GROUP BY smoking_history
ORDER BY count DESC;

-- Average HbA1c_level and blood_glucose_level for diabetic vs non-diabetic
SELECT 
    diabetes_outcome,
    ROUND(AVG(HbA1c_level), 2) AS avg_HbA1c_level,
    ROUND(AVG(blood_glucose_level), 2) AS avg_blood_glucose_level
FROM diabetes_prediction_final_cleaned
GROUP BY diabetes_outcome;

-- Number of diabetes cases by smoking history
SELECT 
    smoking_history,
    SUM(diabetes_outcome) AS diabetes_cases,
    COUNT(*) AS total_patients,
    ROUND((SUM(diabetes_outcome)*100.0)/COUNT(*), 2) AS diabetes_percentage
FROM diabetes_prediction_final_cleaned
GROUP BY smoking_history;


