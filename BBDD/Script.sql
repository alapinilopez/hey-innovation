DROP TABLE IF EXISTS practicas_alap.Client CASCADE; 
CREATE TABLE IF NOT EXISTS practicas_alap.Client (
	clientId 	INTEGER GENERATED ALWAYS AS IDENTITY  PRIMARY KEY,
	nickName 	VARCHAR(20) NOT NULL,
	pass 		VARCHAR(35) NOT NULL,
	birthdate 	DATE NOT NULL,
	phoneNum 	VARCHAR (20),
	email 		VARCHAR(40) NOT NULL,
	country 	VARCHAR (3),
	city 		VARCHAR(50),
	profPic 	VARCHAR(255),
	biography 	VARCHAR(500)
);

COMMENT ON TABLE practicas_alap.Client IS 'Social Network users list';
COMMENT ON COLUMN practicas_alap.Client.clientId IS 'Unique user id';
COMMENT ON COLUMN practicas_alap.Client.nickname IS 'User custom nickname';
COMMENT ON COLUMN practicas_alap.Client.pass IS 'User custom password';
COMMENT ON COLUMN practicas_alap.Client.birthdate IS 'Users birthdate';
COMMENT ON COLUMN practicas_alap.Client.phoneNum IS 'Users phone number';
COMMENT ON COLUMN practicas_alap.Client.email IS 'Users email';
COMMENT ON COLUMN practicas_alap.Client.country IS 'Users living country';
COMMENT ON COLUMN practicas_alap.Client.city IS 'Users living city';
COMMENT ON COLUMN practicas_alap.Client.profPic IS 'Custom users profile picture';
COMMENT ON COLUMN practicas_alap.Client.biography IS 'Users defines himself';

DROP TABLE IF EXISTS practicas_alap.Contacts CASCADE;
CREATE TABLE IF NOT EXISTS practicas_alap.Contacts (
	contId 	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY

);

ALTER TABLE practicas_alap.Contacts 
ADD COLUMN clientId INTEGER
REFERENCES practicas_alap.Client(clientId);

ALTER TABLE practicas_alap.Contacts 
ADD COLUMN clientAdded INTEGER NOT NULL;
REFERENCES practicas_alap.Client(clientId);

COMMENT ON TABLE practicas_alap.contacts IS 'Clients contacts';
COMMENT ON COLUMN practicas_alap.contacts.contid IS 'Unique users contacts id';
COMMENT ON COLUMN practicas_alap.contacts.clientid IS 'Client FK';
COMMENT ON COLUMN practicas_alap.contacts.clientadded IS 'Client new contact';

DROP TABLE IF EXISTS practicas_alap.Article CASCADE;
CREATE TABLE IF NOT EXISTS practicas_alap.Article (
artId 			INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
clientId		INTEGER REFERENCES practicas_alap.Client(Clientid),
statId			INTEGER REFERENCES practicas_alap.Status(StatId),
favId			INTEGER REFERENCES practicas_alap.Favorites(FavId),
title 			VARCHAR(35) NOT NULL,
postDate 		TIMESTAMP NOT NULL,
summary 		VARCHAR(250) NOT NULL,
artContent 		VARCHAR(5000) NOT NULL,
isNews 			BOOLEAN,
expirationDate 	TIMESTAMP NOT NULL
);

COMMENT ON TABLE practicas_alap.article  IS 'Social network articles';
COMMENT ON COLUMN practicas_alap.article.artid  IS 'Unique article id';
COMMENT ON COLUMN practicas_alap.article.clientid  IS 'Client FK';
COMMENT ON COLUMN practicas_alap.article.title  IS 'Articles title';
COMMENT ON COLUMN practicas_alap.article.postdate  IS 'Post day and time';
COMMENT ON COLUMN practicas_alap.article.summary  IS 'Articles summary';
COMMENT ON COLUMN practicas_alap.article.artcontent  IS 'Articles body';
COMMENT ON COLUMN practicas_alap.article.isnews  IS 'Check if its a new';
COMMENT ON COLUMN practicas_alap.article.expirationdate  IS 'Destroy de new 24h later';

DROP TABLE IF EXISTS practicas_alap.Favorites CASCADE;
CREATE TABLE IF NOT EXISTS practicas_alap.Favorites (
favId 		INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
clientId	INTEGER REFERENCES practicas_alap.Client(Clientid),
artId 		INTEGER REFERENCES practicas_alap.Article(artId)
);

COMMENT ON TABLE practicas_alap.favorites IS 'Favorite articles tab';
COMMENT ON COLUMN practicas_alap.favorites.favid  IS 'Favorites unique id';
COMMENT ON COLUMN practicas_alap.favorites.clientid  IS 'Client FK';
COMMENT ON COLUMN practicas_alap.favorites.artid  IS 'Article FK';

DROP TABLE IF EXISTS practicas_alap.Status CASCADE;
CREATE TABLE IF NOT EXISTS practicas_alap.Status (
statId 		INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
statName 	VARCHAR(15) NOT NULL
);

COMMENT ON TABLE  practicas_alap.status IS 'Validate, delet, not posted status';
COMMENT ON COLUMN  practicas_alap.status.statid  IS 'Unique status id';
COMMENT ON COLUMN  practicas_alap.status.statname  IS 'Status name';

DROP TABLE IF EXISTS practicas_alap.communityType CASCADE;
CREATE TABLE IF NOT EXISTS practicas_alap.communityType (
typeId INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
typeName VARCHAR(30)
);

DROP TABLE IF EXISTS practicas_alap.community CASCADE;
CREATE TABLE IF NOT EXISTS practicas_alap.community (
commId 		INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
typeId		INTEGER REFERENCES practicas_alap.communityType(typeId),
commName 	VARCHAR(100) NOT NULL
);


COMMENT ON TABLE practicas_alap.community IS 'Social Network communities';
COMMENT ON COLUMN  practicas_alap.community.commId IS 'Unique community id';
COMMENT ON COLUMN  practicas_alap.community.commName IS 'Community name';

DROP TABLE IF EXISTS practicas_alap.subcommunity CASCADE;
CREATE TABLE IF NOT EXISTS practicas_alap.subcommunity (
subId 		INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
commId 		INTEGER REFERENCES practicas_alap.Community(commId),
commAlterId INTEGER REFERENCES practicas_alap.Community(commId)
);

COMMENT ON TABLE practicas_alap.subcommunity IS 'Subcommunities created from communities';
COMMENT ON COLUMN  practicas_alap.subcommunity.subid IS 'Subcommunity unique id';
COMMENT ON COLUMN  practicas_alap.subcommunity.commid IS 'Community FK';

DROP TABLE IF EXISTS practicas_alap.clientCommunity CASCADE;
CREATE TABLE IF NOT EXISTS practicas_alap.clientcommunity (
clientId 	INTEGER REFERENCES practicas_alap.Client(CLientId),
commId 		INTEGER REFERENCES practicas_alap.community(commid),
isCreator 	BOOLEAN NOT NULL, 
isMod 		BOOLEAN NOT NULL
);

COMMENT ON TABLE practicas_alap.clientcommunity  IS 'Intermediate table client-comms';
COMMENT ON COLUMN practicas_alap.clientcommunity.clientid  IS 'Client FK';
COMMENT ON COLUMN practicas_alap.clientcommunity.commid  IS 'Community FK';
COMMENT ON COLUMN practicas_alap.clientcommunity.iscreator  IS 'Check if client is a creator';
COMMENT ON COLUMN practicas_alap.clientcommunity.ismod  IS 'Check if client is a moderator';

DROP TABLE IF EXISTS practicas_alap.message CASCADE;
CREATE TABLE IF NOT EXISTS practicas_alap.message (
mssgId 			INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
clientSend 		INTEGER REFERENCES practicas_alap.client(clientid),
clientReceive 	INTEGER REFERENCES practicas_alap.client(clientid),
mssgDate 		TIMESTAMP NOT NULL,
mssgContent 	VARCHAR
);

COMMENT ON TABLE practicas_alap.message IS 'Messaging system storage';
COMMENT ON COLUMN practicas_alap.message.mssgId IS 'Message unique id';
COMMENT ON COLUMN practicas_alap.message.clientSend IS 'Message creator client FK';
COMMENT ON COLUMN practicas_alap.message.clientReceive IS 'Message receiver client FK';
COMMENT ON COLUMN practicas_alap.message.mssgDate IS 'Date and Time has been sent';
COMMENT ON COLUMN practicas_alap.message.mssgContent IS 'Content of the message';

DROP TABLE IF EXISTS practicas_alap.commentary CASCADE;
CREATE TABLE IF NOT EXISTS practicas_alap.commentary (
commId 		INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
clientId 	INTEGER REFERENCES practicas_alap.client(clientid),
artId 		INTEGER REFERENCES practicas_alap.article(artid),
statId 		INTEGER REFERENCES practicas_alap.status(statid),
commDate 	TIMESTAMP NOT NULL,
commContent VARCHAR(255)
);

COMMENT ON TABLE practicas_alap.commentary IS 'Commentaries system storage';
COMMENT ON COLUMN practicas_alap.commentary.commid  IS 'Commentary unique id';
COMMENT ON COLUMN practicas_alap.commentary.clientid  IS 'Client FK';
COMMENT ON COLUMN practicas_alap.commentary.artid  IS 'Article FK';
COMMENT ON COLUMN practicas_alap.commentary.statid  IS 'Status FK';
COMMENT ON COLUMN practicas_alap.commentary.commdate  IS 'Day and Hour commentary is done';
COMMENT ON COLUMN practicas_alap.commentary.commcontent  IS 'Commentary content';