DELETE FROM practicas_alap.contacts;
ALTER SEQUENCE practicas_alap.contacts_contid_seq RESTART WITH 1;

DO $$
    declare
        clientReference integer;
        contactReference integer;
		clientAddedQuantity integer := floor(random()*100);
    BEGIN
        for clientReference in select clientid from practicas_alap.client loop
            insert into practicas_alap.contacts (clientid, clientadded)
                select
                    clientReference as clientid,
                    c.clientid as clientadded
                from
                    practicas_alap.client c
                where
                    c.clientid != clientReference 
                    and not exists(
                    select 1
                    from
                        practicas_alap.contacts c2
                    where
                    (c2.clientid = clientReference  and c2.clientadded = c.clientid )
                        or (c2.clientid = c.clientid and c2.clientadded = clientReference)
                ) order by random() limit clientAddedQuantity;
       end loop;
END $$;