DO $$
declare
mssgIncrement integer;
contactSend integer;
contactReceive integer;
clientAddedQuantity integer := 5;
chat VARCHAR;
mssgTime TIMESTAMP;
BEGIN
DELETE FROM practicas_ezed.message;
ALTER SEQUENCE practicas_ezed.message_mssgid_seq RESTART WITH 1;

FOR contactSend IN SELECT clientid FROM practicas_ezed.client LOOP
INSERT INTO practicas_ezed.message ( clientsend, clientreceive, mssgdate, mssgcontent)
SELECT
contactSend as clientsend ,
c.clientid as clientreceive,
now() - '1 year'::INTERVAL * (random() * 2),
'Ola k ase? jaja Bien y tú?'
FROM
practicas_ezed.client c
WHERE
c.clientid != contactSend
order by random() limit clientAddedQuantity;




END LOOP;
END $$;