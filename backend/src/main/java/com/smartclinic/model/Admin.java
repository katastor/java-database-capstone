package com.smartclinic.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "admins", uniqueConstraints = {
        @UniqueConstraint(columnNames = "email")
})
public class Admin {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank @Size(max = 60)
    private String name;

    @Email @NotBlank @Size(max = 120)
    private String email;

    // in futuro userai ruoli/JWT, qui basta un placeholder
    @NotBlank @Size(min = 8)
    private String passwordHash;

    // getters & setters
}
