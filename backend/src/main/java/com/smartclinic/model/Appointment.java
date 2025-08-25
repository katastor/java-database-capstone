package com.smartclinic.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "appointments",
        indexes = {
                @Index(name = "idx_appt_time", columnList = "appointmentTime"),
                @Index(name = "idx_appt_doctor", columnList = "doctor_id"),
                @Index(name = "idx_appt_patient", columnList = "patient_id")
        })
public class Appointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    @NotNull @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @NotNull @FutureOrPresent
    private LocalDateTime appointmentTime;

    @NotNull @Enumerated(EnumType.STRING)
    private AppointmentStatus status = AppointmentStatus.SCHEDULED;

    @Size(max = 255)
    private String notes;

    // getters & setters
}
