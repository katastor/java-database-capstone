# Java Database Capstone

Progetto finale: **Smart Clinic Management System**  
Questo progetto è parte del corso e ha come obiettivo la creazione di un sistema gestionale per cliniche intelligenti, integrando dashboard HTML, REST API e database relazionali e non relazionali.

---

##  Obiettivi del Progetto
- Comprendere e implementare un'architettura **a tre livelli** (Presentation, Application, Data).
- Utilizzare **Spring Boot**, **Thymeleaf** e **REST API** per la parte applicativa.
- Integrare due database:
  - **MySQL** (tramite Spring Data JPA)
  - **MongoDB** (tramite Spring Data MongoDB)
- Creare e documentare la struttura architetturale.

---

##  Documentazione
- [Schema & Architettura](docs/schema-architecture.md)

---

##  Tecnologie Utilizzate
- **Java 17**
- **Spring Boot**
- **Spring Data JPA**
- **Spring Data MongoDB**
- **Thymeleaf**
- **REST API**
- **MySQL**
- **MongoDB**

---

##  Licenza
Questo progetto è realizzato per scopi didattici.

## Database

Gli script del database sono in `sql/`.

### Creazione rapida (MySQL locale già attivo)
1. Apri un client MySQL e lancia:
   ```sql
   SOURCE ./sql/schema.sql;
   SOURCE ./sql/sample-data.sql;
