USE smart_clinic;

-- Report: agenda giornaliera di un medico
DROP PROCEDURE IF EXISTS sp_doctor_daily_schedule;
DELIMITER //
CREATE PROCEDURE sp_doctor_daily_schedule(IN p_doctor_id INT, IN p_date DATE)
BEGIN
  SELECT a.id, a.appointment_date, a.appointment_time, a.status,
         p.first_name AS patient_first, p.last_name AS patient_last
  FROM appointments a
  JOIN patients p ON p.id = a.patient_id
  WHERE a.doctor_id = p_doctor_id
    AND a.appointment_date = p_date
  ORDER BY a.appointment_time;
END //
DELIMITER ;

-- Report: storico appuntamenti paziente
DROP PROCEDURE IF EXISTS sp_patient_history;
DELIMITER //
CREATE PROCEDURE sp_patient_history(IN p_patient_id INT)
BEGIN
  SELECT a.id, a.appointment_date, a.appointment_time, a.status,
         d.first_name AS doctor_first, d.last_name AS doctor_last, d.specialization
  FROM appointments a
  JOIN doctors d ON d.id = a.doctor_id
  WHERE a.patient_id = p_patient_id
  ORDER BY a.appointment_date DESC, a.appointment_time DESC;
END //
DELIMITER ;
