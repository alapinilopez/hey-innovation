-- Lista de usuarios y cantidad msg enviados y recibidos. Sort by clientid
SELECT *
FROM 

-- Muestra los usuarios con más contactos de mayor a menor
SELECT *
FROM practicas_alap.contacts c 
ORDER BY clientid, clientadded DESC

-- Muestra los datos todos los articulos escritos
SELECT *
FROM practicas_alap.article a

-- Muestra los datos de las comunidades existentes. Nombre com, tipo com y nick del creador
SELECT c.commname, c4.typename, c3.nickname
FROM practicas_alap.community c
INNER JOIN practicas_alap.communitytype c4 ON c4.typeid = c.typeid 
INNER JOIN practicas_alap.clientcommunity c2 ON c.commid = c2.commid
INNER JOIN practicas_alap.client c3 ON c2.clientid = c3.clientid 
GROUP BY  c.commid, c2.commid, c2.iscreator,c2.ismod , c2.clientid, c3.clientid, c4.typename 
