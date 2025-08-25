package com.smartclinic.repository;

import com.smartclinic.model.Appointment;
import com.smartclinic.model.Doctor;
import com.smartclinic.model.Patient;
import com.smartclinic.model.AppointmentStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface AppointmentRepository extends JpaRepository<Appointment, Long> {
    List<Appointment> findByDoctorAndAppointmentTimeBetween(Doctor d, LocalDateTime start, LocalDateTime end);
    List<Appointment> findByPatientOrderByAppointmentTimeDesc(Patient p);
    long countByDoctorAndStatus(Doctor d, AppointmentStatus status);
}
