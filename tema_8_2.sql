-- 1. Afișați numele și prenumele studentilor care au numele similar cu numele unui profesor. 
-- În baza de date, numele profesorului este un singur câmp, dar conține 2 câmpuri logice (prenume și nume) 
-- iar ordinea lor nu este definită. Găsiți soluții inteligente pentru a rezolva această problemă.

select persoana.nume,
persoana.prenume,
substring_index(materie.profesor, ' ', 1) as nume_profesor,
substring_index(materie.profesor, ' ', -1) as prenume_profesor
from persoana
JOIN student
ON persoana.cnp = student.cnp
CROSS JOIN materie
where persoana.nume LIKE substring_index(materie.profesor, ' ', 1) OR persoana.nume LIKE substring_index(materie.profesor, ' ', -1) 
;

select profesor, 
substring_index(profesor, ' ', 1) as nume, 
substring_index(profesor, ' ', -1) as prenume,
concat_ws(' ',substring_index(profesor, ' ', -1), substring_index(profesor, ' ', 1)) as prenume_nume
from materie;



-- 2. E sfarsit de an, secretara vrea să facă o listă din baza de date cu toți studenții care nu au fost sau 
-- nu au luat nici un examen. Afișează codul matricol și id-ul facultății al acelor studenți. Rezultatul 
-- trebuie sortat după denumirea facultăților.

select id_student as nr_matricol, AVG(nota) AS media_notelor  
from nota 
group by id_student 
having media_notelor<5;

select facultate.denumire  from nota
join materie
on nota.id_curs = materie.id_materie
join specializare
on materie.id_specializare= specializare.id_specializare
join facultate
on specializare.id_facultate = facultate.id
group by id_curs
order by facultate.denumire;

-- Rezultat final:

select id_student as nr_matricol, AVG(nota) AS media_notelor , facultate.denumire, facultate.id
from nota 
join materie
on nota.id_curs = materie.id_materie
join specializare
on materie.id_specializare= specializare.id_specializare
join facultate
on specializare.id_facultate = facultate.id
group by id_student 
having media_notelor<5
order by facultate.denumire;

-- Varianta fara join :)
select *,
	(select id_facultate 
	from specializare
	where 
	specializare.id_specializare = student.id_specializare ) As 'Id_facultate'
from student
where nr_matricol IN (
select id_student 
from nota 
group by id_student 
having AVG(nota)<5);

select * from nota where nota not in (select nota from nota where nota>4);


select * from student where nr_matricol not in (select distinct(nota.id_student) from nota where nota>=5 );

select distinct(id_student) from nota where nota>=5 ;


select * from student
left join nota
on student.nr_matricol = nota.id_student
where id_nota is null;










-- 3. Hai sa vedem care sunt cei mai buni studenți. Afișează numele, prenumele, facultatea și media notelor primilor 10 studenți 
-- din fiecare facultate. Afișează rezultatul sortat după criterii:
-- denumire facultății
-- denumire specializarii

-- Rezolvare:

select persoana.nume, persoana.prenume,AVG(nota) AS media_notelor,facultate.denumire
from nota
join student
on nota.id_student = student.nr_matricol
join persoana 
on student.cnp = persoana.cnp
join materie
on nota.id_curs = materie.id_materie
join specializare
on materie.id_specializare = specializare.id_specializare
join facultate
on specializare.id_facultate = facultate.id
group by id_student 
order by media_notelor desc limit 3;


-- 4. Hai să vedem dacă profesorii respecta regulile. Afișează numele profesorilor care în 
-- ultimii 5 ani au stabilit examene în afara perioadelor de sesiune (1 Feb - 10 Martie | 10 Iunie - 8 Iulie).

select nota.data_examen,date_format(nota.data_examen, '%c-%d')as luna_zi, materie.profesor from nota
join materie
on  nota.id_curs = materie.id_materie 
where Year(nota.data_examen) > 2016 AND not (date_format(nota.data_examen, '%c-%d')) between "2-1" AND "3-10" AND "6-10" AND "7-8";

-- 5. Extrage din baza de date toate cuvintele (nume, denumiri, adrese, etc) care conțin litera “a”.

select * from facultate where  field("a", facultate.denumire);

select * from universitate.Tables;

SELECT
      TABLE_SCHEMA AS SchemaName
     ,TABLE_NAME AS TableName
     ,COLUMN_NAME AS ColumnName
 FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_SCHEMA = "universitate"
 ORDER BY
      SchemaName
     ,TableName
     ,ColumnName;


-- 6 (opțional) Universitatea vrea sa trimită mesaje de 8 Martie pentru toate doamnele și domnisoarele din mediul academic. Din păcate, nu avem nici o informație despre identitatea de gen a studenților. Trebuie să afișăm prenumele și numele tuturor persoanelor de sex feminin.
-- Hint-uri : 
-- Dacă prenumele se termină cu „a” este o șansă mare ca acea persoană să fie femeie
-- prima cifra din CNP variază mereu de la femei la bărbați, reușești să găsești o regulă?
-- corelați cele doua hint-uri de mai sus 2 și vedeți dacă aveți același rezultat
-- încercați să vă ajustați interogarea cu condiții suplimentare
-- dacă e prea simplu, sigur ți-a scăpat ceva :)

