-- 3.2 Laborator 

-- p3 
SELECT * FROM facultate WHERE id % 2 !=0; 
-- p4 
SELECT * FROM persoana WHERE nume LIKE '%a%';
-- p5 
SELECT * FROM student WHERE semestru='2' AND bursa='1';
-- p6 
SELECT nume FROM persoana ORDER BY nume;
-- p7 
SELECT nume FROM persoana ORDER BY nume LIMIT 10;
-- p8
SELECT decan FROM facultate WHERE an_fondare BETWEEN 1900 AND 1995;
SELECT decan FROM facultate WHERE an_fondare> 1900 AND an_fondare<1995;
SELECT decan FROM facultate WHERE an_fondare LIKE '%19%';
-- P9
INSERT INTO materie (id_materie,id_specializare,denumire,an_de_studiu,semestru,profesor) VALUES (11,1,"Etica",2,2,"Popescu");
-- P10
DELETE FROM materie WHERE denumire LIKE '%tica';
-- P11
SELECT id_specializare,id_facultate,denumire FROM specializare;
SELECT * FROM specializare;



describe materie;