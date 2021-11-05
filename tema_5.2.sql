-- 1 Experimentați folosirea operatorului EXPLAIN în câteva (min 4) din exercițiile rezolvate la temele anterioare.

EXPLAIN SELECT * FROM specializare;
EXPLAIN SELECT AVG(nota) AS media_notelor FROM nota;
EXPLAIN SELECT 
	data_examen,
    CURRENT_DATE(),
    DATEDIFF(CURRENT_DATE(), data_examen) AS vechime
FROM
    nota
LIMIT 10;
EXPLAIN 
SELECT 
    CONCAT(serie, ' ', nr) AS serie_buletin,
    CONCAT(prenume, ' ', nume) AS nume_complet
FROM
    persoana;

-- 2. Enumerați toate facultățile și specializările în același set de rezultate. Afișați denumirea lor și valoarea cheii principale.
-- Ordonați rezultatul într-o manieră alfabetică inversată în funcție de denumirea specializarii.

SELECT id,denumire from facultate
UNION
SELECT id_specializare,denumire from specializare ORDER BY denumire desc;


--  3. Afișați toate notele distincte din baza de date și numărul de studenți care au luat notele respective. 
select nota, count(nota) as nr_note from nota group by nota order by nota;

-- 4. Identificați persoanele care fac parte din aceeași familie (au același nume și locuiesc la aceeași adresa. 
-- Grupați înregistrările din tabela persoane după nume și adresă. Afișați doar persoanele care locuiesc în București.

select nume as Nume_familie, adresa as Adresa_familie, count(nume) as nr_membri_familie from persoana group by nume,adresa having nr_membri_familie>1;

-- 5. Găsiți variante de a simula operatorul INTERSECT folosind alți operatori care se regasesc in MySQL.
-- Prin union
SELECT id,denumire 
from facultate
WHERE id IN (SELECT id_specializare from specializare);

-- https://www.mysqltutorial.org/mysql-intersect/