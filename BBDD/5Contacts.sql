DO $$
    DECLARE
     	mssgIncrement integer;
        clientReference integer;
        contactReference integer;
        clientAddedQuantity integer := floor(random()*100);
      	chat VARCHAR;
    	mssgTime TIMESTAMP;  
BEGIN
    DELETE FROM practicas_alap.message;
    ALTER SEQUENCE practicas_alap.message_mssgid_seq RESTART WITH 1;
    FOR contactSend IN SELECT clientid FROM practicas_alap.client LOOP
        INSERT INTO practicas_alap.message ( clientsend, clientreceive, mssgdate, mssgcontent)
        SELECT
            contactSend as clientsend ,
            c.clientid as clientreceive,
            now() - '1 year'::INTERVAL * (random() * 2),
            'Ola k ase? jaja Bien y tú?'
        FROM
            practicas_alap.client c
        WHERE
            c.clientid != contactSend
        order by random() limit clientAddedQuantity;
        END LOOP;
END $$;