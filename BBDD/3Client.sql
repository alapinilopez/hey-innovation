DO $$
DECLARE 
	nick VARCHAR;
	pwd VARCHAR;
	bd TIMESTAMP;
	tel VARCHAR;
	email VARCHAR;
	arr VARCHAR[] := ARRAY['ES', 'FR', 'DE'];
	country VARCHAR;
	esp_cities VARCHAR [] := '{"Madrid", "Sevilla", "Granada"}';
    fr_cities VARCHAR [] := '{"Paris", "Marseille", "Lyon"}';
    de_cities VARCHAR [] := '{"Berlin", "München", "Frankfurt"}';
    city varchar;
	profpic VARCHAR;
	bio VARCHAR;


BEGIN
	FOR i IN 1..100 LOOP 
		
		nick := CONCAT('user', i);
		pwd := CONCAT('pass', i);
		bd := now() - '1 year'::INTERVAL * (random() * 75);
		tel := CONCAT(555, '-',LPAD(FLOOR(RANDOM()* 999999)::TEXT, 6, '0'));
		email := CONCAT(nick, '@faisbuk.com');
		country := arr[floor(random() * array_length(arr, 1)) + 1];
		 case
                when country = 'ESP' then
                    city := (esp_cities)[floor(random() * 3 + 1)];
                when country = 'FR' then 
                    city := (fr_cities)[floor(random() * 3 + 1)];
                when country = 'DE' then 
                    city := (de_cities)[floor(random() * 3 + 1)];
                else
                    city := 'no country found';
            end case;

		profpic := CONCAT('http://img.com/', i);
		bio := REPEAT('Me gusta el furbo y la plei. ', (FLOOR(RANDOM()*5)::INT));
	
		RAISE NOTICE 'Nick: %', nick;
		RAISE NOTICE 'Password: %', pwd;
		RAISE NOTICE 'Birthdate: %', bd;
		RAISE NOTICE 'Phone Number: %', tel;
		RAISE NOTICE  'e-mail: %', email;
		RAISE NOTICE 'Country: %', country;
		RAISE NOTICE 'City: %', city;
		RAISE NOTICE 'Profile picture: %', profpic;
		RAISE NOTICE 'Biography: %', bio;
		
	
		INSERT INTO practicas_alap.client (nickname, 
											pass, 
											birthdate, 
											phonenum, 
											email, 
											country, 
											city, 
											profpic, 
											biography) 
		VALUES (nick,
				pwd,
				bd,
				tel,
				email,
				country,
				city,
				profpic,
				bio);
		
	END LOOP;
END $$