DELETE FROM practicas_alap.status 
WHERE statname IS NOT NULL; 
INSERT INTO practicas_alap.status (statname) VALUES ('enviado'), ('aprobado'), ('rechazado');
