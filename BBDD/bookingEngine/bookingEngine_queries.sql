-- Insertar hoteles
INSERT INTO be_alap.hotel (country,
regime,
audit,
hotname,
stars,
totalrooms,
floors,
receptionmail,
directionmail,
direction,
geodata,
image,
description,
isactive)

VALUES (1,
		2,
		1,
		'Iberostar Guapo',
		5,
		100,
		5,
		'reception@mail.xd',
		'direction@mail.lmao',
		'Carrer del mig 3',
		231231.121,
		'urlIberostarGuapo.png',
		'Hotel bien guapo en a pie de playa',
		TRUE
),
		(1,
		5,
		3,
		'Melià Feo',
		1,
		25,
		2,
		'reception@mail.xd',
		'direction@mail.lmao',
		'Carrer del sobra 2',
		231231.121,
		'urlMeliaFeo.png',
		'Hotel bien feo en Son Gotleu',
		TRUE
)

-- Gente
INSERT INTO be_alap.registeredclient (country,
										natdoc,
										genid,
										treatment,
										cname,
										surname,
										birthdate,
										email,
										nationality,
										adress,
										zipcode,
										residence)
VALUES 								(1,
									1,
									2,
									3,
									'Antonia',
									'Demonia',
									now(),
									'toniademonia@scam.exe',
									'ES',
									'C/ Me la invento 69',
									07001,
									'Madrid');
INSERT INTO be_alap.registeredclient (country,
										natdoc,
										genid,
										treatment,
										cname,
										surname,
										birthdate,
										email,
										nationality,
										adress,
										zipcode,
										residence)
VALUES 								(2,
									1,
									2,
									3,
									'Markos',
									'Heredia',
									now(),
									'pacopepeteamo@scam.exe',
									'ES',
									'C/ Me la invento 70',
									07001,
									'Murcia');

-- Hacer reserva
INSERT INTO be_alap.booking (hotel,
							regclient,
							nonclient,
							room,
							payment,
							audit,
							status,
							bookdate,
							entrydate,
							exitdate,
							numnights,
							numadults,
							numbabies,
							numrooms,
							taxbase,
							totalprice)
					
					VALUES (1,
							1,
							NULL,
							1,
							3,
							1,
							1,
							now(),
							now(),
							now(),
							5,
							2,
							0,
							1,
							129.99,
							176.96
							)
							
INSERT INTO be_alap.booking (hotel,
							regclient,
							nonclient,
							room,
							payment,
							audit,
							status,
							bookdate,
							entrydate,
							exitdate,
							numnights,
							numadults,
							numbabies,
							numrooms,
							taxbase,
							totalprice)
					
					VALUES (1,
							2,
							NULL,
							1,
							3,
							1,
							1,
							'2015-01-03 12:52:48.641',
							'2015-01-05 12:52:48.641',
							'2015-01-07 12:52:48.641',
							5,
							2,
							0,
							1,
							129.99,
							176.96
							)
-- Booking CANCELADO
INSERT INTO be_alap.booking (hotel,
							regclient,
							nonclient,
							room,
							payment,
							audit,
							status,
							bookdate,
							entrydate,
							exitdate,
							numnights,
							numadults,
							numbabies,
							numrooms,
							taxbase,
							totalprice)
					
					VALUES (1,
							2,
							NULL,
							1,
							3,
							3,
							3,
							'2015-01-03 12:52:48.641',
							'2015-01-05 12:52:48.641',
							'2015-01-07 12:52:48.641',
							5,
							2,
							0,
							1,
							129.99,
							176.96
							)

-- Update reserva
UPDATE be_alap.booking b
SET status = 2
WHERE bookid = 2;

-- Hoteles activos españa
SELECT *
FROM be_alap.hotel h 
WHERE country = 1 AND isactive = TRUE ;

-- Hoteles activos España-Mallorca
SELECT *
FROM be_alap.hotel h
WHERE description = 'Mallorca' AND isactive = TRUE;

-- Reservas comprendidas Enero
SELECT * 
FROM be_alap.booking b 
WHERE EXTRACT (MONTH FROM b.entrydate) = 1 AND EXTRACT(MONTH FROM b.exitdate) = 1 

-- Reservas de un hotel en concreto
SELECT *
FROM be_alap.booking b 
WHERE hotel = 1

-- Reservas enero 2015
SELECT *
FROM be_alap.booking b 
WHERE bookdate BETWEEN '2015-01-01 00:00:00.0' AND '2015-01-31 00:00:00.0'

-- Reservas en mallorca
SELECT *
FROM be_alap.booking b INNER JOIN be_alap.hotel h ON b.hotel = h.hotid 
WHERE description = 'Mallorca'

-- Reservas en Mallorca canceladas
SELECT *
FROM be_alap.booking b INNER JOIN be_alap.hotel h ON b.hotel = h.hotid 
WHERE description = 'Mallorca' AND status = 3

-- Reservas en Mallorca de usuarios registrados
SELECT *
FROM be_alap.booking b INNER JOIN be_alap.hotel h ON b.hotel = h.hotid
WHERE description = 'Mallorca' AND nonclient IS NULL 

-- Reservas sin ofertas
SELECT *
FROM be_alap.booking b 
FULL OUTER JOIN be_alap.bookingoffer b2 ON b.bookid = b2.booking 
WHERE b2.booking IS NULL

-- Preferencias Golf y Playa
SELECT *
FROM be_alap.booking b 
INNER JOIN be_alap.clientpreferences c ON b.regclient = c.clientid AND c.prefid = 4
INNER JOIN be_alap.clientpreferences c2 ON b.regclient = c2.clientid AND c2.prefid = 5

-- Auditoria de un hotel en enero de 2015
SELECT h.audit 
FROM be_alap.hotel h 
WHERE h.hotid = 1

-- Reservas con productos complementarios, ofertas, usuarios registrados, de  Mallorca de hoteles de 5 estrellas, con más de 1 habitación
SELECT *
FROM be_alap.booking b INNER JOIN be_alap.hotel h ON b.hotel = h.hotid 
INNER JOIN be_alap.room r ON b.room = r.roomid 
INNER JOIN be_alap.bookingoffer b2 ON b.bookid = b2.booking 
INNER JOIN be_alap.roomcomplement r2 ON r.roomid = r2.room 
WHERE h.stars = 5 AND h.totalrooms > 1 AND h.description = 'Mallorca'

-- Importe total de reservas realizadas en ENERO 2015
SELECT SUM(b.totalprice) AS total 
FROM be_alap.booking b
WHERE bookdate BETWEEN '2015-01-01 00:00:00.0' AND '2015-01-31'

-- Importe total de productos complementarios adquiridos en Reservas de Enero 2015
SELECT SUM(c.price * r2.compquantity) AS totalComplementos
FROM be_alap.booking b INNER JOIN be_alap.room r ON b.room = r.roomid 
INNER JOIN be_alap.roomcomplement r2 ON r.roomid = r2.room 
INNER JOIN be_alap.complement c ON r2.complement = c.compid 
WHERE bookdate BETWEEN '2015-01-01 00:00:00.0' AND '2015-01-31'
