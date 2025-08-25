-- Smart Clinic - MySQL Schema
-- Safe re-run
CREATE DATABASE IF NOT EXISTS smart_clinic
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE smart_clinic;

-- For FK support
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS doctor_availability;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS admins;

SET FOREIGN_KEY_CHECKS = 1;

-- =============== ADMINS =================
CREATE TABLE admins (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  username      VARCHAR(50)  NOT NULL UNIQUE,
  email         VARCHAR(100) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role          VARCHAR(20)  NOT NULL DEFAULT 'ADMIN',
  created_at    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =============== DOCTORS ================
CREATE TABLE doctors (
  id             INT AUTO_INCREMENT PRIMARY KEY,
  first_name     VARCHAR(60)  NOT NULL,
  last_name      VARCHAR(60)  NOT NULL,
  email          VARCHAR(100) NOT NULL UNIQUE,
  phone          VARCHAR(30),
  specialization VARCHAR(80)  NOT NULL,
  created_at     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Optional search index
CREATE INDEX idx_doctors_lastname ON doctors(last_name);

-- =============== PATIENTS ===============
CREATE TABLE patients (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  first_name  VARCHAR(60)  NOT NULL,
  last_name   VARCHAR(60)  NOT NULL,
  email       VARCHAR(100) NOT NULL UNIQUE,
  phone       VARCHAR(30),
  date_of_birth DATE,
  gender      VARCHAR(20),
  created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE INDEX idx_patients_lastname ON patients(last_name);

-- ======= DOCTOR AVAILABILITY (time slots) =======
CREATE TABLE doctor_availability (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  doctor_id   INT         NOT NULL,
  day_of_week TINYINT     NOT NULL,  -- 1=Mon ... 7=Sun
  slot_start  TIME        NOT NULL,
  slot_end    TIME        NOT NULL,
  created_at  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT fk_av_doctor
    FOREIGN KEY (doctor_id) REFERENCES doctors(id)
    ON DELETE CASCADE ON UPDATE CASCADE,

  CONSTRAINT uq_doctor_slot UNIQUE (doctor_id, day_of_week, slot_start, slot_end)
) ENGINE=InnoDB;

-- =============== APPOINTMENTS ===========
CREATE TABLE appointments (
  id               INT AUTO_INCREMENT PRIMARY KEY,
  doctor_id        INT        NOT NULL,
  patient_id       INT        NOT NULL,
  appointment_date DATE       NOT NULL,
  appointment_time TIME       NOT NULL,
  status           ENUM('SCHEDULED','COMPLETED','CANCELLED') NOT NULL DEFAULT 'SCHEDULED',
  notes            VARCHAR(500),

  created_at       TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT fk_appt_doctor
    FOREIGN KEY (doctor_id)  REFERENCES doctors(id)
    ON DELETE CASCADE ON UPDATE CASCADE,

  CONSTRAINT fk_appt_patient
    FOREIGN KEY (patient_id) REFERENCES patients(id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Avoid double booking same doctor same slot
CREATE UNIQUE INDEX uq_doctor_slot
  ON appointments(doctor_id, appointment_date, appointment_time);

-- Helpful index: patient’s timeline
CREATE INDEX idx_appt_patient_date
  ON appointments(patient_id, appointment_date);
