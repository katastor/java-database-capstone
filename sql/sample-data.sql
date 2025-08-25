USE smart_clinic;

-- ===== Admins =====
INSERT INTO admins (username, email, password_hash, role) VALUES
('admin', 'admin@clinic.example', '$2a$10$hashdummy', 'ADMIN');

-- ===== Doctors =====
INSERT INTO doctors (first_name, last_name, email, phone, specialization) VALUES
('Emily', 'Adams',  'eadams@clinic.example',  '+39-320-1111111', 'Cardiologist'),
('Mark',  'Johnson','mjohnson@clinic.example','+39-320-2222222', 'Neurologist'),
('Sarah', 'Lee',    'slee@clinic.example',    '+39-320-3333333', 'Orthopedist');

-- ===== Patients =====
INSERT INTO patients (first_name, last_name, email, phone, date_of_birth, gender) VALUES
('John',  'Smith',  'john.smith@example.com',  '+39-340-0000001', '1990-05-12', 'Male'),
('Alice', 'Brown',  'alice.brown@example.com', '+39-340-0000002', '1988-10-30', 'Female'),
('Tom',   'Wilson', 'tom.wilson@example.com',  '+39-340-0000003', '1995-03-20', 'Male');

-- ===== Doctor Availability (example slots) =====
-- Emily Adams (id = 1): Mon & Tue 09:00-12:00
INSERT INTO doctor_availability (doctor_id, day_of_week, slot_start, slot_end) VALUES
(1, 1, '09:00:00', '12:00:00'),
(1, 2, '09:00:00', '12:00:00');

-- Mark Johnson (id = 2): Wed 14:00-17:00
INSERT INTO doctor_availability (doctor_id, day_of_week, slot_start, slot_end) VALUES
(2, 3, '14:00:00', '17:00:00');

-- Sarah Lee (id = 3): Thu 10:00-13:00
INSERT INTO doctor_availability (doctor_id, day_of_week, slot_start, slot_end) VALUES
(3, 4, '10:00:00', '13:00:00');

-- ===== Appointments (seed) =====
-- Assume: doctor_id=1 (Adams), patient_id=1 (John), today+1 at 09:00
INSERT INTO appointments (doctor_id, patient_id, appointment_date, appointment_time, status, notes) VALUES
(1, 1, CURDATE() + INTERVAL 1 DAY, '09:00:00', 'SCHEDULED', 'Initial checkup'),
(1, 2, CURDATE() + INTERVAL 2 DAY, '10:00:00', 'SCHEDULED', 'Follow-up'),
(2, 3, CURDATE() + INTERVAL 3 DAY, '14:00:00', 'SCHEDULED', 'Neurology consult');
