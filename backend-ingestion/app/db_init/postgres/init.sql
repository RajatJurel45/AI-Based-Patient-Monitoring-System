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

-- Initial seed data
INSERT INTO patients (name, age, gender) VALUES
('Rajat Jurel', 25, 'Male'),
('Milind Bhardwaj', 26, 'Female');

INSERT INTO devices (patient_id, device_type) VALUES
(1, 'Wearable HR Monitor'),
(1, 'Oximeter'),
(2, 'Wearable HR Monitor');
