DO $$
DECLARE 
	nick VARCHAR;
	pwd VARCHAR;
	bd TIMESTAMP;
	tel VARCHAR;
	email VARCHAR;
	country VARCHAR;
	city VARCHAR;
	profpic VARCHAR;
BEGIN
	FOR i IN 1..2 LOOP 
		
		nick := CONCAT('user', i);
		pwd := CONCAT('pass', i);
		bd := now() - '1 year'::INTERVAL * (random() * 75);
		tel := CONCAT(555, '-',LPAD(FLOOR(RANDOM()* 999999)::TEXT, 6, '0'));
		email := CONCAT(nick, '@faisbuk.com');
		/* country :=  (ARRAY['ES', 'FR', 'DE'])(floor(random() * 3 + 1 ]))); */
		/* city := */
		profpic := CONCAT('http://img.com/', i);
	
		RAISE NOTICE 'Nick: %', nick;
		RAISE NOTICE 'Password: %', pwd;
		RAISE NOTICE 'Birthdate: %', bd;
		RAISE NOTICE 'Phone Number: %', tel;
		RAISE NOTICE  'e-mail: %', email;
		RAISE NOTICE 'Country: %', country;
		RAISE NOTICE 'City: %', city;
		RAISE NOTICE 'Profile picture: %', profpic;
		
	
		/*INSERT INTO practicas_alap.client (nickname, 
											pass, 
											birthdate, 
											phonenum, 
											email, 
											country, city, profpic, biography) 
			VALUES (nick,
					CONCAT('ass', i),
				    );
		INSERT INTO practicas_alap.client  (pass) VALUES ('pass' + i::text);*/
	END LOOP;
END $$