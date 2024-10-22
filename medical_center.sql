-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE doctors_patients (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL
);

INSERT INTO doctors (name, specialty)
VALUES 
('Roger Rabbit', 'Podiatry'),
('Donald Pepper', 'Cardiology');

INSERT INTO patients (name)
VALUES 
('George Bush'),
('Barack Obama'),
('Donald Trump');

INSERT INTO doctors_patients (doctor_id, patient_id)
VALUES 
(1, 2),
(2, 1),
(2, 3);

INSERT INTO diseases (disease_name, patient_id)
VALUES 
('Athletes Foot', 2),
('Enlarged Heart', 1),
('Clogged Arteries', 3),
('Black Heart', 3);