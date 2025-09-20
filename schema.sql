CREATE DATABASE patient_records_db;
USE patient_records_db;

-- Table for Patients (core entity for EHR)
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    CONSTRAINT chk_dob CHECK (date_of_birth < CURDATE())
);

-- Table for Doctors (healthcare providers)
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL
);

-- Table for Visits (clinical encounters)
CREATE TABLE Visits (
    visit_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    visit_date DATE NOT NULL,
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE RESTRICT,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE RESTRICT
);

-- Table for Medical Histories (patient conditions/diagnoses)
CREATE TABLE MedicalHistories (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    condition VARCHAR(200) NOT NULL,
    diagnosis_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE
);

-- Table for Medications (drugs prescribed)
CREATE TABLE Medications (
    medication_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Junction table for Many-to-Many between Patients and Medications
CREATE TABLE PatientMedications (
    patient_id INT NOT NULL,
    medication_id INT NOT NULL,
    prescribed_date DATE NOT NULL,
    PRIMARY KEY (patient_id, medication_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (medication_id) REFERENCES Medications(medication_id) ON DELETE CASCADE
);

-- An index for faster email lookups (common in EHR systems)
CREATE INDEX idx_patient_email ON Patients(email);