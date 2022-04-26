-- Lista de usuarios y cantidad msg enviados y recibidos. Sort by clientid
SELECT clientid,
(SELECT COUNT(clientsend) AS clientsendcount FROM practicas_alap.message WHERE clientsend = clientid),
(SELECT COUNT(clientsend) AS clientreceivecount FROM practicas_alap.message WHERE clientreceive = clientid)
FROM practicas_alap.client;

-- Muestra los usuarios con más contactos de mayor a menor
SELECT c.clientid,
       (SELECT COUNT (1)
          FROM practicas_alap.contacts c2
         WHERE c2.clientid = c.clientid OR c2.clientadded = c.clientid) amigos
  FROM practicas_alap.client c
ORDER BY amigos DESC, clientid;

-- Muestra los datos de todos los articulos escritos
SELECT a.artid , length(a.artcontent), a.postdate , --  c.nickname, s.statname, num comentarios a modo de subquery
(SELECT c.nickname
FROM practicas_alap.client c WHERE a.clientid = c.clientid),
(SELECT s.statname 
FROM practicas_alap.status s WHERE a.statid = s.statid)
FROM practicas_alap.article a

-- Muestra los datos de las comunidades existentes. Nombre com, tipo com y nick del creador
SELECT c.commname, c4.typename, c3.nickname
FROM practicas_alap.community c
INNER JOIN practicas_alap.communitytype c4 ON c4.typeid = c.typeid 
LEFT JOIN practicas_alap.clientcommunity c2 ON c.commid = c2.commid
LEFT JOIN practicas_alap.client c3 ON c2.clientid = c3.clientid 
GROUP BY  c.commid, c2.commid, c2.iscreator,c2.ismod , c2.clientid, c3.clientid, c4.typename 
