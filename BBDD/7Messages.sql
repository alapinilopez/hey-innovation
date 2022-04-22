DO $$
    DECLARE
        contactSend integer;
        contactReceive integer;
        clientAddedQuantity integer := floor(random()*100);
       	chat VARCHAR;
       	mssgTime TIMESTAMP;
    BEGIN
        DELETE FROM practicas_alap.message;
        ALTER SEQUENCE practicas_alap.message_mssgid_seq RESTART WITH 1;
        FOR contactSend IN SELECT clientid FROM practicas_alap.client LOOP
            INSERT INTO practicas_alap.message  ( clientsend, clientreceive)
                SELECT
                    contactSend as clientsend ,
                    c.clientid  as clientreceive 
                FROM
                    practicas_alap.client c
                WHERE
                    c.clientid != contactSend 
                    AND NOT EXISTS(
                    SELECT 1
                    FROM
                        practicas_alap.message m
                    WHERE
                    (m.clientsend = contactSend AND m.clientreceive  = c.clientid )
                        OR (m.clientsend = c.clientid AND m.clientreceive  = contactSend);
                chat := REPEAT('Ola k ase? jaja Bien y tú?', (FLOOR(RANDOM()*5)::INT));
                mssgTime := now() - '1 year'::INTERVAL * (random() * 2);        
                )  
                ORDER BY random() LIMIT clientAddedQuantity;
               
               
       END LOOP;
END $$;