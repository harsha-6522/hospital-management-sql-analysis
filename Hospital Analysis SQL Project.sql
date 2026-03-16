CREATE DATABASE hospital_project;

USE hospital_project;


SELECT * FROM patients LIMIT 5;

SELECT * FROM doctors LIMIT 5;

SELECT * FROM appointments LIMIT 5;

SELECT * FROM treatments LIMIT 5;

SELECT * FROM billing LIMIT 5;

SELECT COUNT(*) FROM patients;
SELECT COUNT(*) FROM doctors;
SELECT COUNT(*) FROM appointments;
SELECT COUNT(*) FROM treatments;
SELECT COUNT(*) FROM billing;

-- Patients by gender
SELECT gender,
COUNT(*) AS total_patients
FROM patients
GROUP BY gender;

describe patients;

-- Patients by insurance Provider
SELECT insurance_provider,
COUNT(*) AS no_of_patients
FROM patients
GROUP BY insurance_provider
ORDER BY no_of_patients DESC;


-- Doctor by Specialization
SELECT specialization,
COUNT(*) AS no_of_doctors
FROM doctors
GROUP BY specialization
ORDER BY no_of_doctors DESC;

describe appointments;

-- Appointments Status Description
SELECT status,
COUNT(*) AS total_appointments
FROM appointments
GROUP BY status 
ORDER BY total_appointments DESC;

-- Doctors with the most appointments
SELECT d.first_name, d.last_name,
COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY total_appointments DESC;

DESCRIBE treatments;

-- Most common treatments
SELECT treatment_type,
COUNT(*) AS Total_treatments 
FROM treatments
GROUP BY treatment_type
ORDER BY total_treatments DESC;

SELECT * FROM billing lIMIT 5;

-- Total revenue 
SELECT SUM(amount) AS total_revenue
FROM billing;

-- Revenue by payment method
SELECT payment_method,
SUM(amount) AS total_revenue
FROM billing
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- JOINS

-- Revenue by treatment type
SELECT t.treatment_type,
SUM(b.amount) AS total_revenue
FROM treatments t
JOIN billing b
ON t.treatment_id = b.treatment_id
GROUP BY t.treatment_type
ORDER BY total_revenue DESC;

-- Patient with doctor details
SELECT p.first_name AS patient_name, d.first_name AS doctor_name, a.appointment_date
FROM patients p
JOIN appointments a
ON p.patient_id = a.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id
LIMIT 10;


















