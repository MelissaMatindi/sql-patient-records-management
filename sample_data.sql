-- Sample data for Patient Records Management System (EHR)
-- Run this AFTER schema.sql to populate tables
-- Assumes patient_records_db is active

USE patient_records_db;

-- Insert 2 sample Patients
INSERT INTO Patients (first_name, last_name, date_of_birth, email, phone, address)
VALUES 
    ('John', 'Doe', '1980-05-15', 'john.doe@email.com', '555-0101', '123 Elm St, Cityville'),
    ('Jane', 'Smith', '1975-03-22', 'jane.smith@email.com', '555-0202', '456 Oak Ave, Townburg');

-- Insert 2 sample Doctors
INSERT INTO Doctors (first_name, last_name, specialty)
VALUES 
    ('Dr. Alice', 'Johnson', 'Cardiology'),
    ('Dr. Bob', 'Lee', 'Internal Medicine');

-- Insert 3 sample Visits (linked to patients and doctors)
INSERT INTO Visits (patient_id, doctor_id, visit_date, notes)
VALUES 
    (1, 1, '2025-01-10', 'Routine checkup; blood pressure elevated.'),
    (1, 2, '2025-06-15', 'Follow-up on hypertension; adjust meds.'),
    (2, 1, '2025-02-20', 'Annual physical; all clear.');

-- Insert 3 sample Medical Histories (linked to patients)
INSERT INTO MedicalHistories (patient_id, medical_condition, diagnosis_date)
VALUES 
    (1, 'Hypertension', '2020-03-05'),
    (1, 'Type 2 Diabetes', '2022-07-12'),
    (2, 'Asthma', '2018-11-30');

-- Insert 3 sample Medications
INSERT INTO Medications (name, description)
VALUES 
    ('Lisinopril', 'ACE inhibitor for blood pressure control.'),
    ('Metformin', 'Oral medication for type 2 diabetes.'),
    ('Albuterol', 'Inhaler for asthma relief.');

-- Insert 3 sample PatientMedications (Many-to-Many links)
INSERT INTO PatientMedications (patient_id, medication_id, prescribed_date)
VALUES 
    (1, 1, '2025-01-10'),  -- John gets Lisinopril
    (1, 2, '2025-06-15'),  -- John gets Metformin
    (2, 3, '2025-02-20');  -- Jane gets Albuterol