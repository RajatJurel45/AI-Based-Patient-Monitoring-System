-- Enable TimescaleDB extension
CREATE EXTENSION IF NOT EXISTS timescaledb;

-- Patients table
CREATE TABLE IF NOT EXISTS patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Devices table
CREATE TABLE IF NOT EXISTS devices (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(id),
    device_type VARCHAR(50),
    registered_at TIMESTAMP DEFAULT NOW()
);

-- Vitals time-series table
CREATE TABLE IF NOT EXISTS vitals (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(id),
    device_id INT REFERENCES devices(id),
    heart_rate INT,
    spo2 INT,
    bp_sys INT,
    bp_dia INT,
    temperature FLOAT,
    recorded_at TIMESTAMP DEFAULT NOW()
);

-- Convert vitals into hypertable
SELECT create_hypertable('vitals', 'recorded_at', if_not_exists => TRUE);

-- Seed 10,000 patients
INSERT INTO patients (name, age, gender)
SELECT 
    'Patient_' || g,                          -- Names like Patient_1 ... Patient_10000
    (FLOOR(RANDOM() * 60) + 20)::INT,         -- Age between 20–80
    CASE WHEN RANDOM() < 0.5 THEN 'Male' ELSE 'Female' END
FROM generate_series(1, 10000) g;

-- Assign 2 devices per patient
INSERT INTO devices (patient_id, device_type)
SELECT id, 'Wearable HR Monitor' FROM patients;
INSERT INTO devices (patient_id, device_type)
SELECT id, 'Oximeter' FROM patients;
