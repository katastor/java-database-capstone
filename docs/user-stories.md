Smart Clinic — User Stories

Ruoli: Admin, Doctor, Patient.
Obiettivo: coprire autenticazione, gestione utenti, appuntamenti, prescrizioni e visibilità per ruolo.

US-1 — Login con JWT

As a user (Admin/Doctor/Patient)
I want to log in with email/password
So that I can access my dashboard and features.
AC

POST /auth/login con credenziali valide → 200 + accessToken JWT.

Token include sub, role, exp.

Credenziali errate → 401.
Priority: High

US-2 — Admin crea un Doctor

As an Admin
I want to create a Doctor profile
So that doctors can be onboarded.
AC

POST /doctors (ADMIN only) con validazioni (email univoca, specialty non vuota).

201 Created + Location header.
Priority: High

US-3 — Admin crea un Patient

As an Admin
I want to create a Patient profile
So that patients can book appointments.
AC

POST /patients (ADMIN only) con validazioni (email univoca, dob valida).

201 Created.
Priority: High

US-4 — Patient cerca dottori

As a Patient
I want to list and filter doctors by specialty/text
So that I can choose the right doctor.
AC

GET /doctors?specialty=&q= restituisce elenco filtrato.

Tempo risposta demo < 1s.
Priority: Medium

US-5 — Patient prenota appuntamento

As a Patient
I want to book an appointment choosing date/time
So that I can schedule a visit.
AC

POST /appointments valida slot libero per doctorId + date + timeSlot (no double-book).

201 con dettagli appuntamento (status=BOOKED).
Priority: High

US-6 — Patient gestisce i propri appuntamenti

As a Patient
I want to view/update/cancel my appointments
So that I can manage my schedule.
AC

GET /appointments?patientId=me → solo miei.

PUT /appointments/{id} permette cambio orario se libero.

DELETE /appointments/{id} → annulla (o rimuove) se owner.
Priority: Medium

US-7 — Doctor vede agenda del giorno

As a Doctor
I want to view my appointments for a chosen date
So that I can prepare my day.
AC

GET /appointments?doctorId=me&date=YYYY-MM-DD → solo miei.
Priority: High

US-8 — Doctor crea una prescrizione (MongoDB)

As a Doctor
I want to create a prescription for a completed visit
So that the patient can access it later.
AC

POST /prescriptions (doctor owner) con appointmentId valido.

Salva documento in MongoDB.

201 Created.
Priority: Medium

US-9 — Patient visualizza le proprie prescrizioni

As a Patient
I want to list my prescriptions
So that I can review my therapy.
AC

GET /prescriptions?patientId=me → solo le mie.
Priority: Medium

US-10 — Sicurezza per ruolo (RBAC)

As a system
I want to enforce access control by roles
So that users see only allowed data.
AC

Rotte protette con JWT.

Pazienti non accedono a dati altrui; Dottori vedono solo i propri appuntamenti/prescrizioni; Admin full access sulle anagrafiche.
Priority: High

US-11 — Dashboard MVC (Thymeleaf)

As a user
I want an HTML dashboard per ruolo
So that I can interact without raw APIs.
AC

/login → sessione/token; /dashboard mostra viste in base al ruolo.
Priority: Medium

US-12 — Avvio in Docker

As a developer
I want to run the stack with docker compose up
So that the environment is reproducible.
AC

Compose con app, mysql, mongodb; env vars per connessioni; dati demo caricati.
Priority: Medium
