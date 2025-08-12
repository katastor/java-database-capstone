# Smart Clinic – Schema & Architettura

## 1) Architecture Summary
L’app segue un’architettura a 3 livelli:
- **Presentation**: pagine HTML/CSS/JS renderizzate con **Thymeleaf** (Spring MVC) e consumo di **REST API**.
- **Application**: **Spring Boot** con due ingressi: Controller **MVC** per le pagine e Controller **REST** per JSON. La logica è nei **Service**, l’accesso ai dati in **Repository**.
- **Data**: due database. **MySQL** (via **Spring Data JPA**) per dati relazionali (Patient, Doctor, Appointment, Admin). **MongoDB** (via **Spring Data MongoDB**) per dati flessibili (Prescription/Note). Autenticazione **JWT** verrà aggiunta nei moduli successivi.

## 2) Numbered Flow (Request/Response)
1. L’utente apre una pagina (es. /login o /appointments) o chiama una REST API.
2. **Spring DispatcherServlet** instrada la richiesta al Controller corretto.
3. (Sicurezza, modulo 4) Il filtro JWT verifica eventuali token.
4. **MVC**: Controller MVC chiama un **Service**; **REST**: Controller REST chiama un **Service**.
5. Il **Service** applica la business logic e invoca i **Repository**.
6. **Repository JPA → MySQL** per entità relazionali (Patient/Doctor/Appointment/Admin).
7. **Repository Mongo → MongoDB** per documenti flessibili (Prescription).
8. I dati tornano al **Service**, poi al **Controller**.
9. **MVC**: il Controller popola il **Model** e rende una **View Thymeleaf** → HTML al browser.
10. **REST**: il Controller restituisce **JSON** al client/frontend.
11. (Cross-cutting) Validazioni, logging, gestione errori @ControllerAdvice.
