DROP TABLE IF EXISTS be_alap.gender CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.gender (
genId 		INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
genderName 	VARCHAR (20) NOT NULL
);

INSERT INTO be_alap.gender (gendername)
VALUES ('Male'), ('Female');

COMMENT ON TABLE  be_alap.gender IS 'Clients gender';
COMMENT ON COLUMN be_alap.gender.genId IS 'gender unique id';
COMMENT ON COLUMN be_alap.gender.genderName IS 'gender name';

DROP TABLE IF EXISTS be_alap.treatment CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.treatment(
treatId 	INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
treatName 	VARCHAR(20) NOT NULL
);

INSERT INTO be_alap.treatment (treatname)
VALUES ('Mr. '), ('Mrs. '), ('Miss. ');

COMMENT ON TABLE  be_alap.treatment IS 'How to refer to the client';
COMMENT ON COLUMN be_alap.treatment.treatId IS 'treatment unique id';
COMMENT ON COLUMN be_alap.treatment.treatName IS 'treatment name';

DROP TABLE IF EXISTS be_alap.natDocument CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.natDocument (
docId	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
docName VARCHAR(25),
value 	VARCHAR(40)
);

INSERT INTO be_alap.natdocument (docname, value)
VALUES ('DNI', 0000000), ('NIE', 00000000), ('Social Welfare', 111111), ('Cédula de identidad', 4444444);

COMMENT ON TABLE  be_alap.natDocument IS 'Clients document';
COMMENT ON COLUMN be_alap.natDocument.docId IS 'Document unique id';
COMMENT ON COLUMN be_alap.natDocument.docName IS 'Documents name -DNI, passport-';
COMMENT ON COLUMN be_alap.natDocument.value IS 'Document value';

DROP TABLE IF EXISTS be_alap.preferences CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.preferences (
prefId 		INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
prefName 	VARCHAR(50)
);

INSERT INTO be_alap.preferences (prefname)
VALUES ('Football'), ('Netflix'), ('Jacuzzi');

COMMENT ON TABLE  be_alap.preferences  IS 'Clients room/hotel preferences';
COMMENT ON COLUMN be_alap.preferences.prefId IS 'Preference unique id';
COMMENT ON COLUMN be_alap.preferences.prefName IS 'Preference name';

DROP TABLE IF EXISTS be_alap.country CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.country (
countryId 		INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
countryName 	VARCHAR(100),
countryAbrev 	VARCHAR(2)
);

INSERT INTO be_alap.country (countryname, countryabrev)
VALUES ('Spain', 'ES'), ('Italy', 'IT'), ('Japan', 'JP'), ('Brazil', 'BR');

DROP TABLE IF EXISTS be_alap.regime CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.regime (
regId 	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
regName VARCHAR (50)
);

INSERT INTO be_alap.regime (regName) 
VALUES ('SA'), ('AD'), ('MP'), ('PC'), ('TI'), ('SP'), ('HM');

DROP TABLE IF EXISTS be_alap.status CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.status (
statId 		INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
statName 	VARCHAR(50)
);

DROP TABLE IF EXISTS be_alap.audit CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.audit (
auditId 	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
auditDate 	TIMESTAMP,
title 		VARCHAR(50),
description VARCHAR(250),
process 	VARCHAR(300)
);

INSERT INTO be_alap.audit (auditdate, title, description, process)
VALUES (now(), 'Tot bé', 'tot va bé', 'no, idoi tot va bé. Ves tranquil'),
(now(), 'Regulero', 'ni fu ni fa', 'no sé qué pasa pero medio va la cosa'),
(now(), 'Muy mal', 'Muerto vivo', 'estoy muerto vivo, diah. La tierra está jodida');

DROP TABLE IF EXISTS be_alap.complement CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.complement (
compId 			INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
title 			VARCHAR(25) NOT NULL,
description 	VARCHAR(500) NOT NULL,
price 			FLOAT NOT NULL,
availability	BOOLEAN NOT NULL,
dispDate 		DATE NOT NULL,
image 			VARCHAR(500)
);

DROP TABLE IF EXISTS be_alap.registeredClient CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.registeredClient (
clientId 	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
country		INTEGER REFERENCES be_alap.country(countryId),
natDoc		INTEGER REFERENCES be_alap.natDocument(docId),
genId		INTEGER REFERENCES be_alap.gender(genId),
treatment	INTEGER REFERENCES be_alap.treatment(treatId),
cName 		VARCHAR(50) 	NOT NULL,
surname 	VARCHAR(100)	NOT NULL,
birthdate 	DATE 			NOT NULL,
email 		VARCHAR(250)	NOT NULL,
nationality VARCHAR(50),
adress 		VARCHAR(300),
zipCode 	VARCHAR(20),
residence	VARCHAR(150)
);

COMMENT ON TABLE  be_alap.registeredClient IS 'User registered on db';
COMMENT ON COLUMN be_alap.registeredClient.clientId IS 'Unique user id';
COMMENT ON COLUMN be_alap.registeredClient.cName IS 'User name';
COMMENT ON COLUMN be_alap.registeredClient.surname IS 'User surname';
COMMENT ON COLUMN be_alap.registeredClient.birthdate IS 'Users birthdate';
COMMENT ON COLUMN be_alap.registeredClient.email IS 'Users email';
COMMENT ON COLUMN be_alap.registeredClient.nationality IS 'Users nationality';
COMMENT ON COLUMN be_alap.registeredClient.adress IS 'Users residence adress';
COMMENT ON COLUMN be_alap.registeredClient.zipCode IS 'Users residence zipcode';
COMMENT ON COLUMN be_alap.registeredClient.residence IS 'Users region';

DROP TABLE IF EXISTS be_alap.nonRegisteredClient CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.nonRegisteredClient (
nonclientId 	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
natDoc			INTEGER REFERENCES be_alap.natDocument(docId),
treatment		INTEGER REFERENCES be_alap.treatment(treatId),
noncName 		VARCHAR(50) NOT NULL,
noncsurname 	VARCHAR(100) NOT NULL,
noncbirthdate 	DATE NOT NULL,
email 			VARCHAR(250) NOT NULL,
nationality 	VARCHAR(50),
adress 			VARCHAR(300),
zipCode 		VARCHAR(20),
residence		VARCHAR(150)
);

COMMENT ON TABLE  be_alap.nonRegisteredClient IS 'Non user on db';
COMMENT ON COLUMN be_alap.nonRegisteredClient.nonclientId IS 'Unique non user id';
COMMENT ON COLUMN be_alap.nonRegisteredClient.noncName IS 'Non User name';
COMMENT ON COLUMN be_alap.nonRegisteredClient.noncsurname IS 'Non User surname';
COMMENT ON COLUMN be_alap.nonRegisteredClient.noncbirthdate IS 'Non Users birthdate';
COMMENT ON COLUMN be_alap.nonRegisteredClient.email IS 'Non Users email';
COMMENT ON COLUMN be_alap.nonRegisteredClient.nationality IS 'Non Users nationality';
COMMENT ON COLUMN be_alap.nonRegisteredClient.adress IS 'Non Users residence adress';
COMMENT ON COLUMN be_alap.nonRegisteredClient.zipCode IS 'Non Users residence zipcode';
COMMENT ON COLUMN be_alap.nonRegisteredClient.residence IS 'Non Users region';

DROP TABLE IF EXISTS be_alap.clientpreferences CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.clientpreferences (
clientId	INTEGER REFERENCES be_alap.registeredClient(clientId),
prefid 		INTEGER REFERENCES be_alap.preferences(prefId)
);

DROP TABLE IF EXISTS be_alap.hotel CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.hotel (
hotId 			INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
country			INTEGER REFERENCES be_alap.country(countryId),
regime			INTEGER REFERENCES be_alap.regime(regId),
audit			INTEGER REFERENCES be_alap.audit(auditId),
hotName	 		VARCHAR(100),
stars 			INTEGER,
totalRooms 		INTEGER,
floors 			INTEGER,
receptionMail 	VARCHAR(250),
directionMail 	VARCHAR(250),
direction		VARCHAR(300),
geoData 		FLOAT,
image 			VARCHAR(500),
description		VARCHAR(1000),
isActive		BOOLEAN
);

DROP TABLE IF EXISTS be_alap.room CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.room (
roomId 		INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
numAdults 	INTEGER NOT NULL,
numChildren INTEGER NOT NULL,
numBabies 	INTEGER NOT NULL,
peopleName 	VARCHAR (500)
);

DROP TABLE IF EXISTS be_alap.roomComplement CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.roomComplement (
complement 		INTEGER REFERENCES be_alap.complement(compId),
room			INTEGER REFERENCES be_alap.room(roomId),
compQuantity 	INTEGER
);

DROP TABLE IF EXISTS be_alap.paymentType CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.paymentType (
pTypeId INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
pName 	VARCHAR(25) NOT NULL
);

INSERT INTO be_alap.paymenttype (pName)
VALUES ('Credit Card'), ('Bank Transaction'), ('Paypal'), ('Sofor'), ('TPV');

DROP TABLE IF EXISTS be_alap.status CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.status (
statId INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
statName VARCHAR(50)
);

INSERT INTO be_alap.status (statName)
VALUES ('Booked'), ('Process'), ('Cancelled'); 

DROP TABLE IF EXISTS be_alap.booking CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.booking (
bookId 		INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
hotel		INTEGER REFERENCES be_alap.hotel(hotId),
regClient	INTEGER REFERENCES be_alap.registeredClient(clientId),
nonClient	INTEGER REFERENCES be_alap.nonRegisteredClient(nonClientId),
room		INTEGER REFERENCES be_alap.room(roomId),
payment		INTEGER REFERENCES be_alap.paymentType(pTypeId),
audit		INTEGER REFERENCES be_alap.audit(auditId),
status		INTEGER REFERENCES be_alap.status(statId),
bookDate 	TIMESTAMP NOT NULL,
entryDate 	TIMESTAMP NOT NULL,
exitDate 	TIMESTAMP NOT NULL,
numNights 	INTEGER NOT NULL,
numAdults 	INTEGER NOT NULL,
numKids		INTEGER NOT NULL,
numBabies 	INTEGER NOT NULL,
numRooms 	INTEGER NOT NULL,
taxBase 	FLOAT,
totalPrice 	FLOAT
);

DROP TABLE IF EXISTS be_alap.yearsOld CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.yearsOld (
yearsId 	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
ageRange	VARCHAR(50) NOT NULL
);

INSERT INTO be_alap.yearsold (agerange)
VALUES ('Babies'), ('Children'), ('Adults');

COMMENT ON TABLE be_alap.yearsOld IS 'Guest age range';

DROP TABLE IF EXISTS be_alap.guest CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.guest (
guestId 	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
yearsRange	INTEGER REFERENCES be_alap.yearsOld(yearsId),
room		INTEGER REFERENCES be_alap.room(roomId),
guestName 	VARCHAR(150) NOT NULL,
surname		VARCHAR(150) NOT NULL,
birthdate 	DATE NOT NULL
);

COMMENT ON TABLE be_alap.guest IS 'Room guest data';
COMMENT ON COLUMN be_alap.guest.guestId IS 'Unique guest id';
COMMENT ON COLUMN be_alap.guest.yearsRange IS 'Age range id FK';
COMMENT ON COLUMN be_alap.guest.room IS 'Room id FK';
COMMENT ON COLUMN be_alap.guest.guestName IS 'Guest name';

DROP TABLE IF EXISTS be_alap.roomType CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.roomType (
rTypeId 	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
room		INTEGER REFERENCES be_alap.room(roomId) NOT NULL,
entryDate	TIMESTAMP NOT NULL,
exitDate	TIMESTAMP NOT NULL,
maxNights	INTEGER NOT NULL,
minAdults	INTEGER NOT NULL,
maxAdults	INTEGER NOT NULL,
minChildren	INTEGER NOT NULL,
maxChildren	INTEGER NOT NULL,
minBabies	INTEGER NOT NULL,
maxBabies	INTEGER NOT NULL,
minRooms	INTEGER NOT NULL,
maxRooms	INTEGER NOT NULL,
taxBase		FLOAT NOT NULL,
totalPrice	FLOAT NOT NULL
);

DROP TABLE IF EXISTS be_alap.payStatus CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.payStatus (
pStatId INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
pStatusName VARCHAR(25),
isAccepted BOOLEAN
);

INSERT INTO be_alap.paystatus (pStatusName, isaccepted) 
VALUES ('accepted', TRUE), ('process', FALSE), ('refused', FALSE);

DROP TABLE IF EXISTS be_alap.sofor CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.sofor (
soforId INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
booking	INTEGER REFERENCES be_alap.booking(bookId),
payStat	INTEGER REFERENCES be_alap.payStatus(pStatId),
sToken	VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS be_alap.paypal CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.paypal (
payPalId INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
booking	INTEGER REFERENCES be_alap.booking(bookId),
payStat	INTEGER REFERENCES be_alap.payStatus(pStatId),
pToken	VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS be_alap.tpv CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.tpv (
tpvId INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
booking	INTEGER REFERENCES be_alap.booking(bookId),
payStat	INTEGER REFERENCES be_alap.payStatus(pStatId),
tpvToken	VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS be_alap.bankTransaction CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.bankTransaction (
bankId		INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
booking		INTEGER REFERENCES be_alap.booking(bookId),
holder		VARCHAR(50) NOT NULL,
bankName	VARCHAR(35) NOT NULL,
bankAcc		VARCHAR(25) NOT NULL
);

DROP TABLE IF EXISTS be_alap.creditCard CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.creditCard (
cardId 			INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
booking			INTEGER REFERENCES be_alap.booking(bookId),
cardName		VARCHAR(35) NOT NULL,
cardNumber		INTEGER	NOT NULL,
cardHolder		INTEGER NOT NULL,
expiratoinDate	DATE NOT NULL
);