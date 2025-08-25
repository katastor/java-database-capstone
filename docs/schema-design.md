schema-design.md
Architecture fit (2 righe)

Dati operativi e relazionali (pazienti, dottori, appuntamenti, disponibilità) → MySQL con JPA.
Dati flessibili/non strutturati (prescrizioni dettagliate, note, allegati, log) → MongoDB con Spring Data.
