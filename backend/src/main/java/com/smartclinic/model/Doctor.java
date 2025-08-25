package com.smartclinic.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "doctors", uniqueConstraints = {
        @UniqueConstraint(columnNames = "email")
})
public class Doctor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank @Size(max = 60)
    private String firstName;

    @NotBlank @Size(max = 60)
    private String lastName;

    @Email @NotBlank @Size(max = 120)
    private String email;

    @NotBlank @Size(max = 80)
    private String specialty;

    @Size(max = 255)
    private String bio;

    // getters & setters
}

