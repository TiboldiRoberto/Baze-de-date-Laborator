-- 1. Listează ID-ul și denumirea specializărilor care aparțin facultăților fondate înainte de anul 1920.
select id_specializare, denumire from specializare WHERE id_facultate IN (select id from facultate Where an_fondare < 1910);

-- 2. Setează data examenului anul viitor, de ziua Europei, pentru toate notele corespunzătoare materiilor predate în anul 2 de studiu.

update nota
set data_examen = "2020-05-09"
Where id_curs in(SELECT	 id_materie FROM materie where semestru=2);

-- 3. Șterge toate persoanele care nu au adresa completată corect (NULL sau mai mică de 10 caractere) și nu sunt studenți înmatriculați. 
-- Se poate inlocui select cu delete
select * from persoana where (length(adresa)<10 OR adresa is null) AND (cnp NOT IN (select cnp from student));

-- 4. Afișează un set de informații care să conțină următoarele: 
-- numărul matricol al studentului
-- numele studentului
-- prenumele studentului
-- numele specializării

select nr_matricol,
(select nume from persoana where persoana.cnp = student.cnp) as nume, 
(select prenume from persoana where persoana.cnp = student.cnp) as prenume,
(select denumire from specializare where specializare.id_specializare = student.id_specializare) as specializare
from student
where student.cnp IN (select cnp from persoana);

select student.nr_matricol,persoana.nume, persoana.prenume, specializare.denumire AS specializare 
from persoana 
JOIN specializare
ON student.id_specializare = specializare.id_specializare
where persoana.cnp in (select cnp from student);

-- 5. Afișează numele și codul matricol al studentilor din anul 2 care au cel puțin o notă mai mică decât 5.

select student.nr_matricol, persoana.nume from student 
JOIN persoana
ON persoana.cnp = student.cnp
where an_curent = 2 AND nr_matricol IN (select distinct id_student from nota where nota<5);

-- (Optional) Anul acesta, de Ziua Aviaţiei Române, Profesorul Hermann Oberth vrea să le dea tuturor studenților săi câte 
-- o nota aleatoare (8, 9 sau 10) la toate materiile sale. Ca să-l ajuți ai putea sa faci un insert magic :) care să-i îndeplinească dorința.

-- am identificat toti studenti profesorului Hermann Oberth
select nr_matricol from student where id_specializare = (Select id_specializare from materie where profesor = 'Ho');


-- inseram valori aleatoare
SELECT FLOOR(RAND()*(11-8)+8);

-- inseram note 
insert into nota (
    id_student,
    id_curs,
    nota,
    data_examen
) VALUES 
(?,1,FLOOR(RAND()*(11-8)+8),'2021-07-20');



