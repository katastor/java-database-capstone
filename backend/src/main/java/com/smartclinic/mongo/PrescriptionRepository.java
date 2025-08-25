package com.smartclinic.mongo;

import org.springframework.data.mongodb.repository.MongoRepository;
import java.time.Instant;
import java.util.List;

public interface PrescriptionRepository extends MongoRepository<Prescription, String> {
    List<Prescription> findByPatientIdOrderByCreatedAtDesc(Long patientId);
    List<Prescription> findByDoctorIdAndCreatedAtBetween(Long doctorId, Instant from, Instant to);
    List<Prescription> findByAppointmentId(Long appointmentId);
}
