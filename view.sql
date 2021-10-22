describe facultate;
select * from facultate;

describe materie;
select * from materie;

describe nota;
select * from nota;

describe persoana;
select * from persoana;

describe specializare;
select * from specializare;

describe student;
select * from student;

UPDATE student SET semestru='2',bursa='1' WHERE nr_matricol=7;
UPDATE facultate SET decan='Antoniu', an_fondare='2002' WHERE id=4;

INSERT INTO facultate (id,denumire,adresa,decan) VALUES (5,"UniTBv","Eroilor","Stan");

INSERT INTO nota (id_nota,id_student,id_curs,nota) VALUES (20,1,2,10);