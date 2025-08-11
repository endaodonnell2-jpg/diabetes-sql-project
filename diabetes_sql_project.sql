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
