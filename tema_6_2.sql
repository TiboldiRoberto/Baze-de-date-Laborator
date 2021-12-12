-- 1. Listează ID-ul și numele specializărilor de la facultatea X (alege tu string-ul X).

SELECT 
	specializare.id_specializare,
   	specializare.denumire AS nume_specializare,
    facultate.denumire AS nume_facultate
FROM facultate
join specializare
ON facultate.denumire = "Lucian Blaga";

-- 2. Afișează numele specializării care are cele mai multe cursuri. (opțional, rezolvati prin doua metode)

select 	specializare.denumire,
		COUNT(materie.id_materie) as nr_cursuri 
from materie 
JOIN specializare 
ON materie.id_specializare = specializare.id_specializare
group by materie.id_specializare 
ORDER BY nr_cursuri desc limit 1;


-- 3. Afișează un set de informații care să conțină următoarele: numărul matricol al studentului, numele studentului, prenumele studentului, numele specializării
select 	student.nr_matricol,
		persoana.nume,
        persoana.prenume,
        specializare.denumire as denumire_specializare
from student
JOIN persoana
ON student.cnp = persoana.cnp
JOIN specializare
ON student.id_specializare = specializare.id_specializare;

-- 4. Afișează un set de informații care să conțină următoarele: nota, numele și prenumele studentului (într-o singură coloană),numele materiei pentru care a fost primită nota

select nota.nota, 
    concat(persoana.nume," ",persoana.prenume) as nume_complet,
    materie.denumire as denumire_materie
FROM nota
JOIN student
ON nota.id_student=student.nr_matricol
JOIN persoana
ON student.cnp = persoana.cnp
JOIN materie
ON nota.id_curs = id_materie;

-- 5. Afișează numele și codul matricol al studentilor din anul 2(inlocuit cu semestrul 2) care au cel puțin o notă mai mică decât 5.

select persoana.nume,
student.nr_matricol
FROM student
JOIN persoana
ON student.cnp = persoana.cnp AND student.semestru = 2
JOIN nota
ON student.nr_matricol = nota.id_student AND nota.nota < 5;

-- Varianta 2 (Cel mai corect )

select distinct(id_student) as cod_matricol, persoana.nume
from nota
join student
on nota.id_student = student.nr_matricol
join persoana
on persoana.cnp= student.cnp
where nota<5 AND semestru=2;