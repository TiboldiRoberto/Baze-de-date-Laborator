USE universitate;
INSERT INTO specializare (id_specializare,id_facultate,denumire) VALUES ("0","0","TI");

insert into persoana (cnp,serie,nr,prenume,nume,adresa,nationalitate) values ("1234567890123", "SB","ION","POPA","Victoriei");

insert into persoana (serie,nr,prenume,nume,adresa,nationalitate) values ( "SB","123456","ION","POPA","Victoriei","romana");

insert into persoana(cnp,serie,nr,prenume,nume,adresa,nationalitate) values (1234567890146,"SB",1223,"ION","MIHAI","Ghioceilor","romana");  

insert into persoana(
cnp,
serie,
nr,
prenume,
nume,
adresa,
nationalitate)
VALUES 
(1234567890147,"SB",1223,"Ziber","Hans","Primaveri","germana"),
(1234567890233,"SB",1253,"IONICA","MIHAI","Ghioceilor","romana"),
(1234567892434,"ZV",1223,"POPESCU","MIHAI","Ghioceilor","romana"),
(1234567890243,"SB",1723,"MARIN","ANA","Ghioceilor","romana"),
(1234567823433,"SB",1253,"MARIAN","IONELA","Ceva","romana"),
(1234567890124,"BV",1923,"BARSAN","MIHAI","Ghioceilor","romana"),
(1234567864344,"SB",1823,"IONESCU","DANIELA","Ghioceilor","romana");

insert into facultate(
id,
denumire,
adresa,
an_fondare,
decan
) VALUES (1,"Lucian Blaga","Emil Cioran",YEAR('1990/10/01'),"Xulescu");

insert into facultate(
id,
denumire,
adresa,
an_fondare
) VALUES (2,"Unibuc","Academiei",YEAR('1980/10/01')),
(3,"UTCN","Altundeva",YEAR('1985/10/01')),
(4,"UBB","Undeva",YEAR('1980/10/01'));

insert into specializare(
id_specializare,
id_facultate,
denumire
) VALUES 
(10,4,"C"),
(11,4,"TI"),
(12,4,"ISM"),
(13,1,"EM"),
(14,1,"IEDM"),
(15,1,"EA");

insert into materie(
id_materie,
id_specializare,
denumire,
an_de_studiu,
semestru,
profesor
) VALUES 
(2,2,"POO",2,1,"B"),
(3,2,"Electronica",2,1,"Vu"),
(4,2,"Asamblare",2,1,"B"),
(5,2,"Teoria Sistemelor",2,1,"G"),
(6,2,"Statistica",2,1,"Vi"),
(7,2,"Proiectare Software",2,2,"X"),
(8,2,"Grafica",2,2,"B"),
(9,2,"Programare Web",2,2,"R"),
(10,2,"Masuratori",2,2,"Y")
;

insert into student (
	nr_matricol,
	id_specializare,
    cnp,
    an_curent,
    grupa,
    semestru
) VALUES 
(1,2,"1234567823433",2021,"234",1),
(2,2,"1234567864344",2021,"235",1),
(3,2,"1234567890123",2021,"235",1),
(4,2,"1234567890124",2021,"235",1),
(5,1,"1234567890145",2021,"231",1),
(6,1,"1234567890146",2021,"232",1),
(7,1,"1234567890147",2021,"233",1),
(8,2,"1234567890233",2021,"235",1),
(9,2,"1234567890243",2021,"234",1),
(10,2,"1234567892434",2021,"234",1);

insert into nota (
	id_nota,
    id_student,
    id_curs,
    nota
) VALUES 
(1,1,1,10),
(2,2,1,9),
(3,3,1,10),
(4,4,1,9),
(5,5,1,10),
(6,6,1,5),
(7,7,1,8),
(8,8,1,10),
(9,9,1,7),
(10,10,1,10),

(11,1,2,9),
(12,2,2,10),
(13,3,2,9),
(14,4,2,10),
(15,5,2,9),
(16,6,2,10),
(17,7,2,8),
(18,8,2,10),
(19,9,2,8),
(20,10,2,4);


insert into nota (
data_examen
)
VALUES
(2021-09-03),
(2019-10-09),
(2020-12-12),
(2018-09-20),
(2021-09-24),
(2016-11-27),
(2020-09-03),
(2011-09-03),
(2018-09-03),
(2021-09-03);

describe nota;
describe student;

select * from student;