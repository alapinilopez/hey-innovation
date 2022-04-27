DO $$
    DECLARE
        titleArt VARCHAR(50) := 'Kojima vuelve a Konami';
        summaryArt VARCHAR(50) := 'El genio japonés vuelve a Konami';
        artText VARCHAR;
       	randomBool BOOLEAN;
        randomStatus INTEGER;
        incrementer INTEGER;
        post TIMESTAMP;
       	expiration TIMESTAMP;
       
    BEGIN
        DELETE FROM practicas_alap.article;
        ALTER SEQUENCE practicas_alap.article_artid_seq RESTART WITH 1;
        FOR incrementer IN SELECT clientid FROM practicas_alap.client LOOP
	        artText := REPEAT('Se confirma el desarrollo de Metal Gear Solid Remake -ojalá- ', (FLOOR(RANDOM()*5 + 1)::INT));
            post := now() - '1 year'::INTERVAL * (random() * 15);
	        randomBool := RANDOM()::INT::BOOLEAN;
            IF randomBool = TRUE
	            THEN
            		expiration := post + INTERVAL '24 hour';
            	ELSE
            		expiration := NULL;
            END IF;
            
	         SELECT statid INTO randomStatus FROM practicas_alap.status ORDER BY random() LIMIT 1; --importante
             INSERT INTO practicas_alap.article(clientid, statid, title, postdate, summary, artcontent, isnews, expirationdate)
             SELECT 
                incrementer ,
                    randomStatus,
                    titleArt,
                    post,
                    summaryArt,
                    artText,
                    randomBool,
                    expiration;
        END LOOP;
    END $$;
    -- select que devuelva todas las comunas para insert 
    -- isnew random postdate