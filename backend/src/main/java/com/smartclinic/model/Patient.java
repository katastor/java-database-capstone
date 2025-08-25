package com.smartclinic.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.time.LocalDateTime;
import java.time.LocalDate;

@Entity
@Table(name = "patients", uniqueConstraints = {
        @UniqueConstraint(columnNames = "email")
})
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank @Size(max = 60)
    private String firstName;

    @NotBlank @Size(max = 60)
    private String lastName;

    @Email @NotBlank @Size(max = 120)
    private String email;

    @Size(max = 30)
    private String phone;

    @Past
    private LocalDate dateOfBirth;

    @NotNull
    private LocalDateTime createdAt = LocalDateTime.now();

    // getters & setters
}
