# Datu basea sortu

Lehenik eta behin datu base bat sortu dugu arduino plakarekin konektatzeko

USE arduino\_db;

\
Gero taulak sortuko ditugu

CREATE TABLE Datuak (

&#x20; id INT UNSIGNED NOT NULL AUTO\_INCREMENT,

&#x20; data DATETIME NOT NULL DEFAULT CURRENT\_TIMESTAMP,

&#x20; temperatura DECIMAL(6,2) NULL,

&#x20; hezetasuna  DECIMAL(5,2) NULL,

&#x20; soinua      DECIMAL(7,2) NULL,

&#x20; detektatuta  ENUM('SI','NO') NOT NULL DEFAULT 'NO',

&#x20; PRIMARY KEY (id)

) ENGINE=InnoDB;



Datu aleatorio batzuk jarri genituen proba batzuk egiteko funtzio, prozedura...-kin

INSERT INTO Datuak (data, temperatura, hezetasuna, soinua, detektatuta) VALUES

('2025-11-25 12:00:00', 21.52, 45.20, 35.50, 'NO'),

('2025-11-25 12:01:00', 21.60, 45.80, 36.10, 'NO'),

('2025-11-25 12:02:00', 21.75, 46.50, 37.00, 'NO'),

('2025-11-25 12:03:00', 21.90, 47.10, 38.20, 'SI'),

('2025-11-25 12:04:00', 22.00, 47.80, 39.10, 'NO'),

('2025-11-25 12:05:00', 22.10, 48.50, 40.20, 'NO'),

('2025-11-25 12:06:00', 22.25, 49.10, 41.30, 'NO'),

('2025-11-26 12:07:00', 22.40, 49.80, 42.00, 'SI')...

<br>

<br>

