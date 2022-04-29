DROP TABLE IF EXISTS be_alap.registeredClient CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.registeredClient (
clientId 	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
cName 		VARCHAR(50) NOT NULL,
surname 	VARCHAR(100) NOT NULL,
birthdate 	DATE NOT NULL,
email 		VARCHAR(250) NOT NULL,
nationality VARCHAR(50),
adress 		VARCHAR(300),
zipCode 	VARCHAR(20),
residence	VARCHAR(150)
);

COMMENT ON TABLE be_alap.registeredClient IS 'User registered on db';
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
noncName 		VARCHAR(50) NOT NULL,
noncsurname 	VARCHAR(100) NOT NULL,
noncbirthdate 	DATE NOT NULL,
email 			VARCHAR(250) NOT NULL,
nationality 	VARCHAR(50),
adress 			VARCHAR(300),
zipCode 		VARCHAR(20),
residence		VARCHAR(150)
);

COMMENT ON TABLE be_alap.nonRegisteredClient IS 'Non user on db';
COMMENT ON COLUMN be_alap.nonRegisteredClient.nonclientId IS 'Unique non user id';
COMMENT ON COLUMN be_alap.nonRegisteredClient.noncName IS 'Non User name';
COMMENT ON COLUMN be_alap.nonRegisteredClient.noncsurname IS 'Non User surname';
COMMENT ON COLUMN be_alap.nonRegisteredClient.noncbirthdate IS 'Non Users birthdate';
COMMENT ON COLUMN be_alap.nonRegisteredClient.email IS 'Non Users email';
COMMENT ON COLUMN be_alap.nonRegisteredClient.nationality IS 'Non Users nationality';
COMMENT ON COLUMN be_alap.nonRegisteredClient.adress IS 'Non Users residence adress';
COMMENT ON COLUMN be_alap.nonRegisteredClient.zipCode IS 'Non Users residence zipcode';
COMMENT ON COLUMN be_alap.nonRegisteredClient.residence IS 'Non Users region';

DROP TABLE IF EXISTS be_alap.gender CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.gender (
genId INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
genderName VARCHAR (20) NOT NULL
);

COMMENT ON TABLE be_alap.gender IS 'Clients gender';
COMMENT ON COLUMN be_alap.gender.genId IS 'gender unique id';
COMMENT ON COLUMN be_alap.gender.genderName IS 'gender name';

ALTER TABLE be_alap.registeredClient
ADD COLUMN genId INTEGER
REFERENCES be_alap.gender(genId);

ALTER TABLE be_alap.nonRegisteredClient
ADD COLUMN genId INTEGER
REFERENCES be_alap.gender(genId);

DROP TABLE IF EXISTS be_alap.treatment CASCADE;
CREATE TABLE IF NOT EXISTS be_alap.treatment(
treatId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
treatName VARCHAR(20) NOT NULL
);

COMMENT ON TABLE be_alap.treatment IS 'How to refer to the client';
COMMENT ON COLUMN be_alap.treatment.treatId IS 'treatment unique id';
COMMENT ON COLUMN be_alap.treatment.treatName IS 'treatment name';

ALTER TABLE be_alap.registeredClient
ADD COLUMN treatId INTEGER
REFERENCES be_alap.treatment(treatId);

ALTER TABLE be_alap.nonRegisteredClient
ADD COLUMN treatId INTEGER
REFERENCES be_alap.treatment(treatId);

DROP TABLE IF EXISTS be_alap.natDocument CASCADE;
CREATE TABLE IF NOT EXISTS be_natDocument (
docId INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
docName VARCHAR(25),
value VARCHAR(40)
);

COMMENT ON TABLE be_alap.natDocument IS 'Clients document';
COMMENT ON COLUMN be_alap.natDocument.docId IS 'Document unique id';
COMMENT ON COLUMN be_alap.natDocument.docName IS 'Documents name -DNI, passport-';
COMMENT ON COLUMN be_alap.natDocument.docValue IS 'Document value';

ALTER TABLE be_alap.registeredClient
ADD COLUMN docId INTEGER
REFERENCES be_alap.natDocument(docId);

ALTER TABLE be_alap.nonRegisteredClient
ADD COLUMN docId INTEGER
REFERENCES be_alap.natDocument(docId);
